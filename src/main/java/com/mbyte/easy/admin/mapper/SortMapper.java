package com.mbyte.easy.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mbyte.easy.admin.entity.Sort;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
public interface SortMapper extends BaseMapper<Sort> {

    IPage<Sort> daoxu(IPage<Sort> page, String fenlei, Long addr, String creatdate);

}
