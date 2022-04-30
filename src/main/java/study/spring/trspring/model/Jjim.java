package study.spring.trspring.model;

import lombok.Data;

@Data
public class Jjim {
	public int id;
	public String f_user_agent;
	public String f_browser;
	public String f_os;
	public String f_device;
	public int f_goods_id;
	
	public String g_image_a;
	public String g_name;
	public String g_brand;
	public String g_ori_price;
	public String g_price;
	public String g_discount;
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Jjim.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Jjim.offset = offset;
	}
}
