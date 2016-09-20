package visa.data;

import java.util.List;

import visa.pojo.Complain;

public interface ComplainRepository {
	
	void deleteComplainItem(String sql);
	void addComplainItem(Complain complain);
	List<Complain> findAllComplains();
}
