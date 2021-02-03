package svc;

import java.sql.Connection;

import dao.DogDAO;

import static db.JdbcUtil.*;
import vo.Dog;

public class DogViewService {
	//특정 강아지 상세보기 
	//매개변수 id(강아지 id를 받아서)
	public Dog getDogView(int id) {
		Connection con = getConnection();
		DogDAO dogDAO = DogDAO.getInstance();
		dogDAO.setConnection(con);
		//강아지를 클릭을 했으니 조회수를 1증가시킴
		int updateCount = dogDAO.updateReadCount(id);
		
		if(updateCount >0) {
			//성공하면 commit
			commit(con);
		}else {
			rollback(con);
		}
		//특정강아지에 대한 정보를 가져온다.
		Dog dog = dogDAO.selectDog(id);
		close(con);
		return dog;
	}

}
