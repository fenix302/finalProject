package work.iamport;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

@Data
public class PaymentBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String imp_uid;
	private String merchant_uid;
	private int paid_amount;
	private String apply_num;
	private Date per_time;
	private String name;
	private String buyer_name;
	private String buyer_postcode;
	private String buyer_addr;
	private String buyer_email;
	private String buyer_tel;
	private String product_category_cd;


	
}
