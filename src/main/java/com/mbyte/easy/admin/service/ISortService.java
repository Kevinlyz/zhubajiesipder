package com.mbyte.easy.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mbyte.easy.admin.entity.Sort;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
public interface ISortService extends IService<Sort> {

    IPage<Sort> daoxu(IPage<Sort> page, String fenlei, Long addr, String creatdate);

}
