package work.iamport.command;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import work.iamport.PaymentBean;
import work.iamport.service.PaymentService;

@Controller
public class PaymentController {

	@Resource(name = "paymentService")
	private PaymentService paymentService;
	
	@RequestMapping(value = "/payment.do")
	public ModelAndView fwdPaymentPage() {
		return new ModelAndView("payment");
	}
	
	@RequestMapping(value = "/paymentDone.do" )
	public ModelAndView fwdPaymentSuccessPage() {
		return new ModelAndView("/sell/sellConfirmR");
	}
	
	@RequestMapping(value = "/paymentProcess.do", method = {RequestMethod.POST} )
	public void paymentDone(@RequestBody PaymentBean bean) {
		paymentService.insertPaymentSuccess(bean);
	}
	
	@RequestMapping(value = {"/goMain.do", "/"})
	public ModelAndView goMain() {
		return new ModelAndView("index");
	}
}

