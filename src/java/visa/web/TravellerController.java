package visa.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import net.sf.json.JSONObject;
import visa.data.TravellerRepository;
import visa.exception.OldPasswordWrongException;
import visa.pojo.Traveller;

@Controller
@RequestMapping(value="/traveller")
public class TravellerController {
	
	@Autowired
	private TravellerRepository travellerRepository;
	
	public TravellerController(TravellerRepository travellerRepository) {
		// TODO Auto-generated constructor stub
		this.travellerRepository=travellerRepository;
	}
	
	@RequestMapping(value="/addtraveller",method=RequestMethod.POST)
	public String addTraveller(@Valid Traveller traveller,Errors errors,RedirectAttributes model){
		if(errors.hasErrors()){
			return "visaprocess";
		}
		travellerRepository.addTraveller(traveller);
		return "redirect:visaprocess";
	}
	
	@RequestMapping(value={"/visaprocess","/deletetraveller/visaprocess"},method=RequestMethod.GET)
	public String goToHome(Model model){
		List<Traveller> travellers = travellerRepository.findAll();
		model.addAttribute("traveller", new Traveller());
		model.addAttribute("travellers", travellers);
		return "visaprocess";
	}
	
	@RequestMapping(value="/deletetraveller/{targetname}",method=RequestMethod.GET)
	public String deleteByName(@PathVariable("targetname")String name){
		travellerRepository.deleteTraveller(name);
		return "redirect:visaprocess";
	}
	
	@RequestMapping(value="/filter",method=RequestMethod.POST)
	public String filterByCountry(HttpServletRequest request,RedirectAttributes model){
		String targetCountry = request.getParameter("visaCountry");
		model.addFlashAttribute("travellers", travellerRepository.findByCountry(targetCountry));
		return "redirect:/traveller/filter/visaprocess";
	}
	
	@RequestMapping(value={"/filter/visaprocess"},method=RequestMethod.GET)
	public String updateHomeAfterFiltering(Model model){
		model.addAttribute("traveller", new Traveller());
		return "visaprocess";
	}
	
	@RequestMapping(value="/visaprocess",method=RequestMethod.POST)
	public String updateTraveller(HttpServletRequest request){
		return "visaprocess";
	}
	
	@RequestMapping(value="/personalcenter",method=RequestMethod.GET)
	public String goToPersonalCenter(){
		return "personalcenter";
	}
	
	@RequestMapping(value="/personalcenter",method=RequestMethod.POST)
	public void updatePassword(HttpServletRequest request,HttpServletResponse response) throws OldPasswordWrongException{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		String realOldPassword = travellerRepository.getPassword(username);
		String  newPassword = request.getParameter("newPassword");
		String oldPassword  = request.getParameter("oldPassword");
		System.out.println(oldPassword+" "+realOldPassword);
		JSONObject jsonObject = new JSONObject();
		if(!realOldPassword.equals(oldPassword)){
				throw new OldPasswordWrongException("Old password is wrong");
		}else{
			jsonObject.put("failmessage", "Your original password is wrong");
			try {
				PrintWriter printWriter = response.getWriter();
				printWriter.print(jsonObject);
				printWriter.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			travellerRepository.updateTravellerPassword(username, newPassword,oldPassword);
		}
	}

}
