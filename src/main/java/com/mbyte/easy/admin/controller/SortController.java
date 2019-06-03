package com.mbyte.easy.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mbyte.easy.admin.entity.Sort;
import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.service.ISortService;
import com.mbyte.easy.admin.service.IZbjService;
import com.mbyte.easy.common.controller.BaseController;
import com.mbyte.easy.common.web.AjaxResult;
import com.mbyte.easy.util.ExportExcel;
import com.mbyte.easy.util.PageInfo;
import com.mbyte.easy.util.ReptileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.List;

/**
* <p>
* 前端控制器
* </p>
* @author 会写代码的怪叔叔
* @since 2019-03-11
*/
@Controller
@RequestMapping("/admin/sort")
public class SortController extends BaseController {

    private String prefix = "admin/sort/";

    @Autowired
    private ISortService sortService;

    @Autowired
    private IZbjService zbjService;

    @Resource
    private HttpServletResponse response;

    /**
    * 查询列表
    *
    * @param model
    * @param pageNo
    * @param pageSize
    * @param sort
    * @return
    */
    @RequestMapping
    public String daoxu(Model model, @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo, @RequestParam(value = "pageSize", required = false, defaultValue = "20") Integer pageSize, String creatdateSpace, Sort sort, String fenlei, Long addr, String creatdate) {
        Page<Sort> page = new Page<Sort>(pageNo, pageSize);

        IPage<Sort> pageInfo = sortService.daoxu(page,fenlei,addr,creatdate);
        model.addAttribute("creatdateSpace", creatdateSpace);
        model.addAttribute("searchInfo", sort);
        model.addAttribute("pageInfo", new PageInfo(pageInfo));
        return prefix+"list";
    }

    /**
    * 添加跳转页面
    * @return
    */
    @GetMapping("addBefore")
    public String addBefore(){
        return prefix+"add";
    }
    /**
    * 添加
    * @param sort
    * @return
    */
    @PostMapping("add")
    @ResponseBody
    public AjaxResult add(Sort sort){

        sort.setCreatdate(LocalDateTime.now());
        return toAjax(sortService.save(sort));
    }
    /**
    * 添加跳转页面
    * @return
    */
    @GetMapping("editBefore/{id}")
    public String editBefore(Model model,@PathVariable("id")Long id){
        model.addAttribute("sort",sortService.getById(id));
        return prefix+"edit";
    }
    /**
    * 修改
    * @param sort
    * @return
    */
    @PostMapping("edit")
    @ResponseBody
    public AjaxResult edit(Sort sort){

        sort.setCreatdate(LocalDateTime.now());
        return toAjax(sortService.updateById(sort));
    }
    /**
    * 删除
    * @param id
    * @return
    */
    @GetMapping("delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable("id") Long id){

        QueryWrapper<Zbj> queryWrapper = new QueryWrapper<Zbj>();
        queryWrapper = queryWrapper.eq("fenlei_id",id);
        zbjService.remove(queryWrapper);
        return toAjax(sortService.removeById(id));
    }
    /**
    * 批量删除
    * @param ids
    * @return
    */
    @PostMapping("deleteAll")
    @ResponseBody
    public AjaxResult deleteAll(@RequestBody List<Long> ids){

        QueryWrapper<Zbj> queryWrapper = new QueryWrapper<Zbj>();
        queryWrapper = queryWrapper.eq("fenlei_id",ids);
        zbjService.remove(queryWrapper);
        return toAjax(sortService.removeByIds(ids));
    }

    /**
     * 抓取信息及导出excel
     * @return
     */
    @RequestMapping("export")
    @ResponseBody
    public String export(HttpServletRequest request,Long id) {

        QueryWrapper<Sort> queryWrapper = new QueryWrapper<Sort>();
        queryWrapper = queryWrapper.eq("id",id);
        Sort biao = sortService.getOne(queryWrapper);

        String tiaojian1 = biao.getFenlei();

        Long area = biao.getAddr();

        //将分类进行转码
        String nameUrl = ReptileUtil.urlEncodeURL(tiaojian1);

        String urlOne = "https://baoding.zbj.com/search/p/?type=new&kw=" + nameUrl + "&d=" + area;
        QueryWrapper <Zbj> queryWrapper1 = new QueryWrapper<Zbj>();
        queryWrapper1 = queryWrapper1.eq("fenlei_id",id);
        zbjService.remove(queryWrapper1);

        ReptileUtil tit = new ReptileUtil();
        tit.geInfo(urlOne,id,zbjService);

        Integer a = tit.sePageUrl(urlOne)[1];               //总页数

        if(a == 1) {

            //导出excel
            String tableid = request.getParameter("id");
            QueryWrapper<Zbj> queryWrapper2 = new QueryWrapper<Zbj>();
            queryWrapper2 = queryWrapper2.eq("fenlei_id", tableid);

            String sk = "猪八戒"+tiaojian1+area+"信息表";
            String[] rowsName = new String[]{"序号", "标题", "公司名称", "地址", "链接", "类型", "信誉度", "综合评分"};
            String filename1 = "猪八戒"+tiaojian1+area+"信息表";
            ExportExcel ex = new ExportExcel(sk, rowsName);
            try {
                response.setContentType("application/vnd.ms-excel;charset=utf-8");
                response.setHeader("Content-Disposition", "attachment;filename=" + new String((sk + ".xls").getBytes(), "iso-8859-1"));
               // List<Zbj> infoList = zbjService.list(queryWrapper2);
                List<Zbj> infoList = zbjService.selectAll(Long.valueOf(tableid));
                ex.exportPersonInfo(filename1, infoList);
                ex.saveExcel(response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            Integer j = tit.sePageUrl(urlOne)[0];               //第二页k值
            Integer k = tit.sePageUrl(urlOne)[2];               //第三页k值
            System.out.println(a + "bbbbbbbbbbbb");

            for (int i = 0; i < a; i++) {
//                if(i == 6) {
//                break;
//            } else {
                Integer h = j + (k * i);
                String urlTwo = "http://baoding.zbj.com/search/p/k" + h + ".html?type=new&kw=" + nameUrl + "&d=" + area;
                ReptileUtil titTwo = new ReptileUtil();
                titTwo.geInfo(urlTwo, id, zbjService);
                // }
            }
            //导出excel
            String tableid = request.getParameter("id");
            QueryWrapper<Zbj> queryWrapper2 = new QueryWrapper<Zbj>();
            queryWrapper2 = queryWrapper2.eq("fenlei_id", tableid);

            String sk = "猪八戒"+tiaojian1+area+"信息表";
            String[] rowsName = new String[]{"序号", "标题", "公司名称", "地址", "链接", "类型", "信誉度", "综合评分"};
            String filename1 = "猪八戒"+tiaojian1+area+"信息表";
            ExportExcel ex = new ExportExcel(sk, rowsName);
            try {
                response.setContentType("application/vnd.ms-excel;charset=utf-8");
                response.setHeader("Content-Disposition", "attachment;filename=" + new String((sk + ".xls").getBytes(), "iso-8859-1"));
               // List<Zbj> infoList = zbjService.list(queryWrapper2);
                List<Zbj> infoList = zbjService.selectAll(Long.valueOf(tableid));
                ex.exportPersonInfo(filename1, infoList);
                ex.saveExcel(response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }

}

