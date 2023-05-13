package entities;

public class CartItem {
	
	private String order_name;
	private String order_price;
	private int qty;
	

	public String getOrder_name() {
		return order_name;
	}


	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}


	public String getOrder_price() {
		return order_price;
	}


	public void setOrder_price(String order_price) {
		this.order_price = order_price;
	}


	public int getQty() {
		return qty;
	}


	public void setQty(int qty) {
		this.qty = qty;
	}


	public CartItem() {
		// TODO Auto-generated constructor stub
		order_name = "";
		order_price = "";
		qty = 0;
		
		
	}

}
