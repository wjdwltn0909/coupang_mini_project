package com.nc13.coupang.model;

import lombok.Data;

@Data
public class UserDTO {
    private int id;
    private String username;
    private String password;
    private String nickname;
    private String name;
    private String address;
    private String phoneNumber;
    private int level;
}
