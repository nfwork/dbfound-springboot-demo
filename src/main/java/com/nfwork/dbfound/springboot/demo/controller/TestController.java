package com.nfwork.dbfound.springboot.demo.controller;

import com.nfwork.dbfound.springboot.demo.dto.User;
import com.nfwork.dbfound.springboot.demo.service.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.github.nfwork.dbfound.starter.ModelExecutor;
import com.github.nfwork.dbfound.starter.annotation.ContextAware;
import com.nfwork.dbfound.core.Context;

import java.util.Map;

@RestController
public class TestController {

	@Autowired
	TestService testService;

	@RequestMapping("query")
	public Object query(@RequestParam Map param) {
		return testService.query(param);
	}

	@RequestMapping("queryUser")
	public Object query(User user) {
		return testService.queryUser(user);
	}

	@RequestMapping("updateUserName")
	public Object updateUserName(User user) {
		return testService.updateUserName(user);
	}

	@RequestMapping("context")
	public Object context(@ContextAware Context context) {
		return context.getDatas();
	}
}
