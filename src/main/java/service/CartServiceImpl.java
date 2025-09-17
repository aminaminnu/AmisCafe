package service;

import java.util.List;

import model.Cart;
import model.CartDao;
import model.User;

public class CartServiceImpl implements CartService {

    private CartDao cartDao = new CartDao();

    @Override
    public void addToCart(Cart cart) { cartDao.addToCart(cart); }

    @Override
    public List<Cart> getCartByUserId(int userId) { return cartDao.getCartByUserId(userId); }

    @Override
    public void updateCartQuantity(int cartId, int quantity) { cartDao.updateCartQuantity(cartId, quantity); }

    @Override
    public void removeCartItem(int cartId) { cartDao.removeCartItem(cartId); }

    @Override
    public void clearCartByUserId(int userId) { cartDao.clearCartByUserId(userId); }

    @Override
    public User getUserById(int userId) { return cartDao.getUserById(userId); }
}
