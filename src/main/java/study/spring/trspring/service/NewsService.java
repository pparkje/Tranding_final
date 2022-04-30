package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.News;

public interface NewsService {
	
	/**
	 * 소식 데이터 상세 조회
	 */
	public News getNewsItem(News input) throws Exception;
	
	/**
	 * 소식 데이터 목록 조회
	 */
	public List<News> getNewsList(News input) throws Exception;
	public List<News> getNewsListA(News input) throws Exception;
	public List<News> getNewsListEvent(News input) throws Exception;
	public List<News> getNewsListB(News input) throws Exception;

	/**
	 * 소식 데이터가 저장되어 있는 갯수 조회
	 */
	public int getNewsCount(News input) throws Exception;
	
	/**
	 * 소식 데이터 등록하기
	 */
	public int addNews(News input) throws Exception;
	
	/**
	 * 소식 데이터 수정하기
	 */
	public int editNews(News input) throws Exception;
	
	/**
	 * 소식 데이터 삭제하기
	 */
	public int deleteNews(News input) throws Exception;
	
}
