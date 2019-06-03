package com.mbyte.easy.admin.entity;

import com.mbyte.easy.common.entity.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * @Author: wqy
 * @Date: 2019-05-29 21:31
 * @Version 1.0
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class Vk  extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 分类id
     */
    private Long sortId;

    /**
     * 类型
     */
    private String type;

    /**
     * 省份
     */
    private String province;

    /**
     * 标题
     */
    private String title;

    /**
     * 价格
     */
    private String price;

    /**
     * 成交量
     */
    private Integer num;

    /**
     * 评分
     */
    private String score;

    /**
     * 公司
     */
    private String company;

    /**
     * 公司链接
     */
    private String link;

}
