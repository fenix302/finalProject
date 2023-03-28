package work.iamport;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;

public class PaymentBean implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String imp_uid;
	private String merchant_uid;
	private int paid_amount;
	private String per_num;
	private Date per_time;
	private String name;
	private String buyer_name;
	private String buyer_postcode;
	private String buyer_addr;
	private String buyer_email;
	private String buyer_tel;
	private String product_category_cd;
	
	public String getImp_uid() {
		return imp_uid;
	}
	public void setImp_uid(String imp_uid) {
		this.imp_uid = imp_uid;
	}
	public String getMerchant_uid() {
		return merchant_uid;
	}
	public void setMerchant_uid(String merchant_uid) {
		this.merchant_uid = merchant_uid;
	}
	public int getPaid_amount() {
		return paid_amount;
	}
	public void setPaid_amount(int paid_amount) {
		this.paid_amount = paid_amount;
	}
	public String getPer_num() {
		return per_num;
	}
	public void setPer_num(String per_num) {
		this.per_num = per_num;
	}
	public Date getPer_time() {
		return per_time;
	}
	public void setPer_time(Date per_time) {
		this.per_time = per_time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBuyer_name() {
		return buyer_name;
	}
	public void setBuyer_name(String buyer_name) {
		this.buyer_name = buyer_name;
	}
	public String getBuyer_postcode() {
		return buyer_postcode;
	}
	public void setBuyer_postcode(String buyer_postcode) {
		this.buyer_postcode = buyer_postcode;
	}
	public String getBuyer_addr() {
		return buyer_addr;
	}
	public void setBuyer_addr(String buyer_addr) {
		this.buyer_addr = buyer_addr;
	}
	public String getBuyer_email() {
		return buyer_email;
	}
	public void setBuyer_email(String buyer_email) {
		this.buyer_email = buyer_email;
	}
	public String getBuyer_tel() {
		return buyer_tel;
	}
	public void setBuyer_tel(String buyer_tel) {
		this.buyer_tel = buyer_tel;
	}
	public String getProduct_category_cd() {
		return product_category_cd;
	}
	public void setProduct_category_cd(String product_category_cd) {
		this.product_category_cd = product_category_cd;
	}
	
	@Override
	public String toString() {
		return "PaymentBean [imp_uid=" + imp_uid + ", merchant_uid=" + merchant_uid + ", paid_amount=" + paid_amount
				+ ", per_num=" + per_num + ", per_time=" + per_time + ", name=" + name + ", buyer_name=" + buyer_name
				+ ", buyer_postcode=" + buyer_postcode + ", buyer_addr=" + buyer_addr + ", buyer_email=" + buyer_email
				+ ", buyer_tel=" + buyer_tel + ", product_category_cd=" + product_category_cd + "]";
	}

	

	
}
