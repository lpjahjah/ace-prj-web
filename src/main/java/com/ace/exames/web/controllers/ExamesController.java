package com.ace.exames.web.controllers;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.ejb.EJB;

import com.ace.exames.core.enums.ExameStatusEnum;
import com.ace.exames.core.exceptions.ExameDeletionException;
import com.ace.exames.core.exceptions.RequiredFieldsException;
import com.ace.exames.core.interfaces.ExamesService;
import com.ace.exames.core.models.Exame;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;


public class ExamesController extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/ExamesService!com.ace.exames.core.interfaces.ExamesService")
    private ExamesService examesService;
	
	@Setter
	@Getter
	private List<Exame> exames = new ArrayList<>();
	
	@Getter
	@Setter
	private Integer cdExame;
	
	@Getter
	@Setter
	private String nmExame = "";
	
	@Getter
	@Setter
	private ExameStatusEnum statusExame;
	
	@Getter
	private List<ExameStatusEnum> allStatusExame = Arrays.asList(ExameStatusEnum.values());
	
	@Setter
	@Getter
	private int page = 1;
	
	@Getter
	private int size = 10;
	
	public String exames() {
		
		if ((cdExame != null && cdExame > 0) || !nmExame.isBlank() || statusExame != null)
			exames = examesService.searchExames(cdExame, nmExame, statusExame, page, size);
		else 
			exames = examesService.getExames(page, size);
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer id;
	
	@Getter
	@Setter
	private Exame exame;
	
	public String exame() {
		
		exame = examesService.getExame(id);
		
		return Action.SUCCESS;
	}
	
	public String create() {
		if (exame == null || fieldsHasError())
			return Action.INPUT;
		
		try {
			examesService.createExame(exame);
		} catch (RequiredFieldsException e) {
			e.printStackTrace();
			return Action.INPUT;
		}
		
		return Action.SUCCESS;
	}
	
	public String update() {
		if (exame == null) {
			exame = examesService.getExame(id);
			
			return Action.INPUT;
		}
		
		if (fieldsHasError())
			return Action.INPUT;
		
		try {
			examesService.updateExame(exame);
		} catch (RequiredFieldsException e) {
			e.printStackTrace();
			return Action.INPUT;
		}
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer toDelete;
	
	@Getter
	@Setter
	private boolean deletionError = false;
	
	public String delete() {
		
		try {
			examesService.deleteExame(toDelete);
		} catch (ExameDeletionException e) {
			deletionError = true;
			return Action.ERROR;
		}
		
		return Action.SUCCESS;
	}
	
	private boolean fieldsHasError() {
		boolean valid = false;
		
		if (exame != null && exame.getNmExame().isBlank()) {
			addFieldError("nmExame", "Nome é obrigatório");
			valid = true;
		}
		
		return valid;
	}
}