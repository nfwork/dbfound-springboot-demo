package com.nfwork.dbfound.springboot.demo;

import com.github.nfwork.dbfound.starter.ModelExecutor;
import com.nfwork.dbfound.core.Context;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(classes = App.class)
public class DbfoundTest {

    @Autowired
    ModelExecutor modelExecutor;

    @Test
    public void testExcelImport(){
        modelExecutor.execute(new Context(),"test/excel","import");
    }
}
