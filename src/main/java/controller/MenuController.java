package controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.MenuItem;
import service.MenuService;
import service.MenuServiceImpl;

@WebServlet("/menu")
public class MenuController extends HttpServlet {

    private MenuService menuService = new MenuServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String cuisine = request.getParameter("cuisine");
        String type = request.getParameter("type");

        List<MenuItem> menuItems = menuService.getMenuItemsByCuisineAndType(cuisine, type);
        request.setAttribute("menuItems", menuItems);

        request.getRequestDispatcher("menu.jsp").forward(request, response);
    }
}
