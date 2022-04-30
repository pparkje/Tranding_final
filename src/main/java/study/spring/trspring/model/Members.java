package study.spring.trspring.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class Members {
	private int id;
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_username;
	private String m_email;
	private String m_phone;
	private String m_birthday;
	private String m_email_agree;
	private String m_address;
	private String m_modifydate;
	private String m_joindate;
	private String m_enddate;
	private String m_end;
	private int m_point;
	private String m_gender;
	private String m_memo;
	private String m_postcode;
	
	private List<String> check = new ArrayList<String>();
	private String checkA;
	
	private static int offset;
	private static int listCount;

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Members.listCount = listCount;
	}

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Members.offset = offset;
	}
}
