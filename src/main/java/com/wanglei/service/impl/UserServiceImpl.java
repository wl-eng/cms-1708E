package com.wanglei.service.impl;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanglei.common.CmsUtils;
import com.wanglei.mapper.UserMapper;
import com.wanglei.entity.User;
import com.wanglei.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	UserMapper UserMapper;

	@Override
	public User getUserByUsername(String username) {
		// TODO Auto-generated method stub
		return UserMapper.findUserByName(username);
	}

	@Override
	public int register(@Valid User user) {
		// TODO Auto-generated method stub
		// 计算密文
		String encryPwd = CmsUtils.encry(user.getPassword(),user.getUsername());
		
		user.setPassword(encryPwd);
		return UserMapper.add(user);
	}

	
	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		user.setPassword(CmsUtils.encry(user.getPassword(), user.getUsername() ));
		User loginUser  = UserMapper.findByPwd(user);
		return loginUser;
	}

}
