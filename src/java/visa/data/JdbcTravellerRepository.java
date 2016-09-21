package visa.data;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import visa.pojo.Traveller;
@Repository
public class JdbcTravellerRepository implements TravellerRepository {
	@Autowired
	JdbcVisaCountryRepository visaCountryRepository;
	@Autowired
	private JdbcOperations jdbcOperations;
	@Autowired
	private NamedParameterJdbcOperations namedParameterJdbcOperations;
	
	private static final String ADD_TRAVELER ="insert into users (username,sex,phonenum,id,starttime,destination,currentstage)"
			+ " values(:username,:sex,:phonenum,:id,:starttime,:destination,:currentstage)";
	private static final String FIND_ALL="select * from users";
	private static final String DELETE_BY_NAME = "delete from users where username = ?";
	private static final String FIND_BY_COUNTRY = "select * from users where destination = ?";
	private static final String UPDATE_TRAVELLER_PROCESS="update users set currentstage = ? where username = ?";
	private static final String UPDATE_TRAVELLER_PASSWORD="update users set password = ? where username = ? and"
			+ " password = ?";
	private static final String GET_PASSWORD="select password from users where username = ?";
	private static final String FIND_TRAVELLER_BY_NAME = "select * from users where username = ?";

	public JdbcTravellerRepository(JdbcOperations jdbcOperations,
			NamedParameterJdbcOperations namedParameterJdbcOperations) {
		// TODO Auto-generated constructor stub
		this.jdbcOperations=jdbcOperations;
		this.namedParameterJdbcOperations=namedParameterJdbcOperations;
	}
	
	@Override
	public List<Traveller> findAll() {
		// TODO Auto-generated method stub
		return jdbcOperations.query(FIND_ALL, (resultSet,rowNum)->{
			String username =resultSet.getString("username");
			String sex = resultSet.getString("sex");
			String phoneNum = resultSet.getString("phonenum");
			String id = resultSet.getString("id");
			String destination = resultSet.getString("destination");
			Date startDate = resultSet.getDate("starttime");
			int currentStage = resultSet.getInt("currentstage");
			int myProcessCount = visaCountryRepository.getProcessCountByName(destination);
			return new Traveller(
					username,
					sex,
					phoneNum,
					id,
					destination,
					startDate,
					currentStage,
					myProcessCount
			 );
		});
	}

	@Override
	public void addTraveller(Traveller traveller) {
		// TODO Auto-generated method stub
		Map<String, Object> parameter = new HashMap<>();
		parameter.put("username", traveller.getName());
		parameter.put("sex", traveller.getSex());
		parameter.put("phonenum", traveller.getPhoneNum());
		parameter.put("id", traveller.getId());
		parameter.put("destination", traveller.getDestination());
		parameter.put("starttime", traveller.getStartTime());
		parameter.put("currentstage", 0);
		
		namedParameterJdbcOperations.update(ADD_TRAVELER, parameter);
	}

	@Override
	public void deleteTraveller(String name) {
		// TODO Auto-generated method stub
		jdbcOperations.update(DELETE_BY_NAME, name);
	}

	@Override
	public List<Traveller> findByCountry(String visaCountry) {
		// TODO Auto-generated method stub
		return jdbcOperations.query(FIND_BY_COUNTRY, (resultSet,rowNum)->{
			return new Traveller(
					resultSet.getString("username"),
					resultSet.getString("sex"),
					resultSet.getString("phonenum"),
					resultSet.getString("id"),
					resultSet.getString("destination"),
					resultSet.getDate("starttime"),
					resultSet.getInt("currentstage")
				);
		},visaCountry);
	}

	@Override
	public void updateTravellerProcess(String username, int process) {
		// TODO Auto-generated method stub
		jdbcOperations.update(UPDATE_TRAVELLER_PROCESS, process,username);
	}

	@Override
	public void updateTravellerPassword(String username, String password,String oldPassword) {
		// TODO Auto-generated method stub
		jdbcOperations.update(UPDATE_TRAVELLER_PASSWORD,password,username,oldPassword);
	}

	@Override
	public String getPassword(String username) {
		// TODO Auto-generated method stub
		return jdbcOperations.queryForObject(GET_PASSWORD,String.class,username);
	}

	@Override
	public Traveller findTravellerByName(String name) {
		// TODO Auto-generated method stub
		return jdbcOperations.queryForObject(FIND_TRAVELLER_BY_NAME,(resultSet,rowNum)->{
			String destination =resultSet.getString("destination");
			int myProcessCount = visaCountryRepository.getProcessCountByName(destination);
			Traveller traveller = new Traveller(
					resultSet.getString("username"),
					resultSet.getString("sex"),
					resultSet.getString("phonenum"),
					resultSet.getString("id"),
					destination,
					resultSet.getDate("starttime"),
					resultSet.getInt("currentstage")
				);
			traveller.setMyProcessCount(myProcessCount);
			return traveller;
		},name);
	}

}
