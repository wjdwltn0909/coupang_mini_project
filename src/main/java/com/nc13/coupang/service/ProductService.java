package com.nc13.coupang.service;

import com.nc13.coupang.model.ProductDTO;
import com.sun.jdi.NativeMethodException;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ProductService {
    private final String NAMESPACE = "com.nc13.mappers.ProductMapper";

    @Autowired
    private SqlSession session;

    public List<ProductDTO> selectAll() {

        return session.selectList(NAMESPACE + ".selectAll");
    }

    public ProductDTO selectOne(int id) {
        return session.selectOne(NAMESPACE + ".selectOne", id);
    }

    public void insert(ProductDTO attempt) {
        session.insert(NAMESPACE + ".insert", attempt);
    }

    public void update(ProductDTO attempt) {
        session.insert(NAMESPACE + ".update", attempt);
    }

    public void delete(int id) {
        session.delete(NAMESPACE + ".delete", id);
    }
}
