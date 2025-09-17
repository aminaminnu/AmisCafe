package service;

import java.util.List;

import model.Order;
import model.OrderDao;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDao();

    @Override
    public boolean placeOrder(Order order) {
        return orderDao.saveOrder(order);
    }

    @Override
    public List<Order> getOrdersByUserId(int userId) {
        return orderDao.findOrdersByUserId(userId);
    }

    @Override
    public List<Order> getAllOrders() {
        return orderDao.findAllOrders();
    }

    @Override
    public boolean deleteOrder(int orderId) {
        return orderDao.deleteOrder(orderId); // delegate to DAO
    }
}
