package study.spring.trspring.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Review {
	public int id;
	public String r_sub;
	public String r_cont;
	public String r_img;
	public String r_code;
	public String r_name;
	public String r_brand;
	public String r_m_id;
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Review.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Review.offset = offset;
	}
}
