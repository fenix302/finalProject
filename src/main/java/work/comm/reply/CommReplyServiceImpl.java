package work.comm.reply;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("commReplyService")
public class CommReplyServiceImpl implements CommReplyService{
	@Resource(name = "commReplyDAO")
	private CommReplyDAO commReplyDAO;

	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam){
		return commReplyDAO.retrieveReplyList(replyParam);
	}

	public Map<String, String> retrieveReply(Map<String, String> replyParam){
		return commReplyDAO.retrieveReply(replyParam);
	}

	public void createReply(Map<String, String> replyParam){
		commReplyDAO.createReply(replyParam);
	}

	public void updateReply(Map<String, String> replyParam){
		commReplyDAO.updateReply(replyParam);
	}

	public void deleteReply(Map<String, String> replyParam){
		commReplyDAO.deleteReply(replyParam);
	}
}
