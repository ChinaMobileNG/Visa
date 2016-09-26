package visa.data;

import java.util.List;

import visa.pojo.Message;

public interface MessageRepository {
	void addMessage(Message message);
	void deleteMessage(String sql);
	List<Message> findAllMessages();
}
