package visa.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import visa.data.JdbcComplainRepository;

@Controller
@RequestMapping(value="/complain")
public class ComplainController {
	
	private JdbcComplainRepository complainRepository;
	
	public ComplainController(JdbcComplainRepository complainRepository) {
		// TODO Auto-generated constructor stub
		this.complainRepository=complainRepository;
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public String complainPage(Model model){
		model.addAttribute("items", complainRepository.findAllComplains());
		return "complain";
	}
	
	@RequestMapping(value="/deletecomplains",method=RequestMethod.POST)
	public String deleteCoplains(HttpServletRequest request){
		String[] ids = request.getParameterValues("ids");
		for(int i=0;i<ids.length;i++){
			System.out.println("ids:"+ids[i]);
		}
		StringBuilder idRange = new StringBuilder();
		for(int i=0;i<ids.length;i++){
			idRange.append(ids[i]+",");
		}
		String delteSql = "delete from complain where id in ("+idRange.toString().substring(0, idRange.length()-1)+")";
		complainRepository.deleteComplainItem(delteSql);
		System.out.println(delteSql);
		return "redirect:/complain";
	}
	
}
