package svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vo.Cart;

public class DogCartRemoveService {
	
	//kindArray 
	//장바구니에서 삭제하려고 선택한 품종을 가지는 배열
	public void cartRemove(HttpServletRequest request,String[] kindArray) {
		
		HttpSession session = request.getSession();
		
		ArrayList<Cart>cartList = (ArrayList<Cart>) session.getAttribute("cartList");
		
		//삭제하려는 품종을 반복하면서 장바구니에 있는 항목을 찾아서 삭제처리
		//장바구니는 품종이 같을경우는 수량만 증가시키고 다른품종이 다들어있어서 이런방식으로 처리가능
		for(int i = 0; i< kindArray.length; i++) {
			//내부에서는 장바구니 검색
			for(int j = 0; j<cartList.size(); j++) {
				
				if(cartList.get(j).getKind().equals(kindArray[i])) {
					cartList.remove(cartList.get(j));
				}
			}
		}
	}

}
