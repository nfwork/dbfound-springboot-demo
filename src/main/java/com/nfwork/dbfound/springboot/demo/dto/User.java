package com.nfwork.dbfound.springboot.demo.dto;

import com.nfwork.dbfound.model.reflector.Column;

public class User {

    Integer  userId;

    String userName;

    String userCode;

    @Column(name = "role_id")
    Integer role;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public Integer getRole() {
        return role;
    }

    public void setRole(Integer role) {
        this.role = role;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }


}
