package com.nc13.coupang.service;

import com.nc13.coupang.model.UserDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static org.apache.ibatis.session.LocalCacheScope.SESSION;

@Service
@RequiredArgsConstructor
public class UserService {
    @Autowired
    private final SqlSession SESSION;

    private final String NAMESPACE = "com.nc13.mappers.UserMapper";

    public UserDTO auth(UserDTO attempt) {
        return SESSION.selectOne(NAMESPACE + ".auth", attempt);
    }

    public boolean validateUsername(String username) {
        return SESSION.selectOne(NAMESPACE + ".selectByUsername", username) == null;
    }

    public void register(UserDTO attempt) {SESSION.insert(NAMESPACE + ".register", attempt); }
}
