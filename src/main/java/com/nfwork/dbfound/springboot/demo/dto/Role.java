package com.nfwork.dbfound.springboot.demo.dto;

import com.nfwork.dbfound.model.enums.BaseEnum;

public enum Role implements BaseEnum<Role,Integer> {

    ADMIN(3),
    STUDENT(5),
    TEACHER(6)
    ;

    final int value;

    Role(int value){
        this.value = value;
    }

    public Integer getValue(){
        return value;
    }
}
