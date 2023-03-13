package work.comm.reply;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.mark.MarkService;
import work.sell.SellService;

@Controller
public class ReplyController {
	@Resource(name = "replyService")
	private ReplyService replyService;

	@Resource(name = "sellService")
	private SellService sellService;

	@Resource(name = "markService")
	private MarkService markService;

	@RequestMapping(value="/work/reply/createReply.do", method=RequestMethod.POST)
	public ModelAndView createReply
	(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> boardParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String rno = request.getParameter("rno");
		
		String boardNo = request.getParameter("bno");
		boardParam.put("BNO", boardNo);

		replyParam.put("userCode", userCode);
		replyParam.put("userReply", rno);

		//댓글 생성
		replyService.createReply(replyParam);

		mv.setViewName("redirect:/work/comm/retrieveBoard.do?bno=" + boardNo);

		return mv;
	}

	@RequestMapping(value="/work/reply/deleteReply.do", method=RequestMethod.GET)
	public ModelAndView deleteReply(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> boardParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String rno = request.getParameter("rno");
		
		String boardNo = request.getParameter("bno");
		boardParam.put("BNO", boardNo);

		replyParam.put("userCode", userCode);
		replyParam.put("rno", rno);

		//댓글 삭제
		replyService.deleteReply(replyParam);

		mv.setViewName("redirect:/work/comm/retrieveBoard.do?bno=" + boardNo);

		return mv;
	}

}
