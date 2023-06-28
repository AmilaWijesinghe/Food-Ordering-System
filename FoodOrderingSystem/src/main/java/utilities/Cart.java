package utilities;

import java.util.ArrayList;
import java.util.List;

import entities.CartItem;

public class Cart {
    private static List<CartItem> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public void addItem(CartItem item) {
        items.add(item);
    }

    public static void removeItem(String id) {
        items.removeIf(item -> item.getItemId().equals(id));
    }


    public static List<CartItem> getItems() {
    	 if (items.isEmpty()) {
    		 System.out.println("The list is empty.");
    	    }
        return items;
    }
    
    
}