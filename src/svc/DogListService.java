package svc;

import java.sql.Connection;
import java.util.ArrayList;

import dao.DogDAO;
import vo.Dog;
import static db.JdbcUtil.*;


public class DogListService {

	public ArrayList<Dog> getDogList(){
		
		DogDAO dogDAO = DogDAO.getInstance();
		Connection con = getConnection();
		
		dogDAO.setConnection(con);
		
		//강아지 전체 리스트 수행
		ArrayList<Dog> dogList = dogDAO.selectDogList();
		
		close(con);
		
		return dogList;
		
	}
}
