package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Payment;


public interface PaymentService {
	public Payment getPaymentItem(Payment input) throws Exception;
	
	public List<Payment> getPaymentList(Payment input) throws Exception;
	
	public int getPaymentCount(Payment input) throws Exception;
	
	public int addPayment(Payment input) throws Exception;
	
	public int editPayment(Payment input) throws Exception;

	public int deletePayment(Payment input) throws Exception;
}
