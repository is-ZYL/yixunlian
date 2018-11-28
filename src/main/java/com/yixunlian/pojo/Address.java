package com.yixunlian.pojo;

import lombok.*;

import javax.persistence.Id;
import javax.persistence.Table;

/**
 * tb_address
 */
@EqualsAndHashCode(callSuper = true)
@Table(name = "tb_address")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder(toBuilder = true)
public class Address extends BasePojo {
    /**
     *
     */
    @Id
    private String citycode;

    /**
     *
     */
    private String cityname;

    /**
     *
     */
    private String pidcode;

    /**
     *
     */
    private String simplename;

    /**
     *
     */
    private Integer citylevel;

    /**
     *
     */
    private String areacode;

    /**
     *
     */
    private String postcode;

    /**
     *
     */
    private String py;

}