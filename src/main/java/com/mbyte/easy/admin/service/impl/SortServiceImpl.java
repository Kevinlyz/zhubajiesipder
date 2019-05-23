package com.mbyte.easy.admin.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.mbyte.easy.admin.entity.Sort;
import com.mbyte.easy.admin.mapper.SortMapper;
import com.mbyte.easy.admin.service.ISortService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public List<Sort> getSort(Page<Sort> page) {
        return null;
    }
}
