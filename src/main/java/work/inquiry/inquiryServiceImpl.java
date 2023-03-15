package work.inquiry;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service("inquiryService")
public class inquiryServiceImpl implements inquiryService{
	@Resource(name = "inquiryDAO")
	private inquiryDAO inquiryDAO;
	
	public List<inquiryBean> retrieveBoardList(Criteria cri) {
		return inquiryDAO.retrieveBoardList(cri);
	}

	public List<inquiryBean> getListWithPaging(Criteria cri) {
		return inquiryDAO.getListWithPaging(cri);
	}

	public Map<String, String> retrieveBoard(Map<String, String> boardParam) {
		return inquiryDAO.retrieveBoard(boardParam);
	}

	public String retrieveMaxBoardNo() {
		return inquiryDAO.retrieveMaxBoardNo();
	}

	public void createBoard(inquiryBean board) {
		inquiryDAO.createBoard(board);
		
	}
	
	public void updateBoard(inquiryBean board) {
		inquiryDAO.updateBoard(board);
		
	}

	public void updateBoardHits(Map<String, String> boardParam) {
		inquiryDAO.updateBoardHits(boardParam);
	}

	public void deleteBoard(Map<String, String> boardParam) {
		inquiryDAO.deleteBoard(boardParam);
	}

	public void deleteBoard2(Map<String, String> boardParam) {
		inquiryDAO.deleteBoard2(boardParam);
	}

	@Override
	public int getTotalCount() {
		return inquiryDAO.getTotalCount();
	}

}
