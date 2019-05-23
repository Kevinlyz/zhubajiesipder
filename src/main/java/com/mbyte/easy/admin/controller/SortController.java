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
import com.mbyte.easy.util.ChineseCharToEnUtil;
import com.mbyte.easy.util.ExportExcel;
import com.mbyte.easy.util.PageInfo;
import com.mbyte.easy.util.ReptileUtil;
import com.mbyte.easy.util.ChineseCharToEnUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.time.LocalDateTime;

/**
* <p>
* 前端控制器
* </p>
* @author 会写代码的怪叔叔
* @since 2019-03-11
*/
@Controller
@RequestMapping("/admin/sort")
public class SortController extends BaseController  {

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
    public String index(Model model,@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,@RequestParam(value = "pageSize", required = false, defaultValue = "20") Integer pageSize, String creatdateSpace, Sort sort) {
        Page<Sort> page = new Page<Sort>(pageNo, pageSize);

        IPage<Sort> pageInfo = sortService.daoxu(page);
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
        return toAjax(sortService.removeByIds(ids));
    }

    /**
     * 抓取信息及导出excel
     * @return
     */
    @GetMapping("export")
    @ResponseBody
    public String export(HttpServletRequest request) {


        String id = request.getParameter("id");
        QueryWrapper<Sort> queryWrapper = new QueryWrapper<Sort>();
        queryWrapper = queryWrapper.eq("id",id);

        Sort biao = sortService.getOne(queryWrapper);
        String tiaojian1 = biao.getFenlei();
        //String tiaojian2 = biao.getAddr();

        String nameUrl = ReptileUtil.urlEncodeURL(tiaojian1);
        //String nameUrl = ChineseCharToEnUtil.getFirstSpell(tiaojian1);                //将分类条件转码
        //String nameUrl2 = ChineseCharToEnUtil.getPingYin(tiaojian2);                  //将地区条件转成拼音
        //String nameUrl3 = ReptileUtil.urlEncodeURL(tiaojian2);                      //将地区条件转码
        //String nameUrl2 = tiaojian2;

        //System.out.println(tiaojian2+ "========================");
        System.out.println(nameUrl+ "============================");
        //System.out.println(nameUrl2+ "===========================");
        //System.out.println(nameUrl3+ "============================");

//        String urlTwo = "https://" + nameUrl2 + ".zbj.com/" + nameUrl + "/p.html?d=" + nameUrl3;
//        ReptileUtil tit = new ReptileUtil();
//        tit.getInfo(urlTwo,tiaojian1,nameUrl2,zbjService);


        //爬取分页的数据

        String urlOne = "https://baoding.zbj.com/search/p/?type=new&kw=" + nameUrl + "&d=3571";
        ReptileUtil tit = new ReptileUtil();
        tit.getInfo(urlOne, tiaojian1,zbjService);


        //导出excel
        QueryWrapper<Zbj> queryWrapper2 = new QueryWrapper<Zbj>();

        String sk = "猪八戒信息表";
        String[] rowsName = new String[]{"序号","标题","公司名称","地址","链接","类型","信誉度","综合评分"};
        String filename1 = "猪八戒信息表";
        ExportExcel ex = new ExportExcel(sk,rowsName);
        try {
            response.setContentType("application/vnd.ms-excel;charset=utf-8");
            response.setHeader("Content-Disposition","attachment;filename=" + new String((sk + ".xls").getBytes(),"iso-8859-1"));
            List<Zbj> infoList = zbjService.list(queryWrapper2);
            ex.exportPersonInfo(filename1,infoList);
            ex.saveExcel(response);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

}

