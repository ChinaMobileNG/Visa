package visa.pojo;

public class Message {
	private String messagername;
	private String messagerphone;
	private String message;
	public String getMessagername() {
		return messagername;
	}
	public void setMessagername(String messagername) {
		this.messagername = messagername;
	}
	public String getMessagerphone() {
		return messagerphone;
	}
	public void setMessagerphone(String messagerphone) {
		this.messagerphone = messagerphone;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Message(){
		
	}
	public Message(String messagername,String messagerphone,String message){
		this.message=message;
		this.messagername=messagername;
		this.messagerphone=messagerphone;
	}
}
