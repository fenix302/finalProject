package work.inquiry;

import java.util.List;
import java.util.Map;

public interface inquiryService {
	public List<inquiryBean> retrieveBoardList(Criteria cri);
	
	public List<inquiryBean> getListWithPaging(Criteria cri);
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam);
	
	public String retrieveMaxBoardNo();

	public void createBoard(inquiryBean board);
	
	public void updateBoard(inquiryBean board);
	
	public void updateBoardHits(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
	public void deleteBoard2(Map<String, String> boardParam);
	
	public int getTotalCount();
}
