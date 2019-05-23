package com.mbyte.easy.admin.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mbyte.easy.admin.entity.Sort;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
public interface ISortService extends IService<Sort> {

    List<Sort> getSort(Page<Sort> page);

}
