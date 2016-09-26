package visa.data;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import visa.pojo.Country;

@Repository
public class JdbcVisaCountryRepository implements VisaCountryRepository {
	private JdbcOperations jdbcOperations;
	private NamedParameterJdbcOperations namedParameterJdbcOperations;
	
	private final String ADD_VISA_COUNTRY="insert into country(countryname,process,description,adddate)"
			+ " values(:countryname,:process,:description,:adddate)";
	private final String FIND_ALL_VISA_COUNTRY_WITH_ADD_DATE = "select * from country where process = 0";
	private final String GET_VISA_COUNTRY_PROCESS_COUNT="select count(1) from country where countryname = ?";
	private final String DELTE_VISA_COUNTRY_BY_NAME="delete from country where countryname = ?";
	
	
	@Autowired
	public JdbcVisaCountryRepository(JdbcOperations jdbcOperations,NamedParameterJdbcOperations namedParameterJdbcOperations) {
		// TODO Auto-generated constructor stub
		this.jdbcOperations=jdbcOperations;
		this.namedParameterJdbcOperations=namedParameterJdbcOperations;
	}

	@Override
	public void addVisaCountry(String countryname) {
		// TODO Auto-generated method stub
		initVisaCountry(countryname, 0, "开始办理");
		initVisaCountry(countryname, 9,"办理结束");
	}
	
	public void initVisaCountry(String countryname,int commonProcess,String description){

		Map<String,Object> parameterMap = new HashMap<>();
		parameterMap.put("countryname", countryname);
		parameterMap.put("process", commonProcess);
		parameterMap.put("description", description);
		parameterMap.put("adddate", new Timestamp(System.currentTimeMillis()));
		namedParameterJdbcOperations.update(ADD_VISA_COUNTRY, parameterMap);
	}

	@Override
	public void deleteVisaCountry(String countryname) {
		// TODO Auto-generated method stub
		jdbcOperations.update(DELTE_VISA_COUNTRY_BY_NAME, countryname);
	}

	@Override
	public void deleteVisaCountryProcess(String process) {
		// TODO Auto-generated method stub

	}

	@Override
	public void addVisaCountryProcess(String countryname,int process, String description) {
		// TODO Auto-generated method stub
		initVisaCountry(countryname, process, description);
	}

	@Override
	public List<Country> findAllVisaCountryWithAddDate() {
		// TODO Auto-generated method stub
		return jdbcOperations.query(FIND_ALL_VISA_COUNTRY_WITH_ADD_DATE, (resultSet,rowNum)->{
			String countryname=resultSet.getString("countryname");
			Timestamp addDate = resultSet.getTimestamp("adddate");
			String description = resultSet.getString("description");
			int processCount = getProcessCountByName(countryname);
			List<Integer> processes = new ArrayList<>();
			for(int i=1;i<=processCount;i++){
				processes.add(i);
			}
			System.out.println("processCount="+processCount);
			return new Country(countryname,
					addDate,
					description,
					processCount,
					processes
					);
		});
	}

	@Override
	public int getProcessCountByName(String name) {
		// TODO Auto-generated method stub
		return jdbcOperations.queryForObject(GET_VISA_COUNTRY_PROCESS_COUNT, Integer.class, name);
	}

}
