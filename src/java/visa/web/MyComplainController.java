package visa.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visa.data.JdbcComplainRepository;
import visa.pojo.Complain;

@Controller
@RequestMapping(value="/")
public class MyComplainController {

	private JdbcComplainRepository complainRepository;
	
	public MyComplainController(JdbcComplainRepository complainRepository) {
		// TODO Auto-generated constructor stub
		this.complainRepository=complainRepository;
	}
	
	@RequestMapping(value="/mycomplain/savecomplains",method=RequestMethod.POST)
	public String saveComplain(HttpServletRequest request){
		String name = request.getParameter("tousu_name");
		String reason = request.getParameter("reason");
		String description = request.getParameter("description");
		Complain complain=new Complain(name,reason,description);
		complainRepository.addComplainItem(complain);
		return "redirect:/mycomplain";
	}
}
