package study.spring.trspring.model;

import lombok.Data;

@Data
public class Qna {
	
	private int id;					// 문의번호
	private String q_subject;		// 제목
	private String q_image;			// 이미지첨부
	private String q_cont;			// 내용
	private String q_answer_ch;		// 답변여부(Y=yes,N=no)
	private String q_answer;		// 답변
	private String q_pname;			// 상품명
	
	// join을 위한 회원테이블
	private String m_username;		// 회원 닉네임
	private int m_id;				// 회원 일련번호
	private String m_email;			// 회원 이메일
	private String m_phone;			// 회원 연락처
	
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
		Qna.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Qna.listCount = listCount;
	}
	
}
