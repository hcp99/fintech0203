package svc;

import java.sql.Connection;

import dao.DogDAO;
import vo.Dog;
import static db.JdbcUtil.*;

public class DogRegistService {
	
	public boolean registDog(Dog dog) {
		
		DogDAO dogDAO = DogDAO.getInstance();
		
		Connection con = getConnection();
		dogDAO.setConnection(con);
		
		boolean isRegistSuccess = false;
		//신규 강아지 입력처리를 DogDAO 에 위임
		int insertCount = dogDAO.insertDog(dog);
		
		if(insertCount > 0) {
			commit(con);
			isRegistSuccess = true;
		}else {
			rollback(con);
		}
		
		close(con);
		
		return isRegistSuccess;
		
		
	}

}
