package work.comm.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam){
		return sqlSession.selectList("commReply.retrieveReplyList", replyParam);
	}

	public Map<String, String> retrieveReply(Map<String, String> replyParam){
		return sqlSession.selectOne("commReply.retrieveReply", replyParam);
	}

	public void createReply(Map<String, String> replyParam){
		sqlSession.insert("commReply.createReply", replyParam);
	}

	public void updateReply(Map<String, String> replyParam){
		sqlSession.update("commReply.updateReply", replyParam);
	}

	public void deleteReply(Map<String, String> replyParam){
		sqlSession.delete("commReply.deleteReply", replyParam);
	}

	public void deleteReply2(Map<String, String> replyParam){
		sqlSession.delete("commReply.deleteReply2", replyParam);
	}

}
