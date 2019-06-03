package com.mbyte.easy.admin.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbyte.easy.admin.entity.Vksort;
import com.mbyte.easy.admin.mapper.VksortMapper;
import com.mbyte.easy.admin.service.IVksortService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @Author: wqy
 * @Date: 2019-05-30 09:19
 * @Version 1.0
 */
@Service
public class VksortServiceImpl extends ServiceImpl<VksortMapper, Vksort> implements IVksortService {

    @Resource
    private VksortMapper vksortMapper;

    public IPage<Vksort> daoxu(IPage<Vksort> page, String sort, String province, String creatdate){
        return vksortMapper.daoxu(page,sort,province,creatdate);
    }
}
