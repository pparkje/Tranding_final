package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Basket;

public interface BasketService {
	public Basket getBasketItem(Basket input) throws Exception;

	public List<Basket> getBasketList(Basket input) throws Exception;

	public int getBasketCount(Basket input) throws Exception;

	public int addBasket(Basket input) throws Exception;

	public int editBasket(Basket input) throws Exception;

	public int deleteBasket(Basket input) throws Exception;
	
	public List<Basket> getBasketListOrders(Basket input) throws Exception;
	public int getBasketCountA(Basket input) throws Exception;
	public int deleteBasketA(Basket input) throws Exception;
	
}
