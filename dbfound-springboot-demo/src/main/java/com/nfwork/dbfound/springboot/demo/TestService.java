package com.nfwork.dbfound.springboot.demo;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.nfwork.dbfound.starter.ModelExecutor;
import com.nfwork.dbfound.core.Context;

@Service
public class TestService {
	
	@Autowired
	ModelExecutor modelExecutor;
	
	public Object query(Context context) {
		Object object = null;
		object = modelExecutor.queryList(context, "user", null); //modelName=user  queryName为缺省 返回数据list<map>
		object = modelExecutor.queryList(context, "user", "listAll"); //modelName=user  queryName为listAll
		object = modelExecutor.queryList(context, "user", "listAll", User.class); //modelName=user  queryName为listAll 返回List<User>
		
		object = modelExecutor.queryOne(context, "user", "listAll"); //modelName=user  queryName为listAll 返回 Map
		object = modelExecutor.queryOne(context, "user", "listAll", User.class); //modelName=user  queryName为listAll 返回 User
		
		object = modelExecutor.query(context, "user", "listAll"); //modelName=user  queryName为listAll 返回QueryResponseObejct带总行数
		object = modelExecutor.query(context, "user", "listAll", User.class); //modelName=user  queryName为listAll 返回QueryResponseObejct带总行数
		
		return object;
	}
	
	@Transactional
	public void save(Context context) {
		modelExecutor.execute(context, "user", null); //modelName=user  executeName为缺省
		modelExecutor.execute(context, "user", "update"); //modelName=user  executeName为update
		
		//context保存userlist到param.userList; context.setParamData("userList", list);
		modelExecutor.batchExecute(context, "user", "update","param.userList");  //modelName=user  executeName为update 数据执行路径为param.userList
	}

}
