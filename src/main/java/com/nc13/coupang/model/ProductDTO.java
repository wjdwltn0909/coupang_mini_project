package com.nc13.coupang.model;

import lombok.Data;

@Data
public class ProductDTO {
    private int id;
    private String name;
    private String details;
    private int price;
    private int stock;
    private String review;
    private String qna;
    private int writerId;
}
