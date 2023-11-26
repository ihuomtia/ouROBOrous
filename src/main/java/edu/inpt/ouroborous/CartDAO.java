package edu.inpt.ouroborous;

import java.util.ArrayList;

public interface CartDAO {
	public void addToCart(String userId, String productId, int quantity);

	public void removeFromCart(String userId, String productId, int quantityToRemove);

	public Cart getUserCart(String userId);
}
