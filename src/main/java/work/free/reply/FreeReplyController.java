package work.free.reply;

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
public class FreeReplyController {
	@Resource(name = "freeReplyService")
	private FreeReplyService freeReplyService;

	@Resource(name = "sellService")
	private SellService sellService;

	@Resource(name = "markService")
	private MarkService markService;

	@RequestMapping(value="/work/free/reply/createReply.do", method=RequestMethod.POST)
	public ModelAndView createReply
	(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		HttpSession session = request.getSession();

		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> boardParam = new HashMap<String, String>();

		String userCode = (String)session.getAttribute("userCode");
		String reply = request.getParameter("REPLY");
		
		String boardNo = request.getParameter("BNO");
		boardParam.put("BNO", boardNo);

		replyParam.put("BNO", boardNo);
		replyParam.put("userCode", userCode);
		replyParam.put("REPLY", reply);


		//댓글 생성
		freeReplyService.createReply(replyParam);

		mv.setViewName("redirect:/work/free/retrieveBoard.do?bno=" + boardNo);

		return mv;
	}

	@RequestMapping(value="/work/free/reply/deleteReply.do", method=RequestMethod.GET)
	public ModelAndView deleteReply(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> boardParam = new HashMap<String, String>();

		String rno = request.getParameter("RNO");
		
		String boardNo = request.getParameter("BNO");
		boardParam.put("BNO", boardNo);

		replyParam.put("BNO", boardNo);
		replyParam.put("RNO", rno);

		//댓글 삭제
		freeReplyService.deleteReply(replyParam);

		mv.setViewName("redirect:/work/free/retrieveBoard.do?bno=" + boardNo);

		return mv;
	}

}
