package study.spring.trspring.model;

import lombok.Data;

@Data
public class Delivery {
	private int id;                         
    private String a_area;             
    private String a_postcode_start;               
    private String a_postcode_end;                    
    private int a_add_money;                   
   
    
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Delivery.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Delivery.listCount = listCount;
	}
		
}
