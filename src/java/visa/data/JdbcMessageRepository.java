package visa.data;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcOperations;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcOperations;
import org.springframework.stereotype.Repository;

import visa.pojo.Message;

@Repository
public class JdbcMessageRepository implements MessageRepository {
	
	private JdbcOperations jdbcOperations;
	private NamedParameterJdbcOperations namedParameterJdbcOperations;
	private static final String ADD_MESSAGE="insert into message(messagername,messagerphone,message) "
			+ " values(:messagername,:messagerphone,:message)";
	private final String FIND_ALL_MESSAGES="select * from message";

	@Autowired
	public JdbcMessageRepository(JdbcOperations jdbcOperations,NamedParameterJdbcOperations namedParameterJdbcOperations) {
		// TODO Auto-generated constructor stub
		this.jdbcOperations=jdbcOperations;
		this.namedParameterJdbcOperations=namedParameterJdbcOperations;
	}
	
	@Override
	public void addMessage(Message message) {
		// TODO Auto-generated method stub
		Map<String, Object> parameterMap = new HashMap<>();
		parameterMap.put("messagername", message.getMessagername());
		parameterMap.put("messagerphone", message.getMessagerphone());
		parameterMap.put("message", message.getMessage());
		namedParameterJdbcOperations.update(ADD_MESSAGE, parameterMap);
	}

	@Override
	public void deleteMessage(String sql) {
		// TODO Auto-generated method stub
		jdbcOperations.update(sql);
	}

	@Override
	public List<Message> findAllMessages() {
		// TODO Auto-generated method stub
		return jdbcOperations.query(FIND_ALL_MESSAGES, (resultSet,rowNum)->{
			String messagername = resultSet.getString("messagername");
			String messagerphone = resultSet.getString("messagerphone");
			String message = resultSet.getString("message");
			int id=resultSet.getInt("id");
			System.out.println("id="+id);
			return new Message(messagername,messagerphone,message,id);
		});
	}

}
