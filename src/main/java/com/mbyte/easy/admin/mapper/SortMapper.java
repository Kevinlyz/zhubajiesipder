package com.mbyte.easy.admin.mapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mbyte.easy.admin.entity.Sort;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
public interface SortMapper extends BaseMapper<Sort> {

    @Select("<script>"+ " SELECT "+ " * " + " FROM "+ "sort"+ " ORDER BY " + "creatdate DESC" + "</script>")
    IPage<Sort> daoxu(IPage<Sort> page);

}
