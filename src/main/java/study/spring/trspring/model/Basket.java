package study.spring.trspring.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Basket {
	public int id;
	public String b_image;
	public String b_count;
	public String b_id;
	public String b_name;
	public int b_point;
	public int b_disprice;
	public int b_oriprice;
	public int b_discount;
	public int b_memprice;
	public int b_g_id;
	private List<String> check = new ArrayList<String>();
	public String b_g_brand;
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Basket.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Basket.offset = offset;
	}
}
