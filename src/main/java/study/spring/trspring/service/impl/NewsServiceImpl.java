package study.spring.trspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.trspring.model.News;
import study.spring.trspring.service.NewsService;

@Slf4j
@Service
public class NewsServiceImpl implements NewsService {
	
	@Autowired
	SqlSession sqlSession;

	/**
	 * 소식 데이터 상세 조회
	 */
	@Override
	public News getNewsItem(News input) throws Exception {
		News result = null;
		
		try {
			result = sqlSession.selectOne("NewsMapper.selectItem", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
	/**
	 * 소식 데이터 목록 조회
	 */
	@Override
	public List<News> getNewsList(News input) throws Exception {
		List<News> result = null;
		
		try {
			result = sqlSession.selectList("NewsMapper.selectList", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
	/**
	 * 소식 데이터가 저장되어 있는 갯수 조회
	 */
	@Override
	public int getNewsCount(News input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("NewsMapper.selectCountAll", input);
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 소식 데이터 등록하기
	 */
	@Override
	public int addNews(News input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("NewsMapper.insertItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 소식 데이터 수정하기
	 */
	@Override
	public int editNews(News input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("NewsMapper.updateItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 소식 데이터 삭제하기
	 */
	@Override
	public int deleteNews(News input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("NewsMapper.deleteItem", input);
			
			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public List<News> getNewsListA(News input) throws Exception {
		List<News> result = null;
		
		try {
			result = sqlSession.selectList("NewsMapper.selectListA", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	@Override
	public List<News> getNewsListB(News input) throws Exception {
		List<News> result = null;
		
		try {
			result = sqlSession.selectList("NewsMapper.selectListB", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	@Override
	public List<News> getNewsListEvent(News input) throws Exception {
		List<News> result = null;
		
		try {
			result = sqlSession.selectList("NewsMapper.selectListEvent", input);
			
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		
		return result;
	}
	
}
