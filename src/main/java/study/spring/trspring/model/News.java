package study.spring.trspring.model;

import lombok.Data;

@Data
public class News {

	private int id;				// 소식번호
	private String n_subject;	// 제목
	private String n_image;		// 이미지
	private String n_cont;		// 내용
	private String n_group;		// 분류
	private String n_term1;		// 시작기간
	private String n_term2;		// 끝기간
	
	// 페이지 구현을 위한 static 변수
		// static은 getter, setter를 따로 지정해줘야함. @Data lombok이 지정해주지않음.
		/** LIMIT 절에서 사용할 조회 시작 위치 */
		private static int offset;
		
		/** LIMIT 절에서 사용할 조회할 데이터 수 */
		private static int listCount;

		public static int getOffset() {
			return offset;
		}

		public static void setOffset(int offset) {
			News.offset = offset;
		}

		public static int getListCount() {
			return listCount;
		}

		public static void setListCount(int listCount) {
			News.listCount = listCount;
		}
}
