package service;

import java.util.List;

import model.Order;

public interface OrderService {
    boolean placeOrder(Order order);
    List<Order> getOrdersByUserId(int userId);
    List<Order> getAllOrders();  // for admin

    boolean deleteOrder(int orderId); // <-- add this
}
