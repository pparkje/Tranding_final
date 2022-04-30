package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Orders;

public interface OrdersService {
	public Orders getOrdersItem(Orders input) throws Exception;
	
	public List<Orders> getOrdersList(Orders input) throws Exception;
	
	public int getOrdersCount(Orders input) throws Exception;
	
	public int addOrders(Orders input) throws Exception;
	
	public int editOrders(Orders input) throws Exception;

	public int deleteOrders(Orders input) throws Exception;
}
