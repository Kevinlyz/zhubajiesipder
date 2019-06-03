package com.mbyte.easy.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mbyte.easy.admin.entity.Vk;
import com.mbyte.easy.admin.entity.Zbj;
import com.mbyte.easy.admin.mapper.VkMapper;
import com.mbyte.easy.admin.mapper.ZbjMapper;
import com.mbyte.easy.admin.service.IVkService;
import com.mbyte.easy.admin.service.IZbjService;
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
public class VkServiceImpl extends ServiceImpl<VkMapper, Vk> implements IVkService {

    @Resource
    VkMapper vkMapper;

    public List<Vk> selectAll(Long sortId){
        return vkMapper.selectAll(sortId);
    }
}
