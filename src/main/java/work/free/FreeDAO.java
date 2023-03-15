package work.free;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<FreeBean> retrieveBoardList(Criteria cri){
		return sqlSession.selectList("free.retrieveBoardList", cri);
	}

	public List<FreeBean> getListWithPaging(Criteria cri){
		return sqlSession.selectList("free.getListWithPaging", cri);
	}
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return sqlSession.selectOne("free.retrieveBoard", boardParam);
	}

	public String retrieveMaxBoardNo(){
		return sqlSession.selectOne("free.retrieveMaxBoardNo");
	}

	public void createBoard(FreeBean board){
		sqlSession.insert("free.createBoard", board);
	}

	public void updateBoard(FreeBean board){
		sqlSession.update("free.updateBoard", board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("free.updateBoardHits", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("free.deleteBoard", boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		sqlSession.delete("free.deleteBoard2", boardParam);
	}
	
	public int getTotalCount() {
		return sqlSession.selectOne("free.getTotalCount");
	}
}
