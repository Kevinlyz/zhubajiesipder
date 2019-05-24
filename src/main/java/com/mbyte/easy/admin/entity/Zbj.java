package com.mbyte.easy.admin.entity;

import com.mbyte.easy.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-05-23
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Zbj extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 分类
     */
    private Long fenleiId;

    /**
     * 公司名称
     */
    private String name;

    /**
     * 地区
     */
    private String addr;

    /**
     * 链接
     */
    private String link;

    /**
     * 类型
     */
    private String type;

    /**
     * 信誉度
     */
    private String credit;

    /**
     * 综合评分
     */
    private String score;


}
