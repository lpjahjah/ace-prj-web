package com.ace.exames.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import com.ace.exames.core.interfaces.FuncionariosService;
import com.ace.exames.core.models.Funcionario;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;


public class FuncionariosController extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/FuncionariosService!com.ace.exames.core.interfaces.FuncionariosService")
    private FuncionariosService funcionariosService;
	
	@Setter
	@Getter
	private List<Funcionario> funcionarios = new ArrayList<>();
	
	@Getter
	@Setter
	private Integer cdFuncionario;
	
	@Getter
	@Setter
	private String nmFuncionario = "";
	
	@Setter
	@Getter
	private int page = 1;
	
	@Getter
	private int size = 10;
	
	public String funcionarios() {
		
		if ((cdFuncionario != null && cdFuncionario > 0) || !nmFuncionario.isBlank())
			funcionarios = funcionariosService.searchFuncionarios(cdFuncionario, nmFuncionario, page, size);
		else 
			funcionarios = funcionariosService.getFuncionarios(page, size);
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer id;
	
	@Getter
	@Setter
	private Funcionario funcionario;
	
	public String funcionario() {
		
		funcionario = funcionariosService.getFuncionario(id);
		
		return Action.SUCCESS;
	}
	
	public String create() {
		if (funcionario == null || fieldsHasError())
			return Action.INPUT;
		
		funcionariosService.createFuncionario(funcionario);
		
		return Action.SUCCESS;
	}
	
	public String update() {
		if (funcionario == null) {
			funcionario = funcionariosService.getFuncionario(id);
			
			return Action.INPUT;
		}
		
		if (fieldsHasError())
			return Action.INPUT;
		
		funcionariosService.updateFuncionario(funcionario);
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer toDelete;
	
	public String delete() {
		
		funcionariosService.deleteFuncionario(toDelete);
		
		return Action.SUCCESS;
	}
	
	private boolean fieldsHasError() {
		boolean valid = false;
		
		if (funcionario != null && funcionario.getNmFuncionario().isBlank()) {
			addFieldError("nmFuncionario", "Nome é obrigatório");
			valid = true;
		}
		
		if (funcionario != null && funcionario.getNmFuncionario().length() > 20) {
			addFieldError("nmFuncionario", "Nome precisa conter no máximo até 20 caracteres.");
			valid = true;
		}
		
		return valid;
	}
}