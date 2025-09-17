package service;

import java.util.List;

import model.Cart;
import model.User;

public interface CartService {
    void addToCart(Cart cart);
    List<Cart> getCartByUserId(int userId);
    void updateCartQuantity(int cartId, int quantity);
    void removeCartItem(int cartId);
    void clearCartByUserId(int userId);
    User getUserById(int userId);
}
