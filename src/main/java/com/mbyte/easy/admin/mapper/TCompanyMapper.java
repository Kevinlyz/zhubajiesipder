package com.mbyte.easy.admin.mapper;

import com.mbyte.easy.admin.entity.TCompany;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-06-04
 */
@Mapper
public interface TCompanyMapper extends BaseMapper<TCompany> {

 /**
 *@Author wangxudong
 *@Description: 根据公司地址查询
 *@Date:
 **/
 TCompany selectByUrl( String companyUrl);

}
