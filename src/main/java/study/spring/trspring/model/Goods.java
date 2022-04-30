package study.spring.trspring.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Goods {
	private int id;							// 일련번호
	private String g_detail_a;				// 1차분류
	private String g_detail_b;				// 2차분류
	private String g_code;					// 상품코드
	private String g_name;					// 상품명
	private String g_hit;					// 히트
	private String g_recom;					// 추천
	private String g_new;					// 신상품
	private String g_popul;					// 인기
	private String g_sale;					// 할인
	private String g_make;					// 제조사
	private String g_brand;					// 브랜드
	private String g_sell;					// 판매
	private String g_cont;					// 상품설명
	private String g_memo;					// 상품메모
	private String g_price;					// 판매가격
	private int g_point;					// 포인트
	private int g_inven;					// 재고수량
	private String g_option_a;				// 옵션1
	private String g_option_b;				// 옵션2
	private String g_image_a;				// 이미지1
	private String g_image_b;				// 이미지2
	private int g_count;					// 조회수
	private int g_goods_count;				// 누적판매수
	private String g_ori_price;				// 원가
	private String g_discount;				// 할인율
	private String g_disc_price;			// 결제혜택가
	private int g_count_price;				// 합계계산용 판매가격      		임시로 null 해놓음
	private int g_count_disprice;			// 합계계산용 비회원할인가격      임시로 null 해놓음
	private int g_count_memprice;			// 합계계산용 회원할인률      	임시로 null 해놓음
	private int g_count_oriprice;			// 합계계산용 원가격      		임시로 null 해놓음
	private int g_count_memprice_price;		// 합계계산용 회원할인가     	임시로 null 해놓음
	
	private String numberList;
	
	private List<String> check = new ArrayList<String>();
	
	private List<Integer> numberListA = new ArrayList<Integer>();
	
	
	
	public int min_price;
	public int max_price;
	

	// 3) 페이지 구현을 위한 static 변수
	// static은 getter, setter를 따로 지정해줘야함. @Data lombok이 지정해주지않음.
	/** LIMIT 절에서 사용할 조회 시작 위치 */

	private static int offset;
	
	/** LIMIT 절에서 사용할 조회할 데이터 수 */
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Goods.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Goods.listCount = listCount;
	}
		
}
