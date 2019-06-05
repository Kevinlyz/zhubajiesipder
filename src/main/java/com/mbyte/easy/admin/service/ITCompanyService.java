package com.mbyte.easy.admin.service;

import com.mbyte.easy.admin.entity.TCompany;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-06-04
 */
public interface ITCompanyService extends IService<TCompany> {

    /**
     *@Author wangxudong
     *@Description: 根据公司地址查询
     *@Date:
     **/
    TCompany selectByUrl( String companyUrl);

}
