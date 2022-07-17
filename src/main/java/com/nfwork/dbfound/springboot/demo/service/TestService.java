package com.nfwork.dbfound.springboot.demo.service;

import com.nfwork.dbfound.springboot.demo.dto.Role;
import com.nfwork.dbfound.springboot.demo.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.nfwork.dbfound.starter.ModelExecutor;

import java.util.Date;
import java.util.Map;

@Service
public class TestService {
	
	@Autowired
	ModelExecutor modelExecutor;
	
	public Object query(Map param) {
		Role[] role = {Role.ADMIN,Role.TEACHER, Role.STUDENT, null, null};

		param.put("status",true);
		param.put("role",role);
		Object object = modelExecutor.queryList("test/user","listByName", param);
		return object;
	}

	public Object queryUser(User user) {
		user.setStatus(true);
		user.setRole(Role.ADMIN);
		Object object = modelExecutor.queryList("test/user","listByName", user, User.class);
		return object;
	}
	
	@Transactional
	public Object updateUserName(User user) {
		user.setUserId(10);
		user.setUserName("小明");
		user.setCreate_date(new Date());
		return modelExecutor.execute( "test/user", "updateName",user);
	}

}
