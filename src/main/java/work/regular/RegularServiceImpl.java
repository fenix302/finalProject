package work.regular;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("regularService")
public class RegularServiceImpl implements RegularService{
	@Resource(name = "regularDAO")
	private RegularDAO regularDAO;

	public List<RegularBean> retrieveBoardList(Criteria cri){
		return regularDAO.retrieveBoardList(cri);
	}
	
	public List<RegularBean> getListWithPaging(Criteria cri) {
		return regularDAO.getListWithPaging(cri);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam){
		return regularDAO.retrieveBoard(boardParam);
	}

	public String retrieveMaxBoardNo(){
		return regularDAO.retrieveMaxBoardNo();
	}

	public void createBoard(RegularBean board){
		regularDAO.createBoard(board);
	}

	public void updateBoard(RegularBean board){
		regularDAO.updateBoard(board);
	}

	public void updateBoardHits(Map<String, String> boardParam){
		regularDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam){
		regularDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam){
		regularDAO.deleteBoard2(boardParam);
	}

	@Override
	public int getTotalCount() {
		return regularDAO.getTotalCount();
	}

}
