package study.spring.trspring.model;

import lombok.Data;

@Data
public class Search {
	public int id;
	public String s_user_agent;
	public String s_browser;
	public String s_os;
	public String s_device;
	public String s_cont;
	
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Search.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Search.offset = offset;
	}
}
