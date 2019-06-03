package com.mbyte.easy.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mbyte.easy.admin.entity.Vk;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-23
 */
public interface VkMapper extends BaseMapper<Vk> {

    List<Vk> selectAll(Long sortId);
}
