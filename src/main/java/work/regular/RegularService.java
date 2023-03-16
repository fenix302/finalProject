package work.regular;

import java.util.List;
import java.util.Map;


public interface RegularService {
	public List<RegularBean> retrieveBoardList(Criteria cri);

	public List<RegularBean> getListWithPaging(Criteria cri);
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam);

	public String retrieveMaxBoardNo();

	public void createBoard(RegularBean board);

	public void updateBoard(RegularBean board);

	public void updateBoardHits(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
	public void deleteBoard2(Map<String, String> boardParam);
	
	public int getTotalCount();
}
