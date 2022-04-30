package study.spring.trspring.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Point {
	public int id;
	public String p_cont;
	public String p_pointdate;
	public String p_endpoint;
	public String p_m_id;
	public int p_point;
	public int p_mid;
	public int p_total_point;
	
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Point.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Point.offset = offset;
	}
}
