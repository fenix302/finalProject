package work.inquiry;

import java.util.HashMap;
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



import work.user.UserService;

@Controller
public class inquiryController {
	@Resource(name = "inquiryService")
	private inquiryService inquiryService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@RequestMapping(value="/work/inquiry/createBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView createBoard(@ModelAttribute inquiryBean board, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		
		ModelAndView mv = new ModelAndView();

		String flag = board.getTitle(); //BoardBean 존재여부

		if(flag == null){
			mv.setViewName("/inquiry/boardRegisterC");
		}else if(flag != null){
			//게시글 생성
			inquiryService.createBoard(board);

			String maxBoardNo = inquiryService.retrieveMaxBoardNo();

			mv.setViewName("redirect:/work/inquiry/retrieveBoardList.do?maxBoardNo=" + maxBoardNo);
		}

		return mv;
	}
	
	@RequestMapping(value="/work/inquiry/goMain.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goMain(){

		return "redirect:/intro/index.jsp";
	}
	
	@RequestMapping(value="/work/inquiry/retrieveBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String boardNo = request.getParameter("bno");

		Map<String, String> boardParam = new HashMap<String, String>();

		boardParam.put("BNO", boardNo);

		Map<String, String> dsBoard = inquiryService.retrieveBoard(boardParam);


		mv.addObject("dsBoard", dsBoard);

		mv.setViewName("/inquiry/boardR");

		return mv;
	}

	@RequestMapping(value="/work/inquiry/retrieveBoardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoardList(HttpServletRequest request, Model model, Criteria cri){
		ModelAndView mv = new ModelAndView();
		
		model.addAttribute("dsBoardList", inquiryService.getListWithPaging(cri));
		
		int total = inquiryService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		mv.setViewName("/inquiry/boardListR");

		return mv;
	}

	@RequestMapping(value="/work/inquiry/deleteBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String boardNo = request.getParameter("bno");

		boardParam.put("BNO", boardNo);

		inquiryService.deleteBoard(boardParam);

		mv.setViewName("redirect:/work/inquiry/retrieveBoardList.do");

		return mv;
	}

	@RequestMapping(value="/work/inquiry/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBoard1(HttpServletRequest request, @ModelAttribute inquiryBean board, Criteria cri, Model model){
		Map<String, String> boardParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String boardNo = request.getParameter("bno"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = board.getTitle();
        boardParam.put("BNO", boardNo);

        Map<String, String> dsBoard = inquiryService.retrieveBoard(boardParam);

		if(flag == null){
			mv.addObject("dsBoard", dsBoard);
			mv.setViewName("/inquiry/boardRegisterU");
		}else{
			inquiryService.updateBoard(board);
			mv.setViewName("redirect:/work/inquiry/retrieveBoard.do?bno=" + boardNo);
		}
		return mv;
	}
}
