package com.nc13.coupang.service;

import com.nc13.coupang.model.CartDTO;
import com.nc13.coupang.model.ProductDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {
    private final String NAMESPACE = "com.nc13.mappers.CartMapper";

    @Autowired
    private SqlSession session;

    public List<CartDTO> selectAll(int userId) {
        return session.selectList(NAMESPACE + ".selectAll", userId);
    }

    public CartDTO selectOne(int cartId) {
        return session.selectOne(NAMESPACE + ".selectOne", cartId);
    }

    public void insert(CartDTO cartDTO) {
        session.insert(NAMESPACE + ".insert", cartDTO);
    }

}
