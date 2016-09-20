package visa.pojo;

import java.sql.Date;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import com.sun.istack.internal.NotNull;

public class Traveller {
	private int myProcessCount;
	public int getMyProcessCount() {
		return myProcessCount;
	}
	public void setMyProcessCount(int myProcessCount) {
		this.myProcessCount = myProcessCount;
	}

	private String name;
	private String sex;
	@NotNull
	@Size(min=11,max=11,message="phone number length must be 11")
	private String phoneNum;
	@NotNull   
    @Pattern(regexp="^[1-9]\\d{5}[1-9]\\d{3}((0[1-9])||(1[0-2]))((0[1-9])||(1\\d)||(2\\d)||(3[0-1]))\\d{3}([0-9]||X)$", message="ID format error") 
	private String id;
	private Date startTime;
	private String destination;
	private int currentStage;
	public int getCurrentStage() {
		return currentStage;
	}
	public void setCurrentStage(int currentStage) {
		this.currentStage = currentStage;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Traveller(){
		
	}
	
	public Traveller(String name,String sex,String phoneNum,String id,String destination){
		this.name=name;
		this.destination=destination;
		this.id=id;
		this.phoneNum=phoneNum;
		this.sex=sex;
		this.startTime = new Date(System.currentTimeMillis());
	}
	
	public Traveller(String name,String sex,String phoneNum,String id,
			String destination,Date startTime,int currentstage){
		this.name=name;
		this.destination=destination;
		this.id=id;
		this.phoneNum=phoneNum;
		this.sex=sex;
		this.startTime = startTime;
		this.currentStage=currentstage;
	}
	
	public Traveller(String name,String sex,String phoneNum,String id,
			String destination,Date startTime,int currentstage,int myprocessCount){
		this.name=name;
		this.destination=destination;
		this.id=id;
		this.phoneNum=phoneNum;
		this.sex=sex;
		this.startTime = startTime;
		this.currentStage=currentstage;
		this.myProcessCount = myprocessCount;
	}
}
