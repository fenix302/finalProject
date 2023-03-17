package work.iamport.service;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import work.iamport.PaymentBean;
import work.iamport.dao.PaymentDAO;
import work.regular.Criteria;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {

	
	@Resource(name = "paymentDAO")
	private PaymentDAO paymentDAO;
	
	public void insertPaymentSuccess(PaymentBean bean) {

		paymentDAO.insertPaymentSuccess(bean);		
	}

	@Override
	public List<PaymentBean> retrieveBoardList(Criteria cri) {
		return paymentDAO.retrieveBoardList(cri);
	}
	
	public List<PaymentBean> getListWithPaging(Criteria cri) {
		return paymentDAO.getListWithPaging(cri);
	}
	
	@Override
	public int getTotalCount(Criteria cri) {
		return paymentDAO.getTotalCount(cri);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return paymentDAO.retrieveBoard(boardParam);
	}
	
}
