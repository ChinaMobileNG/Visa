package visa.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visa.data.JdbcMessageRepository;

@Controller
@RequestMapping(value="/message")
public class MessageController {
	
	private JdbcMessageRepository messageRepository;
	
	public MessageController(JdbcMessageRepository messageRepository) {
		// TODO Auto-generated constructor stub
		this.messageRepository=messageRepository;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String MessagePage(Model model){
		model.addAttribute("items", messageRepository.findAllMessages());
		return "message";
	}
	
	@RequestMapping(value="/deletemessages",method=RequestMethod.POST)
	public String deleteCoplains(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		for(int i=0;i<ids.length;i++){
			System.out.println("ids:"+ids[i]);
		}
		StringBuilder idRange = new StringBuilder();
		for(int i=0;i<ids.length;i++){
			if(i==0)
				idRange.append(ids[i]);
			else
				idRange.append(","+ids[i]);
		}
		///////$$$$$$$$$$$$$$$$change by qiaoyu
		String delteSql = "delete from message where id in ("+idRange.toString()+")";
		messageRepository.deleteMessage(delteSql);
		return "redirect:/message";
	}
	
}
