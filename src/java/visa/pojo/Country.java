package visa.pojo;

import java.sql.Timestamp;
import java.util.List;

public class Country {

	private String name ;
	
	private List<Integer> process;
	
	private int processCount;
	
	public int getProcessCount() {
		return processCount;
	}

	public void setProcessCount(int processCount) {
		this.processCount = processCount;
	}

	private String description;
	
	private Timestamp addDate;
	
	public Timestamp getAddDate() {
		return addDate;
	}

	public void setAddDate(Timestamp addDate) {
		this.addDate = addDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setProcess(List<Integer> process) {
		this.process = process;
	}
	
	public List<Integer> getProcess() {
		// TODO Auto-generated method stub
		return process;
	}
	
	public Country(){
		
	}
	
	public Country(String name,Timestamp addDate){
		this.addDate=addDate;
		this.name=name;
	}
	
	public Country(String name,Timestamp addDate,String description){
		this.addDate=addDate;
		this.description=description;
		this.name=name;
	}
	
	public Country(String name,Timestamp addDate,String description,int processCount){
		this.addDate=addDate;
		this.description=description;
		this.name=name;
		this.processCount=processCount;
	}
}
