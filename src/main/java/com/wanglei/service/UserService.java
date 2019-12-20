package com.wanglei.service;

import javax.validation.Valid;

import com.wanglei.entity.User;

public interface UserService {

	User getUserByUsername(String username);

	int register(@Valid User user);

	/**
	 * 登录操作
	 * @param user
	 * @return
	 */
	User login(User user);

}
