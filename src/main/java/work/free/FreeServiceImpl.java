package work.free;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("freeService")
public class FreeServiceImpl implements FreeService{
	@Resource(name = "freeDAO")
	private FreeDAO freeDAO;

	public List<FreeBean> retrieveBoardList(Criteria cri){
		return freeDAO.retrieveBoardList(cri);
	}
	
	public List<FreeBean> getListWithPaging(Criteria cri) {
		return freeDAO.getListWithPaging(cri);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return freeDAO.retrieveBoard(boardParam);
	}

	public String retrieveMaxBoardNo(){
		return freeDAO.retrieveMaxBoardNo();
	}

	public void createBoard(FreeBean board){
		freeDAO.createBoard(board);
	}

	public void updateBoard(FreeBean board){
		freeDAO.updateBoard(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		freeDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		freeDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		freeDAO.deleteBoard2(boardParam);
	}

	@Override
	public int getTotalCount() {
		return freeDAO.getTotalCount();
	}

}
