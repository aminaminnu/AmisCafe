package model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "menu_items")
public class MenuItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;
    private String cuisine;   // Indian, Chinese, Italian, Continental
    private String type;      // veg, nonveg, specials
    private double price;
    private String image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCuisine() {
		return cuisine;
	}
	public void setCuisine(String cuisine) {
		this.cuisine = cuisine;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public MenuItem(int id, String name, String cuisine, String type, double price, String image) {
		super();
		this.id = id;
		this.name = name;
		this.cuisine = cuisine;
		this.type = type;
		this.price = price;
		this.image = image;
	}
	public MenuItem() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "MenuItem [id=" + id + ", name=" + name + ", cuisine=" + cuisine + ", type=" + type + ", price=" + price
				+ ", image=" + image + "]";
	}



}
