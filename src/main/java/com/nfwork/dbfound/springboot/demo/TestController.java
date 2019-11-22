package com.nfwork.dbfound.springboot.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.github.nfwork.dbfound.starter.ModelExecutor;
import com.github.nfwork.dbfound.starter.annotation.ContextAware;
import com.nfwork.dbfound.core.Context;

@RestController
public class TestController {
	
	@Autowired
	ModelExecutor modelExecutor;
	
	@RequestMapping("query1")
	public Object query(@ContextAware Context context) {
		return modelExecutor.query(context, "sys/user", null);
	}
	
	@RequestMapping("query2")
	public Object query(String userName) {
		Context context = new Context();
		context.setParamData("user_name", userName);
		return modelExecutor.query(context, "sys/user", null);
	}

	@RequestMapping("context")
	public Object context(@ContextAware Context context) {
		return context.getDatas();
	}
}
