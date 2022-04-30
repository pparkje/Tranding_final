package study.spring.trspring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import study.spring.trspring.model.Goods;
import study.spring.trspring.service.GoodsService;



/** 학과 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
@Slf4j
@Service	// --> import org.springframework.stereotype.Service;
public class GoodsServiceImpl implements GoodsService{

	/** MyBatis 세션 객체 주입 설정 */
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 상품 데이터 상세 조회
	 * @param Goods	조회할 상품의 일련번호를 담고 있는 Beans
	 * @return	조회된 데이터가 저장된 Beans
	 * @throws Eception
	 */
	@Override
	public Goods getGoodsItem(Goods input) throws Exception {
		Goods result = null;
		
		try {
			result = sqlSession.selectOne("GoodsMapper.selectItem", input);
			
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
	 * 상품 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getGoodsList(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectList", input);
			
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
	

	
	@Override
	public List<Goods> getGoodsListBrand(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectListBrand", input);

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
	public List<Goods> getGoodsListBrandA() throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectListBrand");

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


	/**
	 * 상품 분류1 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getDetailA(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectListDetailA", input);
			
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
	 * 상품 분류2 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<Goods> getDetailB(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectListDetailB", input);
			
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
	 * 상품 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */

	@Override
	public int getGoodsCount(Goods input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("GoodsMapper.selectCountAll", input);
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}
	@Override
	public int getGoodsCountBrand(Goods input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("GoodsMapper.selectCountAllBrand", input);
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public int getGoodsCountA() throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("GoodsMapper.selectCountAllA");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	


	
	/**
	 * 상품 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */

	@Override
	public int addGoods(Goods input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("GoodsMapper.insertItem", input);
			
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
	 * 상품 데이터 수정하기
	 * @param Goods 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int editGoods(Goods input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("GoodsMapper.updateItem", input);
			
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
	 * 상품 데이터 삭제하기
	 * @param Goods 삭제할 상품의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	@Override
	public int deleteGoods(Goods input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("GoodsMapper.deleteItem", input);
			
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
	public List<Goods> getGoodsListA() throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.searchListA");

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
	public List<Goods> getGoodsListB() throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.searchListB");

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
	public List<Goods> getGoodsListC() throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectList");

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
	public List<Goods> getGoodsListD(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newList", input);

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
	public List<Goods> getGoodsListE(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newListA", input);

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
	public List<Goods> getGoodsListF(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newListB", input);

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
	public List<Goods> getGoodsListG(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newListC", input);

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
	public Goods getGoodsOnly(Goods input) throws Exception {
		Goods result = null;

		try {
			result = sqlSession.selectOne("GoodsMapper.onlyitem", input);

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
	
	/** 할인율 관련 기능 */
	@Override
	public List<Goods> getGoodsHalIn(Goods input) throws Exception {
		
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.halinitem", input);
			
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
	@Override
	public int getGoodsCountHalIn(List<Integer> numberList) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("GoodsMapper.halincount", numberList);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	
	@Override
	public int getGoodsCountHalInA(Goods input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("GoodsMapper.halincountA", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
	@Override
	public List<Goods> getGoodsHalInList(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectListhalin", input);
			
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
//	브랜드 관련조회
	@Override
	public List<Goods> getGoodsListBrandA(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newListBrandA", input);

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
	public List<Goods> getGoodsListBrandB(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newListBrandB", input);

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
	public List<Goods> getGoodsListBrandC(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newListBrandC", input);

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
	public List<Goods> getGoodsListBrandD(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.newListBrandD", input);

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
	public List<Goods> getGoodsHalInListBrand(Goods input) throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.selectListhalinBrand", input);
			
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
	
	@Override
	public List<Goods> getGoodsAll() throws Exception {
		List<Goods> result = null;
		
		try {
			result = sqlSession.selectList("GoodsMapper.searchAll");

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
	public Goods getGoodsAllA(Goods input) throws Exception {
		Goods result = null;
		
		try {
			result = sqlSession.selectOne("GoodsMapper.searchAllA", input);
			
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
