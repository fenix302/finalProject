package work.free.reply;

import java.util.List;
import java.util.Map;


public interface FreeReplyService {
	public List<Map<String, String>> retrieveReplyList(Map<String, String> replyParam);

	public Map<String, String> retrieveReply(Map<String, String> replyParam);

	public void createReply(Map<String, String> replyParam);

	public void updateReply(Map<String, String> replyParam);
	public void deleteReply(Map<String, String> replyParam);
	public void deleteReply2(Map<String, String> replyParam);
}
