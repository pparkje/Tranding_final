package study.spring.trspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.trspring.model.Qna;
import study.spring.trspring.service.QnaService;


@Slf4j
@Service
public class QnaServiceImpl implements QnaService{
	@Autowired
	SqlSession sqlSession;

	/**
	 * 문의 데이터 상세 조회
	 */
	@Override
	public Qna getQnaItem(Qna input) throws Exception {
		Qna result = null;
		
		try {
			result = sqlSession.selectOne("QnaMapper.selectItem", input);
			
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
	 * 문의 데이터 목록 조회
	 */
	@Override
	public List<Qna> getQnaList(Qna input) throws Exception {
		List<Qna> result = null;
		
		try {
			result = sqlSession.selectList("QnaMapper.selectList", input);
			
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
	 * 문의 및 회원 일련번호, 닉네임 데이터 상세 조회
	 */
	@Override
	public Qna getQnaJoinItem(Qna input) throws Exception {
		Qna result = null;
		
		try {
			result = sqlSession.selectOne("QnaMapper.selectQnaItem", input);
			
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
	 * 문의 및 회원 일련번호, 닉네임 데이터 목록 조회
	 */
	@Override
	public List<Qna> getQnaJoinList(Qna input) throws Exception {
		List<Qna> result = null;
		
		try {
			result = sqlSession.selectList("QnaMapper.selectQnaList", input);
			
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
	 * 문의 데이터가 저장되어 있는 갯수 조회
	 */
	@Override
	public int getQnaCount(Qna input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("QnaMapper.selectCountAll", input);
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	
	/**
	 * 문의 데이터 등록하기
	 */
	@Override
	public int addQna(Qna input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("QnaMapper.insertItem", input);
			
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
	 * 문의 데이터 수정하기
	 */
	@Override
	public int editQna(Qna input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("QnaMapper.updateItem", input);
			
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
	 * 문의 데이터 삭제하기
	 */
	@Override
	public int deleteQna(Qna input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("QnaMapper.deleteItem", input);
			
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
	
}
