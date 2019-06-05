package com.mbyte.easy.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mbyte.easy.admin.entity.Sort;
import com.mbyte.easy.admin.entity.Vk;
import com.mbyte.easy.admin.entity.Vksort;
import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.service.ISortService;
import com.mbyte.easy.admin.service.IVkService;
import com.mbyte.easy.admin.service.IVksortService;
import com.mbyte.easy.admin.service.IZbjService;
import com.mbyte.easy.common.controller.BaseController;
import com.mbyte.easy.common.web.AjaxResult;
import com.mbyte.easy.util.ExportExcel;
import com.mbyte.easy.util.PageInfo;
import com.mbyte.easy.util.ReptileUtil;
import com.mbyte.easy.util.VkReptileUtil;
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
@RequestMapping("/admin/vksort")
public class VksortController extends BaseController {

    private String prefix = "admin/vksort/";

    @Autowired
    private IVksortService vksortService;

    @Autowired
    private IVkService vkService;

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
    public String daoxu(Model model, @RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo, @RequestParam(value = "pageSize", required = false, defaultValue = "20") Integer pageSize, String creatdateSpace, Vksort vksort, String sort, String province, String creatdate) {
        Page<Vksort> page = new Page<Vksort>(pageNo, pageSize);

        IPage<Vksort> pageInfo = vksortService.daoxu(page,sort,province,creatdate);
        model.addAttribute("creatdateSpace", creatdateSpace);
        model.addAttribute("searchInfo", vksort);
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
    * @param vksort
    * @return
    */
    @PostMapping("add")
    @ResponseBody
    public AjaxResult add(Vksort vksort){

        vksort.setCreatdate(LocalDateTime.now());
        return toAjax(vksortService.save(vksort));
    }
    /**
    * 添加跳转页面
    * @return
    */
    @GetMapping("editBefore/{id}")
    public String editBefore(Model model,@PathVariable("id")Long id){
        model.addAttribute("sort",vksortService.getById(id));
        return prefix+"edit";
    }
    /**
    * 修改
    * @param vksort
    * @return
    */
    @PostMapping("edit")
    @ResponseBody
    public AjaxResult edit(Vksort vksort){

        vksort.setCreatdate(LocalDateTime.now());
        return toAjax(vksortService.updateById(vksort));
    }
    /**
    * 删除
    * @param id
    * @return
    */
    @GetMapping("delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable("id") Long id){

        QueryWrapper<Vk> queryWrapper = new QueryWrapper<Vk>();
        queryWrapper = queryWrapper.eq("sort_id",id);
        vkService.remove(queryWrapper);
        return toAjax(vkService.removeById(id));
    }
    /**
    * 批量删除
    * @param ids
    * @return
    */
    @PostMapping("deleteAll")
    @ResponseBody
    public AjaxResult deleteAll(@RequestBody List<Long> ids){

        QueryWrapper<Vk> queryWrapper = new QueryWrapper<Vk>();
        queryWrapper = queryWrapper.eq("sort_id",ids);
        vkService.remove(queryWrapper);
        return toAjax(vkService.removeByIds(ids));
    }

    /**
     * 抓取信息及导出excel
     * @return
     */
    @RequestMapping("export")
    @ResponseBody
    public String export(HttpServletRequest request,Long id,HttpServletResponse response) {

        QueryWrapper<Vksort> queryWrapper = new QueryWrapper<Vksort>();
        queryWrapper = queryWrapper.eq("id",id);
        Vksort biao = vksortService.getOne(queryWrapper);

        String tiaojian1 = biao.getSort();

        String area = biao.getProvince();

         //String aa = null;


        //将分类和地区进行转码
        String nameUrl = ReptileUtil.urlEncodeURL(tiaojian1);
        String areaUrl = ReptileUtil.urlEncodeURL(area);

        System.out.println("输出："+tiaojian1+area+nameUrl+areaUrl);

        /**
         * http://www.epwk.com/fuwu/?z=%E6%B2%B3%E5%8C%97%E7%9C%81&k=%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91
         * http://www.epwk.com/fuwu/?z=河北省&k=软件开发
         */

        String urlOne = "http://www.epwk.com/fuwu/?z=" + areaUrl + "&k=" + nameUrl;
        QueryWrapper <Vk> queryWrapper1 = new QueryWrapper<Vk>();
        queryWrapper1 = queryWrapper1.eq("sort_id",id);
        vkService.remove(queryWrapper1);

        VkReptileUtil tit = new VkReptileUtil();
        tit.geInfo(urlOne,id,vkService);

        Integer a = tit.sePageUrl(urlOne)[1];               //总页数

        if(a == 1) {

            //导出excel
            String tableid = request.getParameter("id");
            QueryWrapper<Vk> queryWrapper2 = new QueryWrapper<Vk>();
            queryWrapper2 = queryWrapper2.eq("sort_id", tableid);

            String sk = "一品威客"+area+tiaojian1+"类别信息表";
            String[] rowsName = new String[]{"序号", "标题","价格", "公司名称", "地址", "链接", "类型", "成交量", "综合评分"};
            String filename1 = "一品威客"+area+tiaojian1+"类别信息表";
            ExportExcel ex = new ExportExcel(sk, rowsName);
            try {
                response.setContentType("application/vnd.ms-excel;charset=utf-8");
                response.setHeader("Content-Disposition", "attachment;filename=" + new String((sk + ".xls").getBytes(), "iso-8859-1"));
               // List<Vk> infoList = vkService.list(queryWrapper2);
                List<Vk> infoList = vkService.selectAll(Long.valueOf(tableid));
                ex.exportPersonInfo1(filename1, infoList);
                ex.saveExcel(response);

                //aa = "1";

            } catch (Exception e) {
                e.printStackTrace();
            }
        }else{
            Integer j = tit.sePageUrl(urlOne)[0];               //第二页k值
            Integer k = tit.sePageUrl(urlOne)[2];               //第三页k值
            System.out.println(a + "bbbbbbbbbbbb");

            for (int i = 0; i < a; i++) {

                //Integer h = j + (k * i);
               //http://www.epwk.com/fuwu/p2.html?z=%E6%B2%B3%E5%8C%97%E7%9C%81&k=%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91
                String urlTwo = "http://www.epwk.com/fuwu/p"+(i+1)+".html?z="+areaUrl+ "&k=" + nameUrl;
                VkReptileUtil titTwo = new VkReptileUtil();
                titTwo.geInfo(urlTwo, id, vkService);
            }
            //导出excel
            String tableid = request.getParameter("id");
            QueryWrapper<Vk> queryWrapper2 = new QueryWrapper<Vk>();
            queryWrapper2 = queryWrapper2.eq("sort_id", tableid);

            String sk = "一品威客"+area+tiaojian1+"类别信息表";
            String[] rowsName = new String[]{"序号", "标题","价格", "公司名称", "地址", "链接", "类型", "成交量", "综合评分"};
            String filename1 = "一品威客"+area+tiaojian1+"类别信息表";
            ExportExcel ex = new ExportExcel(sk, rowsName);
            try {
                response.setContentType("application/vnd.ms-excel;charset=utf-8");
                response.setHeader("Content-Disposition", "attachment;filename=" + new String((sk + ".xls").getBytes(), "iso-8859-1"));
               // List<Vk> infoList = vkService.list(queryWrapper2);
                List<Vk> infoList = vkService.selectAll(Long.valueOf(tableid));


                ex.exportPersonInfo1(filename1, infoList);
                ex.saveExcel(response);
              //  aa = "1";

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return null;
    }

}

