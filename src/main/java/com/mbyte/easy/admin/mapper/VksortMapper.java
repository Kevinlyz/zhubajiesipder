package com.mbyte.easy.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mbyte.easy.admin.entity.Sort;
import com.mbyte.easy.admin.entity.Vksort;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
public interface VksortMapper extends BaseMapper<Vksort> {

    IPage<Vksort> daoxu(IPage<Vksort> page, String sort, String province, String creatdate);

}
