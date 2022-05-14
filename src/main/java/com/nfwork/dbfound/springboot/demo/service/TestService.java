package com.nfwork.dbfound.springboot.demo.service;

import com.nfwork.dbfound.springboot.demo.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.nfwork.dbfound.starter.ModelExecutor;

import java.util.Map;

@Service
public class TestService {
	
	@Autowired
	ModelExecutor modelExecutor;
	
	public Object query(Map param) {
		Object object = modelExecutor.queryList("test/user","listByName", param);
		return object;
	}

	public Object queryUser(User user) {
		Object object = modelExecutor.queryList("test/user","listByName", user, User.class);
		return object;
	}
	
	@Transactional
	public Object updateUserName(User user) {
		return modelExecutor.execute( "test/user", "updateName",user);
	}

}
