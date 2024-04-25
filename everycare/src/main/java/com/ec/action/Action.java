package com.ec.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	//앞으로 비즈니스 로직을 수행할 모든 클래스들의 틀
	//execute()가 실제 로직이 구현되어 있는 메소드(상속받는 각 클래스에서 재정의)
	//로직을 수행했다면 결과로는 "어디로","어떻게" 이동할지 가 나오기 때문에
	//그 두 정보를 가지고 있는 Transfer 타입의 객체를 만들어서 리턴하도록 설계한다.
	Transfer execute(HttpServletRequest req, HttpServletResponse resp) throws Exception;
}
