package com.mbyte.easy.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.mbyte.easy.admin.entity.Sort;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
public interface ISortService extends IService<Sort> {

    IPage<Sort> daoxu(IPage<Sort> page,String fenlei,String addr,String creatdate);

}
