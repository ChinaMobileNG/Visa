package visa.data;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import visa.pojo.Complain;

@Repository
public class JdbcComplainRepository implements ComplainRepository {
	private JdbcOperations jdbcOperations;
	@SuppressWarnings("unused")
	private NamedParameterJdbcOperations namedParameterJdbcOperations;
	
	private final String FIND_ALL_COMPLAINS="select * from complain";
	
	@Autowired
	public JdbcComplainRepository(JdbcOperations jdbcOperations,
			NamedParameterJdbcOperations namedParameterJdbcOperations) {
		// TODO Auto-generated constructor stub
		this.jdbcOperations=jdbcOperations;
		this.namedParameterJdbcOperations=namedParameterJdbcOperations;
	}

	@Override
	public void deleteComplainItem(String sql) {
		// TODO Auto-generated method stub
		jdbcOperations.update(sql);

	}

	@Override
	public void addComplainItem(Complain complain) {
		// TODO Auto-generated method stub
		String accused=complain.getAccused();
		String reason=complain.getReason();
		String details=complain.getDetails();
		String sql="insert into complain(accused,reason,details)"+
				" values("+"'"+accused+"'"+","+"'"+reason+"'"+","+"'"+details+"'"+")";
		jdbcOperations.update(sql);
	}

	@Override
	public List<Complain> findAllComplains() {
		// TODO Auto-generated method stub
		return jdbcOperations.query(FIND_ALL_COMPLAINS, (resultSet,rowNum)->{
			String accused = resultSet.getString("accused");
			String reason = resultSet.getString("reason");
			String details = resultSet.getString("details");
			Timestamp accusedTime = resultSet.getTimestamp("accusedTime");
			int id=resultSet.getInt("id");
			System.out.println("id="+id);
			return new Complain(
					accused,
					reason,
					details,
					accusedTime,
					id
					);
		});
	}

}
