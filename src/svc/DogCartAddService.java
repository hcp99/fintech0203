package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.DogDAO;
import vo.Cart;
import vo.Dog;
public class DogCartAddService {

	//특정강아지에 대한 정보를 가져오는 메서드getCartDog(int id) 강아지id값에 대한 정보를 가져온다
	public Dog getCartDog(int id) {
		Connection con = getConnection();
		DogDAO dogDAO = DogDAO.getInstance();
		dogDAO.setConnection(con);
		//selectDog()실제정보를 가져온다.
		Dog dog = dogDAO.selectDog(id);
		close(con);
		return dog;
	}
	//장바구니에 추가를 하는 메서드 addCart
	public void addCart(HttpServletRequest request , Dog cartDog) {
		
		//클라이언트의 요청 세션 영역 객체를 가져온다.
		HttpSession session = request.getSession();
		
		//cartList 세션속성값을 가져온다.cart의 형태로 배열을 가져온다.cart는 멤버변수 4개의구조
		ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cartList");
		
		//장바구니가 비어있는경우 cartList 세션 속성생성
		if(cartList == null) {
			cartList = new ArrayList<Cart>();
			session.setAttribute("cartList",cartList);
		}
		boolean isNewCart = true;
		//지금 장바구니에 담는 항목이 새로 추가되는 항목인지를 저장할 변수
		//만약 장바구니에 있는 동일한 품종을 선택한경우 구매수량만 1증가시키고 종료
		for(int i = 0; i< cartList.size(); i++) {
			if(cartDog.getKind().equals(cartList.get(i).getKind())) {
				//새로운 품종을 선택한것이 아니라서 false
				isNewCart = false;
				//sessionList에 있는 수량만 1씩 증가 
				cartList.get(i).setQty(cartList.get(i).getQty()+1);
				
				break;
			}
		}
		//장바구니에 처음으로 담긴 품종이면 
		if(isNewCart) {
			//세션 ArrayList에 추가를 하기 위해서 Cart인스턴스 생성
			Cart cart = new Cart();
			cart.SetImage(cartDog.getImage());
			cart.setKind(cartDog.getKind());
			cart.setPrice(cartDog.getPrice());
			cart.setQty(1);
			
			//ArrayList구조인 cartList에 추가 
			cartList.add(cart);
			
		}
	}
}
