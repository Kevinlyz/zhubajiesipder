package com.mbyte.easy.admin.entity;

import com.mbyte.easy.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * <p>
 * 
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-22
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Sort extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 分类
     */
    private String fenlei;

    /**
     * 所属地区
     */
    private Long addr;

    /**
     * 创建时间
     */
    private LocalDateTime creatdate;


}
