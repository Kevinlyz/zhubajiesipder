package com.mbyte.easy.admin.service.impl;

import com.mbyte.easy.admin.entity.TCompany;
import com.mbyte.easy.admin.mapper.TCompanyMapper;
import com.mbyte.easy.admin.service.ITCompanyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-06-04
 */
@Service
public class TCompanyServiceImpl extends ServiceImpl<TCompanyMapper, TCompany> implements ITCompanyService {

    @Resource
    private TCompanyMapper tCompanyMapper;

    /**
     *@Author wangxudong
     *@Description: 根据公司地址查询
     *@Date:
     **/
    @Override
   public TCompany selectByUrl( String companyUrl){
       return tCompanyMapper.selectByUrl(companyUrl);
   }
}
