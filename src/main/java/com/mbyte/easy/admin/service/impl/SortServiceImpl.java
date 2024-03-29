package com.mbyte.easy.admin.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbyte.easy.admin.entity.Sort;
import com.mbyte.easy.admin.mapper.SortMapper;
import com.mbyte.easy.admin.service.ISortService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
@Service
public class SortServiceImpl extends ServiceImpl<SortMapper, Sort> implements ISortService {

    @Resource
    private SortMapper sortMapper;

    @Override
    public IPage<Sort> daoxu(IPage<Sort> page, String fenlei, Long addr, String creatdate) {
        return sortMapper.daoxu(page,fenlei,addr,creatdate);
    }
}
