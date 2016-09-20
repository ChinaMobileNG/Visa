package visa.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import net.sf.json.JSONObject;
import visa.data.JdbcTravellerRepository;
import visa.data.JdbcVisaCountryRepository;
import visa.pojo.Country;
import visa.pojo.Traveller;

@Controller
@RequestMapping(value={"/","/visasetting"})
public class VisaController {
private JdbcTravellerRepository travellerRepository;
private JdbcVisaCountryRepository visaCountryRepository;
	
	@Autowired
	public VisaController(JdbcTravellerRepository travellerRepository,JdbcVisaCountryRepository visaCountryRepository) {
		// TODO Auto-generated constructor stub
		this.travellerRepository=travellerRepository;
		this.visaCountryRepository=visaCountryRepository;
	}
	
	@RequestMapping(value="/visaprocess",method=RequestMethod.GET)
	public String visaProcessPage(Model model){
		List<Traveller> travellers = new ArrayList<>();
		travellers=travellerRepository.findAll();
		model.addAttribute("travellers", travellers);
		model.addAttribute("traveller",new Traveller());
		travellers.stream().forEach(traveller->System.out.println(traveller.getName()+" "
				+ traveller.getDestination()+" "+traveller.getCurrentStage()+""
				+ " "+traveller.getMyProcessCount()));
		return "visaprocess";
	}
	
	@RequestMapping(value="/visaprocess/update",method=RequestMethod.POST)
	public String updateTraveller(HttpServletRequest request,Model model){
		model.addAttribute("traveller", new Traveller());
		return "redirect:/traveller/visaprocess";
	}
	
	@RequestMapping(value="/visaprocess/updatelist",method=RequestMethod.POST)
	public void updateList(HttpServletRequest request,HttpServletResponse response){
		//request.setCharacterEncoding("utf-8");
        //response.setCharacterEncoding("utf-8");
		String[] processes=request.getParameterValues("process");
        String[] names=request.getParameterValues("username");
        for(int i=0;i<processes.length;i++){
        	System.out.println(names[i]+" "+Integer.valueOf(processes[i]));
        	travellerRepository.updateTravellerProcess(names[i], Integer.valueOf(processes[i]));
        }
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("username", names);
		jsonObject.put("process", processes);
		try {
			PrintWriter printWriter = response.getWriter();
			printWriter.print(jsonObject);
			printWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/visasetting",method=RequestMethod.GET)
	public String visaSettingPage(Model model){
		List<Country> countries = visaCountryRepository.findAllVisaCountryWithAddDate();
		countries.stream().forEach(country->System.out.println(country.getName()+" "+country.getAddDate()));
		model.addAttribute("countries", countries);
		return "visasetting";
	}
	
	@RequestMapping(value="/addvisacountry",method=RequestMethod.POST)
	public String addVisaCountry(HttpServletRequest request){
		String countryname = request.getParameter("visaCountryName");
		visaCountryRepository.addVisaCountry(countryname);
		return "redirect:/visasetting";
	}
	
	@RequestMapping(value="/addvisaprocess",method=RequestMethod.POST)
	public String addVisaProcess(HttpServletRequest request){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String countryname="China";
		int process = Integer.valueOf(request.getParameter("visaProcess"));
		String description = request.getParameter("description");
		visaCountryRepository.addVisaCountryProcess(countryname, process, description);
		return "redirect:/visasetting";
	}
}
