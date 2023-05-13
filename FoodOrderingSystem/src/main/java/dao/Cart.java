package dao;

import java.util.ArrayList;
import java.util.List;

import entities.CartItem;

public class Cart {
	private List<CartItem> items;

	public Cart() {
		items = new ArrayList <>();
	}
	
	public void addItem(CartItem item) {
		items.add(item);
	}
	
	public void removeItem(CartItem item) {
	        items.remove(item);
	 }

	 public List<CartItem> getItems() {
	        return items;
	 }

}
