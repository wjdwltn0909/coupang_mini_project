package com.nc13.coupang.service;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final String NAMESPACE = "com.nc13.mappers.ProductMapper";
//    @Autowired
//    private SqlSession session;
//
//    public String selectAll() {
//        return ;
//    }
//
//    public String selectOne(int id){
//
//    }
}
