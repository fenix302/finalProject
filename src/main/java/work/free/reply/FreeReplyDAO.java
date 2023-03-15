package work.free.reply;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FreeReplyDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam){
		return sqlSession.selectList("freeReply.retrieveReplyList", replyParam);
	}

	public Map<String, String> retrieveReply(Map<String, String> replyParam){
		return sqlSession.selectOne("freeReply.retrieveReply", replyParam);
	}

	public void createReply(Map<String, String> replyParam){
		sqlSession.insert("freeReply.createReply", replyParam);
	}

	public void updateReply(Map<String, String> replyParam){
		sqlSession.update("freeReply.updateReply", replyParam);
	}

	public void deleteReply(Map<String, String> replyParam){
		sqlSession.delete("freeReply.deleteReply", replyParam);
	}

	public void deleteReply2(Map<String, String> replyParam){
		sqlSession.delete("freeReply.deleteReply2", replyParam);
	}

}
