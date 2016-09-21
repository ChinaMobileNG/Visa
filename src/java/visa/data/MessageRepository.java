package visa.data;

import visa.pojo.Message;

public interface MessageRepository {
	void addMessage(Message message);
	void deleteMessage(Message message);
}
