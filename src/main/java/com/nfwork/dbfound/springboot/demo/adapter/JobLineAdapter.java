package com.nfwork.dbfound.springboot.demo.adapter;

import com.github.nfwork.dbfound.starter.ModelExecutor;
import com.nfwork.dbfound.core.Context;
import com.nfwork.dbfound.model.adapter.QueryAdapter;
import com.nfwork.dbfound.model.bean.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Component
public class JobLineAdapter implements QueryAdapter<Map> {

    @Autowired
    ModelExecutor modelExecutor;

    @Override
    @Transactional
    public void beforeQuery(Context context, Map<String, Param> params) {
        modelExecutor.execute(context, "job/jobLine", "init");
    }
}
