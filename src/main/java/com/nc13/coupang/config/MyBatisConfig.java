package com.nc13.coupang.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;

@Configuration
public class MyBatisConfig {
    // 컨트롤러, 서비스, 컨피겨레이션 같이 스프링 프레임워크가 직접 관리하는
    // 객체들 중 특수한 성격을 띄는 친구들은 우리가 직접 @Controller, @Service
    // 같은 어노테이션을 붙여주지만 만약 스프링 프레임워크가 직접 관리해야할 객체들 중
    // 특수한 성격을 띄지 않거나 아니면 별개의 라이브러리 객체일 경우에는 우리가
    // @Bean 이라는 어노테이션을 붙여주게 된다.
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        sqlSessionFactoryBean.setConfigLocation(new ClassPathResource("mybatis/mybatis-config.xml"));
        Resource[

                ] resources =
                new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mappers/*.xml");
        sqlSessionFactoryBean.setMapperLocations(resources);

        return sqlSessionFactoryBean.getObject();
    }

    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
