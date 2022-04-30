package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Admins;

public interface AdminsService {
	public Admins getAdminsItem(Admins input) throws Exception;

	public List<Admins> getAdminsList(Admins input) throws Exception;

	public int getAdminsCount(Admins input) throws Exception;

	public int addAdmins(Admins input) throws Exception;

	public int editAdmins(Admins input) throws Exception;

	public int deleteAdmins(Admins input) throws Exception;
	
	public Admins getAdminsItemLogin(Admins input) throws Exception;
	
}
