package visa.data;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.context.ServletContextAware;

import visa.pojo.Complain;
import visa.pojo.Message;
import visa.pojo.Traveller;

public class InitDataListener implements InitializingBean, ServletContextAware {
	
	private TravellerRepository travellerRepository;
	private MessageRepository messageRepository;
	private VisaCountryRepository visaCountryRepository;
	private ComplainRepository complainRepository;
	
	public InitDataListener(TravellerRepository travellerRepository,
			MessageRepository messageRepository,
			VisaCountryRepository visaCountryRepository,
			ComplainRepository complainRepository) {
		// TODO Auto-generated constructor stub
		this.complainRepository=complainRepository;
		this.messageRepository=messageRepository;
		this.travellerRepository=travellerRepository;
		this.visaCountryRepository=visaCountryRepository;
	}

	@Override
	public void setServletContext(ServletContext arg0) {
		// TODO Auto-generated method stub
		travellerRepository.addTraveller(new Traveller());
		messageRepository.addMessage(new Message());
		visaCountryRepository.addVisaCountry("");
		complainRepository.addComplainItem(new Complain());
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub

	}

}
