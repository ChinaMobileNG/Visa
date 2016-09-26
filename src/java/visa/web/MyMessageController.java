package visa.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visa.data.JdbcMessageRepository;
import visa.pojo.Message;

@Controller
@RequestMapping(value="/")
public class MyMessageController {
	
	private JdbcMessageRepository messageRepository;
		
	public MyMessageController(JdbcMessageRepository messageRepository) {
			// TODO Auto-generated constructor stub
		this.messageRepository=messageRepository;
	}
	
	@RequestMapping(value="/mymessage/savemessage",method=RequestMethod.POST)
	public String saveComplain(HttpServletRequest request){
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String message = request.getParameter("message");
		Message myMessage=new Message(name,phone,message);
		messageRepository.addMessage(myMessage);
		return "redirect:/mymessage";
	}
}
