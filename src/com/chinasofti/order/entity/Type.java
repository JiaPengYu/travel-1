package com.chinasofti.order.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * @Description Type
 * @Author WYR
 * @CreateTime 2019-04-29 18:35
 */
@Entity
@Table(name = "type")
public class Type {
    /**
     * 类型编号
     */
    private Integer typeId;
    /**
     * 类型名称
     */
    private String typeName;

    public Type() {
    }

    public Type(Integer typeId) {
        this.typeId = typeId;
    }

    @Id
    @Column(name = "type_id")
    public Integer getTypeId() {
        return typeId;
    }

    public void setTypeId(Integer typeId) {
        this.typeId = typeId;
    }

    @Column(name = "type_name")
    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
