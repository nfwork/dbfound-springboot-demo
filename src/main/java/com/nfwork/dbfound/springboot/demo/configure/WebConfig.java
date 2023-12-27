package com.nfwork.dbfound.springboot.demo.configure;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.ArrayList;
import java.util.List;


@Configuration
public class WebConfig {

    @Bean
    public FilterRegistrationBean<AccessCheckFilter> urlFilter() {
        FilterRegistrationBean<AccessCheckFilter> registrationBean = new FilterRegistrationBean<>();
        registrationBean.setOrder(1);
        
        AccessCheckFilter urlFilter = new AccessCheckFilter();
        registrationBean.setFilter(urlFilter);
       
        List<String> list = new ArrayList<>();
        list.add("/*");
        registrationBean.setUrlPatterns(list);
        
        return registrationBean;
    }
}

