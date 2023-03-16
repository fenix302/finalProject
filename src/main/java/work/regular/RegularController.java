package work.regular;

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

import work.iamport.service.PaymentService;
import work.user.UserService;

@Controller
public class RegularController {
	@Resource(name = "regularService")
	private RegularService regularService;

	@Resource(name = "userService")
	private UserService userService;

	@Resource(name = "paymentService")
	private PaymentService paymentService;
	
	
	@RequestMapping(value="/work/regular/retrieveBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		String boardNo = request.getParameter("bno");

		Map<String, String> boardParam = new HashMap<String, String>();

		boardParam.put("BNO", boardNo);

		Map<String, String> dsBoard = regularService.retrieveBoard(boardParam);


		mv.addObject("dsBoard", dsBoard);

		mv.setViewName("/regular/boardR");

		return mv;
	}

	@RequestMapping(value="/work/regular/retrieveBoardList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView retrieveBoardList(HttpServletRequest request, Model model, Criteria cri){
		ModelAndView mv = new ModelAndView();
		
		model.addAttribute("dsPaymentList", paymentService.getListWithPaging(cri));
		
		int total = paymentService.getTotalCount();
		
		PageDTO pageMaker = new PageDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMaker);
		
		mv.setViewName("/regular/boardListR");

		return mv;
	}

	@RequestMapping(value="/work/regular/deleteBoard.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteBoard(HttpServletRequest request){
		ModelAndView mv = new ModelAndView();

		Map<String, String> boardParam = new HashMap<String, String>();

		HttpSession session = request.getSession();

		String boardNo = request.getParameter("bno");

		boardParam.put("BNO", boardNo);

		regularService.deleteBoard(boardParam);

		mv.setViewName("redirect:/work/regular/retrieveBoardList.do");

		return mv;
	}

	@RequestMapping(value="/work/regular/updateBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateBoard1(HttpServletRequest request, @ModelAttribute RegularBean board, Criteria cri, Model model){
		Map<String, String> boardParam = new HashMap<String, String>();
		ModelAndView mv = new ModelAndView();
        String boardNo = request.getParameter("bno"); //없으면 GET(create안함), 있으면 POST(create)

        String flag = board.getTitle();
        boardParam.put("BNO", boardNo);

        Map<String, String> dsBoard = regularService.retrieveBoard(boardParam);

		if(flag == null){
			mv.addObject("dsBoard", dsBoard);
			mv.setViewName("/regular/boardRegisterU");
		}else{
			regularService.updateBoard(board);
			mv.setViewName("redirect:/work/regular/retrieveBoard.do?bno=" + boardNo);
		}
		return mv;
	}

}
