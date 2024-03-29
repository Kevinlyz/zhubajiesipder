package com.mbyte.easy.admin.service.impl;

import com.mbyte.easy.admin.entity.Vk;
import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.mapper.VkMapper;
import com.mbyte.easy.admin.mapper.ZbjMapper;
import com.mbyte.easy.admin.service.IZbjService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-23
 */
@Service
public class ZbjServiceImpl extends ServiceImpl<ZbjMapper, Zbj> implements IZbjService {

    @Resource
    ZbjMapper zbjMapper;

    public List<Zbj> selectAll(Long fenleiId){
        return zbjMapper.selectAll(fenleiId);
    }

}
