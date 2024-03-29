package com.mbyte.easy.admin.mapper;

import com.mbyte.easy.admin.entity.Vk;
import com.mbyte.easy.admin.entity.Zbj;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-23
 */
public interface ZbjMapper extends BaseMapper<Zbj> {

    List<Zbj> selectAll(Long fenleiId);
}
