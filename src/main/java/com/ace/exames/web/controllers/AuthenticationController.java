package com.ace.exames.web.controllers;

import com.ace.exames.core.dtos.AuthDetails;
import com.ace.exames.core.exceptions.LoginException;
import com.ace.exames.core.interfaces.AuthenticationService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;

import javax.ejb.EJB;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class AuthenticationController extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/AuthenticationService!com.ace.exames.core.interfaces.AuthenticationService")
    private AuthenticationService authenticationService;
	
	@Getter
    @Setter
	private String username = "";
    
    @Getter
    @Setter
    private String password = "";
    
    @Getter
	@Setter
	private Boolean firstAccess = true;

    public String login() {
    	if (fieldsHasError())
    		return Action.INPUT;
    	
		try {
			AuthDetails auth = authenticationService.login(username, password);
			
			HttpSession session = ServletActionContext.getRequest().getSession();
						
			session.setAttribute("user", auth);
			
			session.setMaxInactiveInterval(auth.getMinutesToExpire() * 60);
			
//			session.put("user", auth);
//			session.put("lastAccess", System.currentTimeMillis());
			
			return Action.SUCCESS;
	        
		} catch (LoginException e) {
			e.printStackTrace();
			addActionError("Login ou senha inválidos.");
			return Action.INPUT;
		}
    	
    }
    
    public String logout() {
    	ServletActionContext.getRequest().getSession().invalidate();
        return SUCCESS;
    }
    
    private boolean fieldsHasError() {
		if (firstAccess)
			return true;
		
		boolean hasError = false;
		
		if (username.isBlank()) {
			addFieldError("username", "Insira um nome de login");
			hasError = true;
		}
		
		if (password.isBlank()) {
			addFieldError("password", "Insira uma senha");
			hasError = true;
		}
		
		return hasError;
	}
}
