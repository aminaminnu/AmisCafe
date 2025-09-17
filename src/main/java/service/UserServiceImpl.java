package service;

import java.util.List;

import model.User;
import model.UserDao;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDao();

    @Override
    public void registerUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public User loginUser(String email, String password) {
        return userDao.getUserByEmailAndPassword(email, password);
    }

    @Override
    public List<User> listAllUsers() {
        return userDao.getAllUsers();
    }

    @Override
    public boolean deleteUser(int userId) {
        return userDao.deleteUser(userId);   // returns true/false from DAO
    }
}
