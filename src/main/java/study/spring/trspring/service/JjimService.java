package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Jjim;

public interface JjimService {
	public Jjim getJjimItem(Jjim input) throws Exception;

	public List<Jjim> getJjimList(Jjim input) throws Exception;

	public int getJjimCount(Jjim input) throws Exception;

	public int addJjim(Jjim input) throws Exception;

	public int editJjim(Jjim input) throws Exception;

	public int deleteJjim(Jjim input) throws Exception;
}
