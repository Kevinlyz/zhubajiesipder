package com.mbyte.easy.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mbyte.easy.admin.entity.*;
import com.mbyte.easy.admin.service.*;
import com.mbyte.easy.common.controller.BaseController;
import com.mbyte.easy.common.web.AjaxResult;
import com.mbyte.easy.util.ExportExcel;
import com.mbyte.easy.util.PageInfo;
import com.mbyte.easy.util.ReptileUtil;
import com.mbyte.easy.util.VkReptileUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
* <p>
* 前端控制器
* </p>
* @author 会写代码的怪叔叔
* @since 2019-03-11
*/
@Controller
@RequestMapping("/admin/tCompany")
public class TCompanyController extends BaseController  {

    private String prefix = "admin/tCompany/";

    @Resource
    private ITCompanyService tCompanyService;
    @Resource
    private IVksortService vksortService;

    @Resource
    private IVkService vkService;
    @Resource
    private ISortService sortService;

    @Resource
    private IZbjService zbjService;
    @Resource
    private HttpServletResponse response;

    /**
    * 查询列表
    *
    * @param model
    * @param pageNo
    * @param pageSize
    * @param tCompany
    * @return
    */
    @RequestMapping
    public String index(Model model,@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,@RequestParam(value = "pageSize", required = false, defaultValue = "20") Integer pageSize, String createTimeSpace, TCompany tCompany) {
        Page<TCompany> page = new Page<TCompany>(pageNo, pageSize);
        QueryWrapper<TCompany> queryWrapper = new QueryWrapper<TCompany>();
        if(!ObjectUtils.isEmpty(tCompany.getCompanyName())) {
            queryWrapper = queryWrapper.like("company_name",tCompany.getCompanyName());
         }
        if(!ObjectUtils.isEmpty(tCompany.getCompanyUrl())) {
            queryWrapper = queryWrapper.like("company_url",tCompany.getCompanyUrl());
         }
        if(!ObjectUtils.isEmpty(tCompany.getCompanyStates())) {
            queryWrapper = queryWrapper.like("company_states",tCompany.getCompanyStates());
         }
        if(!ObjectUtils.isEmpty(tCompany.getMyMarks())) {
            queryWrapper = queryWrapper.like("my_marks",tCompany.getMyMarks());
         }
        queryWrapper.orderByDesc("id");
        IPage<TCompany> pageInfo = tCompanyService.page(page, queryWrapper);
        model.addAttribute("searchInfo", tCompany);
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
    * @param tCompany
    * @return
    */
    @PostMapping("add")
    @ResponseBody
    public AjaxResult add(TCompany tCompany){
        return toAjax(tCompanyService.save(tCompany));
    }
    /**
    * 添加跳转页面
    * @return
    */
    @GetMapping("editBefore/{id}")
    public String editBefore(Model model,@PathVariable("id")Long id){
        model.addAttribute("tCompany",tCompanyService.getById(id));
        return prefix+"edit";
    }
    /**
    * 添加
    * @param tCompany
    * @return
    */
    @PostMapping("edit")
    @ResponseBody
    public AjaxResult edit(TCompany tCompany){
        return toAjax(tCompanyService.updateById(tCompany));
    }
    /**
    * 删除
    * @param id
    * @return
    */
    @GetMapping("delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable("id") Long id){
        return toAjax(tCompanyService.removeById(id));
    }
    /**
    * 批量删除
    * @param ids
    * @return
    */
    @PostMapping("deleteAll")
    @ResponseBody
    public AjaxResult deleteAll(@RequestBody List<Long> ids){
        return toAjax(tCompanyService.removeByIds(ids));
    }

    /**
     *@Author wangxudong
     *@Description:
     *@Date:
     **/
    @RequestMapping("vkGenerate")
    @ResponseBody
       public String vkGenerate(HttpServletRequest request, Long id) {

        QueryWrapper<Vksort> queryWrapper = new QueryWrapper<Vksort>();
        queryWrapper = queryWrapper.eq("id",id);
        Vksort biao = vksortService.getOne(queryWrapper);

        String tiaojian1 = biao.getSort();

        String area = biao.getProvince();


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
        tit.vkGenerateInfo(urlOne,id,tCompanyService);

        Integer a = tit.sePageUrl(urlOne)[1];               //总页数

        if(a == 1) {


        }else{
            Integer j = tit.sePageUrl(urlOne)[0];               //第二页k值
            Integer k = tit.sePageUrl(urlOne)[2];               //第三页k值
            System.out.println(a + "bbbbbbbbbbbb");

            for (int i = 0; i < a; i++) {

                //Integer h = j + (k * i);
                //http://www.epwk.com/fuwu/p2.html?z=%E6%B2%B3%E5%8C%97%E7%9C%81&k=%E8%BD%AF%E4%BB%B6%E5%BC%80%E5%8F%91
                String urlTwo = "http://www.epwk.com/fuwu/p"+(i+1)+".html?z="+areaUrl+ "&k=" + nameUrl;
                VkReptileUtil titTwo = new VkReptileUtil();
                titTwo.vkGenerateInfo(urlTwo, id, tCompanyService);
            }

        }

        return null;
    }


    /**
     *@Author wangxudong
     *@Description:
     *@Date:
     **/
    @RequestMapping("zbjGenerate")
    @ResponseBody
    public String zbjGenerate(HttpServletRequest request,Long id) {

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
        tit.zbjGenerateInfo(urlOne,id,tCompanyService);

        Integer a = tit.sePageUrl(urlOne)[1];               //总页数

        if(a == 1) {


        }else{
            Integer j = tit.sePageUrl(urlOne)[0];               //第二页k值
            Integer k = tit.sePageUrl(urlOne)[2];               //第三页k值
            System.out.println(a + "bbbbbbbbbbbb");

            for (int i = 0; i < a; i++) {

                Integer h = j + (k * i);
                String urlTwo = "http://baoding.zbj.com/search/p/k" + h + ".html?type=new&kw=" + nameUrl + "&d=" + area;
                ReptileUtil titTwo = new ReptileUtil();
                titTwo.zbjGenerateInfo(urlTwo, id,tCompanyService);

            }

        }

        return null;
    }

}

