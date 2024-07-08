package com.ace.exames.web.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.StrutsStatics;

import com.ace.exames.core.dtos.AuthDetails;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AuthenticationInterceptor extends AbstractInterceptor implements
StrutsStatics {
	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) context.get(HTTP_REQUEST);
		HttpSession session = request.getSession(true);
		
		AuthDetails user = (AuthDetails) session.getAttribute("user");
//		Long lastAccessTime = (Long) session.getAttribute("lastAccess");
        
//        Long currentTime = System.currentTimeMillis();
        
        System.out.print("\nUSER: ");
        System.out.println(user);
        System.out.println();

//        if (user == null || lastAccessTime == null)
//            return "login";
        
        if (user == null)
            return "login";
        
		session.setMaxInactiveInterval(user.getMinutesToExpire() * 60);

        
//        if (currentTime - lastAccessTime > user.getMinutesToExpire() * 60 * 1000) {
//            session.remove("user");
//            session.remove("lastAccessTime");
//            return "login";
//        }

//        session.put("lastAccess", currentTime);
        return invocation.invoke();
        
	}
	
}