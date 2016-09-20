package visa.pojo;

import java.sql.Timestamp;

public class Complain {
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String accused;
	
	private String reason;
	
	private String details;
	
	private Timestamp accusedTime;

	public String getAccused() {
		return accused;
	}

	public void setAccused(String accused) {
		this.accused = accused;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Timestamp getAccusedTime() {
		return accusedTime;
	}

	public void setAccusedTime(Timestamp accusedTime) {
		this.accusedTime = accusedTime;
	}
	
	public Complain(){
		
	}
	
	public Complain(String accused,String reason,String details,Timestamp accusedTime,int id){
		this.accused=accused;
		this.accusedTime=accusedTime;
		this.details=details;
		this.reason=reason;
		this.id=id;
	}

}
