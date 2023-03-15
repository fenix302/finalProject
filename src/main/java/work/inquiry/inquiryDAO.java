package work.inquiry;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class inquiryDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<inquiryBean> retrieveBoardList(Criteria cri){
		return sqlSession.selectList("inquiry.retrieveBoardList", cri);
	}
	
	public List<inquiryBean> getListWithPaging(Criteria cri){
		return sqlSession.selectList("inquiry.getListWithPaging", cri);
	}
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return sqlSession.selectOne("inquiry.retrieveBoard", boardParam);
	}
	
	public String retrieveMaxBoardNo(){
		return sqlSession.selectOne("inquiry.retrieveMaxBoardNo");
	}
	
	public void createBoard(inquiryBean board) {
		sqlSession.insert("inquiry.createBoard", board);
	}
	
	public void updateBoard(inquiryBean board) {
		sqlSession.insert("inquiry.updateBoard", board);
	}
	
	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("inquiry.updateBoardHits", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("inquiry.deleteBoard", boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		sqlSession.delete("inquiry.deleteBoard2", boardParam);
	}
	
	public int getTotalCount() {
		return sqlSession.selectOne("inquiry.getTotalCount");
	}
}
