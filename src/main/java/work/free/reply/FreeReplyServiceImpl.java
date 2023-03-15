package work.free.reply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("freeReplyService")
public class FreeReplyServiceImpl implements FreeReplyService{
	@Resource(name = "freeReplyDAO")
	private FreeReplyDAO freeReplyDAO;

	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam){
		return freeReplyDAO.retrieveReplyList(replyParam);
	}

	public Map<String, String> retrieveReply(Map<String, String> replyParam){
		return freeReplyDAO.retrieveReply(replyParam);
	}

	public void createReply(Map<String, String> replyParam){
		freeReplyDAO.createReply(replyParam);
	}

	public void updateReply(Map<String, String> replyParam){
		freeReplyDAO.updateReply(replyParam);
	}

	public void deleteReply(Map<String, String> replyParam){
		freeReplyDAO.deleteReply(replyParam);
	}

	public void deleteReply2(Map<String, String> replyParam) {
		freeReplyDAO.deleteReply2(replyParam);
	}
}
