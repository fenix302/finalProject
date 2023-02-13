package work.comm;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveBoardList(Map<String, String> boardParam){
		return sqlSession.selectList("comm.retrieveBoardList", boardParam);
	}

	public List<Map<String, String>> getListWithPaging(Map<String, String> boardParam){
		return sqlSession.selectList("comm.getListWithPaging", boardParam);
	}
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return sqlSession.selectOne("comm.retrieveBoard", boardParam);
	}

	public String retrieveMaxBoardNo(){
		return sqlSession.selectOne("comm.retrieveMaxBoardNo");
	}

	public void createBoard(CommBean board){
		sqlSession.insert("comm.createBoard", board);
	}

	public void updateBoard(CommBean board){
		sqlSession.update("comm.updateBoard", board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		sqlSession.update("comm.updateBoardHits", boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		sqlSession.delete("comm.deleteBoard", boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		sqlSession.delete("comm.deleteBoard2", boardParam);
	}

}
