package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Email;


public interface EmailService {
	
	public Email getEmailItem(Email input) throws Exception;

	public List<Email> getEmailList(Email input) throws Exception;

	public int getEmailCount(Email input) throws Exception;

	public int addEmail(Email input) throws Exception;

	public int editEmail(Email input) throws Exception;

	public int deleteEmail(Email input) throws Exception;
	
}
