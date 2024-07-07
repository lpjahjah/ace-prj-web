package com.ace.exames.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import org.apache.commons.lang3.StringUtils;

import com.ace.exames.core.exceptions.RequiredFieldsException;
import com.ace.exames.core.exceptions.UsuarioAlreadyExistsException;
import com.ace.exames.core.interfaces.UsuariosService;
import com.ace.exames.core.models.Usuario;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;


public class UsuariosController extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/UsuariosService!com.ace.exames.core.interfaces.UsuariosService")
    private UsuariosService usuariosService;
	
	@Setter
	@Getter
	private List<Usuario> usuarios = new ArrayList<>();
	
	@Getter
	@Setter
	private Integer cdUsuario;
	
	@Getter
	@Setter
	private String nmLogin = "";
	
	@Setter
	@Getter
	private int page = 1;
	
	@Getter
	private int size = 10;
	
	public String usuarios() {
		
		if ((cdUsuario != null && cdUsuario > 0) || !nmLogin.isBlank())
			usuarios = usuariosService.searchUsuarios(cdUsuario, nmLogin, page, size);
		else 
			usuarios = usuariosService.getUsuarios(page, size);
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer id;
	
	@Getter
	@Setter
	private Usuario usuario;
	
	public String usuario() {
		
		usuario = usuariosService.getUsuario(id);
		
		return Action.SUCCESS;
	}
	
	public String create() {
		if (usuario == null || fieldsHasError())
			return Action.INPUT;
		
		if (usuario.getDsSenha() == null || usuario.getDsSenha().isBlank()) {
			addFieldError("dsSenha", "Senha é obrigatória");
			return Action.INPUT;
		}
		
		try {
			usuariosService.createUsuario(usuario);
		} catch (RequiredFieldsException e) {
			e.printStackTrace();
			return Action.INPUT;
		} catch (UsuarioAlreadyExistsException e) {
			e.printStackTrace();
			addFieldError("nmLogin", "Um usuário com esse login já existe.");
			return Action.INPUT; 
		}
		
		return Action.SUCCESS;
	}
	
	public String update() {
		if (usuario == null) {
			usuario = usuariosService.getUsuario(id);
			
			return Action.INPUT;
		}
		
		if (fieldsHasError())
			return Action.INPUT;
		
		try {
			usuariosService.updateUsuario(usuario);
		} catch (RequiredFieldsException e) {
			e.printStackTrace();
			return Action.INPUT;
		} catch (UsuarioAlreadyExistsException e) {
			e.printStackTrace();
			addFieldError("nmLogin", "Um usuário com esse login já existe.");
			return Action.INPUT; 
		}
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer toDelete;
	
	public String delete() {
		usuariosService.deleteUsuario(toDelete);
		
		return Action.SUCCESS;
	}
	
	private boolean fieldsHasError() {
		boolean hasError = false;
		
		if (usuario == null)
			return hasError;
		
		if (usuario.getNmLogin().isBlank()) {
			addFieldError("nmLogin", "Nome é obrigatório");
			hasError = true;
		}
		
		if (!StringUtils.isAlphanumeric(usuario.getNmLogin())) {
			addFieldError("nmLogin", "O login deve ser formado apenas por caracteres alfanuméricos.");
			hasError = true;
		}
		
		if (usuario.getQtTempoInatividade() == null || usuario.getQtTempoInatividade() < 1 || usuario.getQtTempoInatividade() > 90) {
			addFieldError("qtTempoInatividade", "Tempo de inatividade deve conter um valor entre 1 e 90 minutos");
			hasError = true;
		}
		
		return hasError;
	}
}