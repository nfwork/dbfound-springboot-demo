package com.nfwork.dbfound.springboot.demo.configure;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.nfwork.dbfound.dto.ResponseObject;
import com.nfwork.dbfound.model.reflector.Reflector;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;
import java.io.IOException;

@Configuration
public class JacksonConfig {

    @Autowired
    ObjectMapper objectMapper;

    @PostConstruct
    public void objectMapper() {
        SimpleModule module = new SimpleModule();
        module.addSerializer(ResponseObject.class, new ResponseObjectDeserializer());
        objectMapper.registerModule(module);
    }

    public static class ResponseObjectDeserializer extends JsonSerializer<ResponseObject> {
        @Override
        public void serialize(ResponseObject responseObject, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
            jsonGenerator.writeStartObject();
            Reflector reflector = Reflector.forClass(responseObject.getClass());
            String[] properties = reflector.getGetablePropertyNames();
            for (String property : properties){
                Object value = null;
                try {
                    value = reflector.getGetInvoker(property).invoke(responseObject,null);
                } catch (Exception ignored) {
                }
                jsonGenerator.writeObjectField(property,value);
            }
            jsonGenerator.writeEndObject();
        }
    }
}

