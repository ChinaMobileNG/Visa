package visa.data;

import java.util.List;

import visa.pojo.Traveller;

public interface TravellerRepository {
	
	List<Traveller> findAll();
	void deleteTraveller(String name);
	void addTraveller(Traveller traveller);
	List<Traveller> findByCountry(String visaCountry);
	void updateTravellerProcess(String username,int process);
	void updateTravellerPassword(String username,String newPassword,String oldPassword);
	String getPassword(String username);
	Traveller findTravellerByName(String name);
}
