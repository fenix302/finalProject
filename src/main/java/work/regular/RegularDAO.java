package work.regular;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegularDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<RegularBean> retrieveBoardList(Criteria cri){
		return sqlSession.selectList("regular.retrieveBoardList", cri);
	}

	public List<RegularBean> getListWithPaging(Criteria cri){
		return sqlSession.selectList("regular.getListWithPaging", cri);
	}
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return sqlSession.selectOne("regular.retrieveBoard", boardParam);
	}

	public String retrieveMaxBoardNo(){
		return sqlSession.selectOne("regular.retrieveMaxBoardNo");
	}

	public void createBoard(RegularBean board){
		sqlSession.insert("regular.createBoard", board);
	}

	public void updateBoard(RegularBean board){
		sqlSession.update("regular.updateBoard", board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("regular.updateBoardHits", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("regular.deleteBoard", boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		sqlSession.delete("regular.deleteBoard2", boardParam);
	}
	
	public int getTotalCount() {
		return sqlSession.selectOne("regular.getTotalCount");
	}
}
