package study.spring.trspring.service;

import java.util.List;

import study.spring.trspring.model.Goods;


/** 상품 데이터 관리 기능을 제공하기 위한 Service계층 */
public interface GoodsService {
	/**
	 * 상품 데이터 상세 조회
	 * @param Goods	조회할 상품의 일련번호를 담고 있는 Beans
	 * @return	조회된 데이터가 저장된 Beans
	 * @throws Eception
	 */
	public Goods getGoodsItem(Goods input) throws Exception;
	public List<Goods> getGoodsAll() throws Exception;
	public Goods getGoodsAllA(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getGoodsList(Goods input) throws Exception;

	public List<Goods> getGoodsListC() throws Exception;
	public List<Goods> getGoodsListD(Goods input) throws Exception;
	public List<Goods> getGoodsListE(Goods input) throws Exception;
	public List<Goods> getGoodsListF(Goods input) throws Exception;
	public List<Goods> getGoodsListG(Goods input) throws Exception;
	
	public List<Goods> getGoodsListBrand(Goods input) throws Exception;
	public List<Goods> getGoodsListBrandA() throws Exception;
	
	public int getGoodsCountA() throws Exception;

	/** 할인율 관련 조회*/
	public List<Goods> getGoodsHalIn(Goods input) throws Exception;
	public int getGoodsCountHalIn(List<Integer> numberList) throws Exception;
	public int getGoodsCountHalInA(Goods input) throws Exception;
	public List<Goods> getGoodsHalInList(Goods input) throws Exception;
	
	/** 브랜드 관련 조회*/
	public int getGoodsCountBrand(Goods input) throws Exception;
	public List<Goods> getGoodsListBrandA(Goods input) throws Exception;
	public List<Goods> getGoodsListBrandB(Goods input) throws Exception;
	public List<Goods> getGoodsListBrandC(Goods input) throws Exception;
	public List<Goods> getGoodsListBrandD(Goods input) throws Exception;
	public List<Goods> getGoodsHalInListBrand(Goods input) throws Exception;
	
	/**
	 * 상품 분류1 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getDetailA(Goods input) throws Exception;
	
	/**
	 * 상품 분류2 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Goods> getDetailB(Goods input) throws Exception;
	
	/**
	 * 상품 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getGoodsCount(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 등록하기
	 * @return int
	 * @throws Exception
	 */
	public int addGoods(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 수정하기
	 * @param Goods 수정할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editGoods(Goods input) throws Exception;
	
	/**
	 * 상품 데이터 삭제하기
	 * @param Goods 삭제할 상품의 일련번호를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int deleteGoods(Goods input) throws Exception;
	
	/**
	 * 조회수 높은 브랜드 데이터 목록 조회
	 */
	public List<Goods> getGcount(Goods input) throws Exception;
	
	
	
	public Goods getGoodsOnly(Goods input) throws Exception;
	public List<Goods> getGoodsListA() throws Exception;
	public List<Goods> getGoodsListB() throws Exception;
	public List<Goods> getGoodsSearch(Goods input) throws Exception;
	public int getGoodsCountSearch(Goods input) throws Exception;
}
