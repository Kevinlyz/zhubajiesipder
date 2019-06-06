package com.mbyte.easy.admin.entity;

import com.mbyte.easy.common.entity.BaseEntity;
import java.time.LocalDateTime;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author 会写代码的怪叔叔
 * @since 2019-06-04
 */
@Data
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
public class TCompany extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 公司名称
     */
    private String companyName;

    /**
     * 公司地址
     */
    private String companyUrl;

    /**
     * 1：等待处理
2：正在联系
3：联系成功
4：无法联系
5：已废弃
     */
    private Integer companyStates;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 备注
     */
    private String myMarks;

    /**
     * 评分
     */
   private String score;

    /**
     * 信誉度
     */
    private Integer credit;

    /**
     * 成交量
     */
    private Integer num;


}
