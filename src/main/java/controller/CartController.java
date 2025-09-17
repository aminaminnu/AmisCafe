package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Cart;
import model.MenuItem;
import model.Order;
import model.User;
import service.CartService;
import service.CartServiceImpl;
import service.MenuService;
import service.MenuServiceImpl;
import service.OrderService;
import service.OrderServiceImpl;

@WebServlet(name = "CartController", urlPatterns = {
        "/addToCart", "/viewCart", "/removeCartItem", "/updateCartQuantity", "/checkout"})
public class CartController extends HttpServlet {

    private CartService cartService = new CartServiceImpl();
    private MenuService menuService = new MenuServiceImpl();
    private OrderService orderService = new OrderServiceImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("index.jsp#loginModal?error=PleaseLogin");
            return;
        }

        switch (action) {
            case "/addToCart":
                handleAddToCart(request, response, user);
                break;
            case "/removeCartItem":
                handleRemoveCartItem(request, response);
                break;
            case "/updateCartQuantity":
                handleUpdateCartQuantity(request, response);
                break;
            case "/checkout":
                handleCheckout(request, response, user);
                break;
            default:
                response.sendRedirect("menu.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getServletPath();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("index.jsp#loginModal?error=PleaseLogin");
            return;
        }

        if (action.equals("/viewCart")) {
            // Fetch cart items
            List<Cart> cartItems = cartService.getCartByUserId(user.getId());
            request.setAttribute("cartItems", cartItems);

            // Fetch user orders
            List<Order> orders = orderService.getOrdersByUserId(user.getId());
            request.setAttribute("orders", orders);

            // Forward to JSP
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }


    // --- Handlers ---
    private void handleAddToCart(HttpServletRequest request, HttpServletResponse response, User sessionUser)
            throws IOException {

        int menuItemId = Integer.parseInt(request.getParameter("menuItemId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        // Get managed MenuItem from DB
        MenuItem menuItem = menuService.getMenuItemById(menuItemId);

        // Get managed User from DB using session user id
        User user = cartService.getUserById(sessionUser.getId());

        Cart cart = new Cart();
        cart.setUser(user);
        cart.setMenuItem(menuItem);
        cart.setQuantity(quantity);

        cartService.addToCart(cart);
        response.sendRedirect("viewCart");
    }


    private void handleRemoveCartItem(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        cartService.removeCartItem(cartId);
        response.sendRedirect("viewCart");
    }

    private void handleUpdateCartQuantity(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int cartId = Integer.parseInt(request.getParameter("cartId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        cartService.updateCartQuantity(cartId, quantity);
        response.sendRedirect("viewCart");
    }

    private void handleCheckout(HttpServletRequest request, HttpServletResponse response, User user)
            throws IOException, ServletException {

        String[] menuItemIds = request.getParameterValues("menuItemId");
        String[] quantities = request.getParameterValues("quantity");
        String paymentMethod = request.getParameter("paymentMethod");

        if (menuItemIds == null || quantities == null || menuItemIds.length != quantities.length) {
            response.sendRedirect("viewCart?error=InvalidCartData");
            return;
        }

        if (paymentMethod == null || paymentMethod.isEmpty()) {
            List<Cart> cartItems = cartService.getCartByUserId(user.getId());
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("error", "Please select a payment method.");
            request.getRequestDispatcher("payment.jsp").forward(request, response);
            return;
        }

        double grandTotal = 0;
        for (int i = 0; i < menuItemIds.length; i++) {
            int menuItemId = Integer.parseInt(menuItemIds[i]);
            int quantity = Integer.parseInt(quantities[i]);
            MenuItem menuItem = menuService.getMenuItemById(menuItemId);

            Order order = new Order();
            order.setUser(user);
            order.setMenuItem(menuItem);
            order.setQuantity(quantity);
            order.setTotalPrice(menuItem.getPrice() * quantity);
            order.setPaymentMethod(paymentMethod);

            orderService.placeOrder(order);
            grandTotal += menuItem.getPrice() * quantity;
        }

        // Clear cart
        cartService.clearCartByUserId(user.getId());

        // Forward to success page
        request.setAttribute("paymentMethod", paymentMethod);
        request.setAttribute("grandTotal", grandTotal);
        request.getRequestDispatcher("orderSuccess.jsp").forward(request, response);
    }


}
