package com.nc13.coupang.model;

import lombok.Data;

import java.sql.Date;

@Data
public class OrderDTO {
    private int id;
    private Date orderDate;
    private int ordererId;
    private String deliveryAddress;
}
