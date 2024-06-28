package com.nc13.coupang.service;

import com.nc13.coupang.model.UserDTO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserService {
    @Autowired
    private final SqlSession SESSION;

    private  final String NAMESPACE = "com.nc13.mappers.UserMapper";

    public UserDTO auth(UserDTO attempt) {
        // 우리가 이 안에서는 쿼리를 직접 적는 것이 아니라
        // UserMapper.xml 안에 있는 쿼리를 SESSION이 실행시킬 수 있도록
        // 코드를 작성하게 된다.

        // 이 쿼리의 결과는 무조건 1개의 결과만 나와야 하므로
        // SESSION의 selectOne을 실행시키고,
        // 실행시킬 쿼리의 id값과 파라미터를 같이 보내주게 된다.
        return SESSION.selectOne(NAMESPACE + ".auth", attempt);
    }

    public boolean validateUsername(String username) {
        return SESSION.selectOne(NAMESPACE + ".selectByUsername", username) == null;
    }

    public void register(UserDTO attempt) {
        SESSION.insert(NAMESPACE + ".register", attempt);

    }
}
