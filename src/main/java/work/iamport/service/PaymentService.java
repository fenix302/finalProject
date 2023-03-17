package work.iamport.service;

import java.util.List;

import work.iamport.PaymentBean;
import work.regular.Criteria;

public interface PaymentService {

	public void insertPaymentSuccess(PaymentBean bean);
	
	public List<PaymentBean> retrieveBoardList(Criteria cri);
	
	public List<PaymentBean> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
}
