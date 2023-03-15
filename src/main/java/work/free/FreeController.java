package work.free;

import static org.hamcrest.CoreMatchers.containsString;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.free.reply.FreeReplyBean;
import work.free.reply.FreeReplyService;
import work.user.UserService;

@Controller
public class FreeController {
	@Resource(name = "freeService")
	private FreeService freeService;

	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "freeReplyService")
	private FreeReplyService freeReplyService;

	@RequestMapping(value="/work/free/createBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBoard(@ModelAttribute FreeBean board, HttpServletRequest request){
		
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView();

		String flag = board.getTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/free/boardRegisterC");
		}else if(flag != null){
			//게시글 생성
			freeService.createBoard(board);

			String maxBoardNo = freeService.retrieveMaxBoardNo();

			mv.setViewName("redirect:/work/free/retrieveBoardList.do?maxBoardNo=" + maxBoardNo);
		}

		return mv;
		
	}
	
	@RequestMapping(value="/work/free/goMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){

		return "redirect:/intro/index.jsp";
	}

	@RequestMapping(value="/work/free/retrieveBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		String boardNo = request.getParameter("bno");
		
		Map<String, String> boardParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		
		boardParam.put("BNO", boardNo);
		replyParam.put("BNO", boardNo);

		Map<String, String> dsBoard = freeService.retrieveBoard(boardParam);
		List<Map<String, String>> dsReplyList = freeReplyService.retrieveReplyList(replyParam);
		
		mv.addObject("dsBoard", dsBoard);
		mv.addObject("dsReplyList", dsReplyList);
		mv.setViewName("/free/boardR");

		return mv;
	}

	@RequestMapping(value="/work/free/retrieveBoardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoardList(HttpServletRequest request, Model model, Criteria cri){
		ModelAndView mv = new ModelAndView();
		
		model.addAttribute("dsBoardList", freeService.getListWithPaging(cri));
		
		int total = freeService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		mv.setViewName("/free/boardListR");

		return mv;
	}

	@RequestMapping(value="/work/free/deleteBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteBoard(HttpServletRequest request, FreeReplyBean replyBean){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		
		HttpSession session = request.getSession();

		String boardNo = request.getParameter("bno");
		int flag = replyBean.getRno();
		String f = Integer.toString(flag);
		
		boardParam.put("BNO", boardNo);
		
		if (f != null) {
			replyParam.put("BNO", boardNo);
			freeReplyService.deleteReply2(replyParam);
		}
		
		freeService.deleteBoard(boardParam);

		mv.setViewName("redirect:/work/free/retrieveBoardList.do");

		return mv;
	}

	@RequestMapping(value="/work/free/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBoard1(HttpServletRequest request, @ModelAttribute FreeBean board, Criteria cri, Model model){
		Map<String, String> boardParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String boardNo = request.getParameter("bno"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = board.getTitle();
        boardParam.put("BNO", boardNo);

        Map<String, String> dsBoard = freeService.retrieveBoard(boardParam);

		if(flag == null){
			mv.addObject("dsBoard", dsBoard);
			mv.setViewName("/free/boardRegisterU");
		}else{
			freeService.updateBoard(board);
			mv.setViewName("redirect:/work/free/retrieveBoard.do?bno=" + boardNo);
		}
		return mv;
	}

}
