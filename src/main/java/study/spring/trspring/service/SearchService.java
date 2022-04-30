package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Search;

public interface SearchService {
	public Search getSearchItem(Search input) throws Exception;

	public List<Search> getSearchList(Search input) throws Exception;

	public int getSearchCount(Search input) throws Exception;

	public int addSearch(Search input) throws Exception;

	public int editSearch(Search input) throws Exception;

	public int deleteSearch(Search input) throws Exception;
	
}
