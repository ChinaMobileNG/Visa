package visa.data;

import java.util.List;

import visa.pojo.Country;

public interface VisaCountryRepository {
	void addVisaCountry(String countryname);
	void addVisaCountryProcess(String countryname,int process,String description);
	void deleteVisaCountry(String countryname);
	void deleteVisaCountryProcess(String process);
	List<Country> findAllVisaCountryWithAddDate();
	int getProcessCountByName(String name);
}
