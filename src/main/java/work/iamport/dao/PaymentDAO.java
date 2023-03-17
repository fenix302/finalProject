package work.iamport.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import work.iamport.PaymentBean;
import work.regular.Criteria;

@Repository
public class PaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void insertPaymentSuccess(PaymentBean bean){
		sqlSession.insert("payment.insertPaymentSuccess", bean);
	}
	
	public List<PaymentBean> retrieveBoardList(Criteria cri){
		return sqlSession.selectList("payment.retrieveBoardList", cri);
	}
	
	public List<PaymentBean> getListWithPaging(Criteria cri){
		return sqlSession.selectList("payment.getListWithPaging", cri);
	}
	
	public int getTotalCount(Criteria cri) {
		return sqlSession.selectOne("payment.getTotalCount", cri);
	}
	
	
//	private static SqlSessionFactory sqlMapper;
//	
//	private static SqlSessionFactory getInstance() {
//		if (sqlMapper == null) {
//			String resource = "SqlMapConfig.xml";
//			try {
//				Reader reader = Resources.getResourceAsReader(resource);
//				sqlMapper = new SqlSessionFactoryBuilder().build(reader);
//				reader.close();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		return sqlMapper;
//	}
//	
//	public void insertPaymentSuccess(PaymentBean bean) {
//		sqlMapper = getInstance();
//		SqlSession session = sqlMapper.openSession();
//		session.insert("payment.insertPaymentSuccess", bean);
//		session.commit();
//	}
}


