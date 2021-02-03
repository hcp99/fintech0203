package action;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.DogCartRemoveService;
import vo.ActionForward;
public class DogCartRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//장바구니에서 삭제처리하려는 항목앞에 체크박스를 체크하여 삭제버튼을 클릭하면 장바구니에서 삭제처리를 한다.
		//삭제하기위해서 클릭한 강아지정보를 배열에 대입한다.
		String[] kindArray = request.getParameterValues("remove");
		DogCartRemoveService dogCartRemoveService = new DogCartRemoveService();
		dogCartRemoveService.cartRemove(request, kindArray);
		//삭제처리후 장바구니 리스트로 리다이렉트 처리
		ActionForward forward = new ActionForward("dogCartList.dog",true);
		return forward;
	}

}
