package com.mbyte.easy.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mbyte.easy.admin.entity.Sort;
import com.mbyte.easy.admin.entity.Vksort;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
public interface IVksortService extends IService<Vksort> {

    IPage<Vksort> daoxu(IPage<Vksort> page, String sort, String province, String creatdate);

}
