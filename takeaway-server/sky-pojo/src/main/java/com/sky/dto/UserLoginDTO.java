package com.sky.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * 前台管理用户登录
 */
@Data
public class UserLoginDTO implements Serializable {

    private String code;

}
