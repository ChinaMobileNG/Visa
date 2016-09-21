package visa.data;

import java.util.HashMap;
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
	public void deleteMessage(Message message) {
		// TODO Auto-generated method stub

	}

}
