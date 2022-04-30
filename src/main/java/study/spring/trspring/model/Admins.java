package study.spring.trspring.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Admins {
	public int id;
	public String a_name;
	public String a_id;
	public String a_pw;
	public String a_email;
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Admins.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Admins.offset = offset;
	}
}
