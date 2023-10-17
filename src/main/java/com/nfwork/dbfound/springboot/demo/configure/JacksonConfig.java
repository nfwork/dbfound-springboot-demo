package com.nfwork.dbfound.springboot.demo.configure;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.nfwork.dbfound.dto.ResponseObject;
import com.nfwork.dbfound.util.JsonUtil;
import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import java.time.temporal.Temporal;
import java.util.Date;

@Configuration
public class JacksonConfig {

    @Autowired
    ObjectMapper objectMapper;

    @PostConstruct
    public void objectMapper() {
        SimpleModule module = new SimpleModule();
        module.addSerializer(ResponseObject.class, new JsonUtil.ResponseObjectDeserializer());
        module.addSerializer(Temporal.class, new JsonUtil.TemporalDeserializer());
        module.addSerializer(Enum.class, new JsonUtil.EnumDeserializer());
        module.addSerializer(Date.class, new JsonUtil.DateDeserializer());
        objectMapper.registerModule(module);
    }
}

