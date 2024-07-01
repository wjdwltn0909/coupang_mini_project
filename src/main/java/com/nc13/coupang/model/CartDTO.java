package com.nc13.coupang.model;

import lombok.Data;

@Data
public class CartDTO {
    private int id;
    private int itemId;
    private int itemValue;
    private int ownerId;
}
