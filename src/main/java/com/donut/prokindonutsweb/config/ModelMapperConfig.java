package com.donut.prokindonutsweb.config;

import org.modelmapper.ModelMapper;
import org.modelmapper.convention.MatchingStrategies;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//해당 클래스 빈 설정
@Configuration
public class ModelMapperConfig {

    //Mapper 객체를 bean으로 등록
    @Bean
    public ModelMapper modelMapper(){
        ModelMapper modelMapper = new ModelMapper();
        modelMapper.getConfiguration()
                .setFieldMatchingEnabled(true) //필드 이름으로 직접 매핑할 수 있도록 설정 (getter/setter 없어도 가능)
                .setFieldAccessLevel(org.modelmapper.config.Configuration.AccessLevel.PRIVATE) // private 필드까지 접근 허용
                .setMatchingStrategy(MatchingStrategies.STRICT); //엄격한 매칭 전략 (필드 이름이 정확히 일치해야 매핑)
        return modelMapper;
    }
}
