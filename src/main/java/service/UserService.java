package service;

import java.util.List;

import model.User;

public interface UserService {
    void registerUser(User user);
    User loginUser(String email, String password);
    List<User> listAllUsers();
    boolean deleteUser(int userId);   // return true if deleted successfully
}
