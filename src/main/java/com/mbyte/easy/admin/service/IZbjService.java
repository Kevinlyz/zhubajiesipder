package com.mbyte.easy.admin.service;

import com.mbyte.easy.admin.entity.Zbj;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-23
 */
public interface IZbjService extends IService<Zbj> {

    List<Zbj> selectAll(Long fenleiId);
}
