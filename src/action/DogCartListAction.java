package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartListService;
import vo.ActionForward;
import vo.Cart;

public class DogCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//장바구니 목록보기를 구현하는 비즈니스 로직
		DogCartListService dogCartListService = new DogCartListService();
		
		//전체 장바구니 내역을 가져와서 Cart 형태의 ArrayList구조에 대입시킨다.
		ArrayList<Cart> cartList = dogCartListService.getCartList(request);
		
		int totalMoney = 0,money = 0;
		
		for(int i=0;i<cartList.size();i++) {
			//장바구니 소계 계산 = 강아지가격 * 마리수 
			money = cartList.get(i).getPrice() * 
					cartList.get(i).getQty();
			//총합계금액에 소계를 누적시킴
			totalMoney += money;
		}
		//request scope(영역)에 합계금액과 장바구니 리스트 정보를 속성으로 지정하여 응답처리전까지 유효
		//scope 는 page>request>session>application
		request.setAttribute("totalMoney",totalMoney);
		request.setAttribute("cartList",cartList);
		//장바구니 리스트로 이동
		ActionForward forward = new ActionForward("dogCartList.jsp",false);
		
		return forward;
		
		
	}

}
