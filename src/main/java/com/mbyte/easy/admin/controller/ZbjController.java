package com.mbyte.easy.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.service.IZbjService;
import com.mbyte.easy.common.controller.BaseController;
import com.mbyte.easy.common.web.AjaxResult;
import com.mbyte.easy.util.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.util.ObjectUtils;
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
@RequestMapping("/admin/zbj")
public class ZbjController extends BaseController  {

    private String prefix = "admin/zbj/";

    @Autowired
    private IZbjService zbjService;

    /**
    * 查询列表
    *
    * @param model
    * @param pageNo
    * @param pageSize
    * @param zbj
    * @return
    */
    @RequestMapping
    public String index(Model model,@RequestParam(value = "pageNo", required = false, defaultValue = "1") Integer pageNo,@RequestParam(value = "pageSize", required = false, defaultValue = "20") Integer pageSize, Zbj zbj) {
        Page<Zbj> page = new Page<Zbj>(pageNo, pageSize);
        QueryWrapper<Zbj> queryWrapper = new QueryWrapper<Zbj>();
        if(!ObjectUtils.isEmpty(zbj.getFenleiId())) {
            queryWrapper = queryWrapper.like("fenlei_id",zbj.getFenleiId());
         }
        if(!ObjectUtils.isEmpty(zbj.getName())) {
            queryWrapper = queryWrapper.like("name",zbj.getName());
         }
        if(!ObjectUtils.isEmpty(zbj.getAddr())) {
            queryWrapper = queryWrapper.like("addr",zbj.getAddr());
         }
        if(!ObjectUtils.isEmpty(zbj.getLink())) {
            queryWrapper = queryWrapper.like("link",zbj.getLink());
         }
        if(!ObjectUtils.isEmpty(zbj.getType())) {
            queryWrapper = queryWrapper.like("type",zbj.getType());
         }
        if(!ObjectUtils.isEmpty(zbj.getCredit())) {
            queryWrapper = queryWrapper.like("credit",zbj.getCredit());
         }
        if(!ObjectUtils.isEmpty(zbj.getScore())) {
            queryWrapper = queryWrapper.like("score",zbj.getScore());
         }
        IPage<Zbj> pageInfo = zbjService.page(page, queryWrapper);
        model.addAttribute("searchInfo", zbj);
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
    * @param zbj
    * @return
    */
    @PostMapping("add")
    @ResponseBody
    public AjaxResult add(Zbj zbj){
        return toAjax(zbjService.save(zbj));
    }
    /**
    * 添加跳转页面
    * @return
    */
    @GetMapping("editBefore/{id}")
    public String editBefore(Model model,@PathVariable("id")Long id){
        model.addAttribute("zbj",zbjService.getById(id));
        return prefix+"edit";
    }
    /**
    * 添加
    * @param zbj
    * @return
    */
    @PostMapping("edit")
    @ResponseBody
    public AjaxResult edit(Zbj zbj){
        return toAjax(zbjService.updateById(zbj));
    }
    /**
    * 删除
    * @param id
    * @return
    */
    @GetMapping("delete/{id}")
    @ResponseBody
    public AjaxResult delete(@PathVariable("id") Long id){
        return toAjax(zbjService.removeById(id));
    }
    /**
    * 批量删除
    * @param ids
    * @return
    */
    @PostMapping("deleteAll")
    @ResponseBody
    public AjaxResult deleteAll(@RequestBody List<Long> ids){
        return toAjax(zbjService.removeByIds(ids));
    }

}

