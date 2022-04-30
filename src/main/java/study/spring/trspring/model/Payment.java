package study.spring.trspring.model;

import lombok.Data;

@Data
public class Payment {
	private int id;                         
    private String p_num;             
    private String p_inputdate;               
    private int p_money_a;                    
    private int p_money_b;                   
    private int p_point_a;                 
    private int p_cancle_money;                    
    private int p_smoney;                 
    private String p_memo;                 
    private String p_bank;                    
    private String p_pay;                   
    private String p_pay_name;                  
    private int p_all_money;                 
    private String p_m_id;                  
    private String p_pay_yes;                 
    private String p_g_id;                   
    private String p_cancle;
    private int p_o_id;
    
    
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Payment.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Payment.listCount = listCount;
	}
		
}
