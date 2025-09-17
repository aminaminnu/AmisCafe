package service;

import java.util.List;

import model.MenuItem;

public interface MenuService {
    List<MenuItem> getMenuItemsByCuisineAndType(String cuisine, String type);
    MenuItem getMenuItemById(int id);
}
