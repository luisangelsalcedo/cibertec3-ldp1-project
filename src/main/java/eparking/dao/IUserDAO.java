package eparking.dao;

import java.util.List;

import eparking.model.User;

public interface IUserDAO {
	List<User> getAllUsers();
	User findUserByUserName(String userName);
	User findUserById(int id);
	void insertUser(User user);
	void updateUser(User user);
}
