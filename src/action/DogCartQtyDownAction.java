package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartQtyDownService;
import vo.ActionForward;

public class DogCartQtyDownAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		//개 품종값을 가져와서
		//dogCartQtyDownService.downCartQty() 메서드에서
		//수량만 1감소시킨후 다시 장바구니 리스트로 이동
		String kind = request.getParameter("kind");
		
		DogCartQtyDownService dogCartQtyDownService = new DogCartQtyDownService();
		dogCartQtyDownService.downCartQty(kind,request);
		
		ActionForward forward = new ActionForward("dogCartList.dog",true);
		
		return forward;
	}

}
