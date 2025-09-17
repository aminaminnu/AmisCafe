package controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.MenuItem;
import model.Order;
import model.User;
import service.MenuService;
import service.MenuServiceImpl;
import service.OrderService;
import service.OrderServiceImpl;

@WebServlet({"/placeOrderSubmit", "/myOrders", "/orderNow"})
public class PlaceOrderController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private MenuService menuService = new MenuServiceImpl();
    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp#loginModal?error=PleaseLogin");
            return;
        }

        User user = (User) session.getAttribute("user");
        String path = request.getServletPath();

        if ("/myOrders".equals(path)) {
            try {
                List<Order> orders = orderService.getOrdersByUserId(user.getId());
                request.setAttribute("orders", orders);
                request.getRequestDispatcher("myOrders.jsp").forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("menu.jsp?error=ServerError");
            }
        } else {
            response.sendRedirect("menu.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp#loginModal?error=PleaseLogin");
            return;
        }

        User user = (User) session.getAttribute("user");
        String path = request.getServletPath();

        try {
            if ("/orderNow".equals(path)) {
                // ✅ Load order.jsp with menuItem
                int menuItemId = Integer.parseInt(request.getParameter("menuItemId"));
                MenuItem menuItem = menuService.getMenuItemById(menuItemId);

                if (menuItem == null) {
                    response.sendRedirect("menu.jsp?error=MenuItemNotFound");
                    return;
                }

                int quantity = 1;
                String qtyStr = request.getParameter("quantity");
                if (qtyStr != null && !qtyStr.isEmpty()) {
                    quantity = Integer.parseInt(qtyStr);
                }

                request.setAttribute("menuItem", menuItem);
                request.setAttribute("quantity", quantity);
                request.getRequestDispatcher("order.jsp").forward(request, response);
                return; // important
            }

            // ✅ Place order submission
            int menuItemId = Integer.parseInt(request.getParameter("menuItemId"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String paymentMethod = request.getParameter("paymentMethod");
            String deliveryAddress = request.getParameter("deliveryAddress");

            if (quantity <= 0) {
                response.sendRedirect("menu.jsp?error=InvalidQuantity");
                return;
            }
            if (deliveryAddress == null || deliveryAddress.trim().isEmpty()) {
                request.setAttribute("error", "Please enter delivery address.");
                request.setAttribute("menuItem", menuService.getMenuItemById(menuItemId));
                request.setAttribute("quantity", quantity);
                request.getRequestDispatcher("order.jsp").forward(request, response);
                return;
            }

            MenuItem menuItem = menuService.getMenuItemById(menuItemId);
            if (menuItem == null) {
                response.sendRedirect("menu.jsp?error=MenuItemNotFound");
                return;
            }
            if (paymentMethod == null || paymentMethod.isEmpty()) {
                request.setAttribute("menuItem", menuItem);
                request.setAttribute("quantity", quantity);
                request.setAttribute("error", "Please select a payment method.");
                request.getRequestDispatcher("order.jsp").forward(request, response);
                return;
            }

            Order order = new Order();
            order.setUser(user);
            order.setMenuItem(menuItem);
            order.setQuantity(quantity);
            order.setTotalPrice(menuItem.getPrice() * quantity);
            order.setPaymentMethod(paymentMethod);
            order.setDeliveryAddress(deliveryAddress);
            order.setOrderDate(Date.from(LocalDateTime.now().atZone(ZoneId.systemDefault()).toInstant()));

            orderService.placeOrder(order);

            request.setAttribute("orders", List.of(order));
            request.setAttribute("paymentMethod", paymentMethod);
            request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("menu.jsp?error=InvalidInput");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("menu.jsp?error=ServerError");
        }
    }


}
