package service;

import java.util.List;

import model.MenuDao;
import model.MenuItem;

public class MenuServiceImpl implements MenuService {
    private MenuDao menuDao = new MenuDao();

    @Override
    public List<MenuItem> getMenuItemsByCuisineAndType(String cuisine, String type) {
        return menuDao.findByCuisineAndType(cuisine, type);
    }

    @Override
    public MenuItem getMenuItemById(int id) {
        return menuDao.getMenuItemById(id);
    }

}
