package work.free;

import java.util.List;
import java.util.Map;


public interface FreeService {
	public List<FreeBean> retrieveBoardList(Criteria cri);

	public List<FreeBean> getListWithPaging(Criteria cri);
	
	public Map<String, String> retrieveBoard(Map<String, String> boardParam);

	public String retrieveMaxBoardNo();

	public void createBoard(FreeBean board);

	public void updateBoard(FreeBean board);

	public void updateBoardHits(Map<String, String> boardParam);

	public void deleteBoard(Map<String, String> boardParam);
	public void deleteBoard2(Map<String, String> boardParam);
	
	public int getTotalCount();
}
