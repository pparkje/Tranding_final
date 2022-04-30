package study.spring.trspring.model;

import lombok.Data;

@Data
public class Orders {
	private int id;                         
    private String o_getpeople;             
    private String o_orderpeople;               
    private String o_sendpeople;                    
    private String o_orderadress;                   
    private String o_getadress;                 
    private String o_sendadress;                    
    private String o_phone;                 
    private int o_count;                 
    private String o_status;                    
    private int o_order_count;                   
    private String o_allprice;                  
    private int o_not_money;                 
    private String o_trans_number;                  
    private String o_delivery_comp;                 
    private String o_input_money;                   
    private int o_point;                    
    private String o_cancle;                   
    private String o_cancle_money;              
    private String o_enddate;               
    private String o_editdate;              
    private String o_product;   		
    private String o_m_id; 
    private String o_g_id; 
    private String o_putdate; 
    private String o_photo; 
    private int o_firstid; 
    private String o_first_name; 
    private String o_first_brand;
    
	private static int offset;
	private static int listCount;

	public static int getOffset() {
		return offset;
	}

	public static void setOffset(int offset) {
		Orders.offset = offset;
	}

	public static int getListCount() {
		return listCount;
	}

	public static void setListCount(int listCount) {
		Orders.listCount = listCount;
	}
		
}
