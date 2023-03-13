package work.comm;

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

import work.comm.reply.CommReplyService;
import work.user.UserService;

@Controller
public class CommController {
	@Resource(name = "commService")
	private CommService commService;

	@Resource(name = "userService")
	private UserService userService;
	
	@Resource(name = "commReplyService")
	private CommReplyService commReplyService;

	@RequestMapping(value="/work/comm/createBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBoard(@ModelAttribute CommBean board, HttpServletRequest request){
		
		HttpSession session = request.getSession();

		ModelAndView mv = new ModelAndView();

		String flag = board.getTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/comm/boardRegisterC");
		}else if(flag != null){
			//게시글 생성
			commService.createBoard(board);

			String maxBoardNo = commService.retrieveMaxBoardNo();

			mv.setViewName("redirect:/work/comm/retrieveBoardList.do?maxBoardNo=" + maxBoardNo);
		}

		return mv;
		
	}
	
	@RequestMapping(value="/work/comm/goMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){

		return "redirect:/intro/index.jsp";
	}

	@RequestMapping(value="/work/comm/retrieveBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String boardNo = request.getParameter("bno");

		Map<String, String> boardParam = new HashMap<String, String>();
		Map<String, String> replyParam = new HashMap<String, String>();
		Map<String, String> dsBoard = commService.retrieveBoard(boardParam);
		List<Map<String, String>> dsReplyList = commReplyService.retrieveReplyList(replyParam);

		boardParam.put("bno", boardNo);


		mv.addObject("dsReplyList", dsReplyList);

		mv.addObject("dsBoard", dsBoard);

		mv.setViewName("/comm/boardR");

		return mv;
	}

	@RequestMapping(value="/work/comm/retrieveBoardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoardList(HttpServletRequest request, Model model, Criteria cri){
		ModelAndView mv = new ModelAndView();
		
		model.addAttribute("dsBoardList", commService.getListWithPaging(cri));
		
		int total = commService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		mv.setViewName("/comm/boardListR");

		return mv;
	}

	@RequestMapping(value="/work/comm/deleteBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String boardNo = request.getParameter("bno");

		boardParam.put("BNO", boardNo);

		commService.deleteBoard(boardParam);

		mv.setViewName("redirect:/work/comm/retrieveBoardList.do");

		return mv;
	}

	@RequestMapping(value="/work/comm/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBoard1(HttpServletRequest request, @ModelAttribute CommBean board, Criteria cri, Model model){
		Map<String, String> boardParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String boardNo = request.getParameter("bno"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = board.getTitle();
        boardParam.put("BNO", boardNo);

        Map<String, String> dsBoard = commService.retrieveBoard(boardParam);

		if(flag == null){
			mv.addObject("dsBoard", dsBoard);
			mv.setViewName("/comm/boardRegisterU");
		}else{
			commService.updateBoard(board);
			mv.setViewName("redirect:/work/comm/retrieveBoard.do?bno=" + boardNo);
		}
		return mv;
	}

}
