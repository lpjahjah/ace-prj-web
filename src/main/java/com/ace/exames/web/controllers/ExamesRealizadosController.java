package com.ace.exames.web.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;

import com.ace.exames.core.exceptions.RequiredFieldsException;
import com.ace.exames.core.interfaces.ExamesRealizadosService;
import com.ace.exames.core.interfaces.ExamesService;
import com.ace.exames.core.interfaces.FuncionariosService;
import com.ace.exames.core.models.Exame;
import com.ace.exames.core.models.ExameRealizado;
import com.ace.exames.core.models.Funcionario;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;


public class ExamesRealizadosController extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/ExamesRealizadosService!com.ace.exames.core.interfaces.ExamesRealizadosService")
    private ExamesRealizadosService examesRealizadosService;
	
	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/FuncionariosService!com.ace.exames.core.interfaces.FuncionariosService")
    private FuncionariosService funcionariosService;
	
	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/ExamesService!com.ace.exames.core.interfaces.ExamesService")
    private ExamesService examesService;
	
	@Setter
	@Getter
	private List<ExameRealizado> examesRealizados = new ArrayList<>();
	
	@Getter
	@Setter
	private Integer cdExameRealizado;
	
	@Getter
	@Setter
	private Integer cdFuncionario; 
	
	@Getter
	@Setter
	private String nmFuncionario = ""; 
	
	@Getter
	@Setter
	private Integer cdExame; 
	
	@Getter
	@Setter
	private String nmExame = "";
	
	@Getter
	@Setter
	private Date dtRealizacao;
	
	@Setter
	@Getter
	private int page = 1;
	
	@Getter
	private int size = 10;
	
	public String examesRealizados() {		
		if (
				(cdExameRealizado != null && cdExameRealizado > 0) 
				|| (cdFuncionario != null && cdFuncionario > 0) 
				|| !nmFuncionario.isBlank() 
				|| (cdExame != null && cdExame > 0) 
				|| !nmExame.isBlank() 
				|| dtRealizacao != null 
			)
			examesRealizados = examesRealizadosService.searchExamesRealizados(
					cdExameRealizado, 
					cdFuncionario, 
					nmFuncionario,
					cdExame,
					nmExame,
					dtRealizacao,
					page, 
					size
			);
		else 
			examesRealizados = examesRealizadosService.getExamesRealizados(page, size);
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer id;
	
	@Getter
	@Setter
	private ExameRealizado exameRealizado;
	
	public String exameRealizado() {
		
		exameRealizado = examesRealizadosService.getExameRealizado(id);
		
		return Action.SUCCESS;
	}
	
	@Getter
	private List<Funcionario> funcionarios;
	
	@Getter
	@Setter
	private Integer selectedCdFuncionario;
	
	@Getter
	private List<Exame> exames;
	
	@Getter
	@Setter
	private Integer selectedCdExame;
	
	public String create() {
		if (exameRealizado == null || fieldsHasError()) {
			fillFuncionariosAndExames();
			
			return Action.INPUT;
		}
		
		Funcionario selectedFuncionario = new Funcionario();
		selectedFuncionario.setCdFuncionario(selectedCdFuncionario);
		
		Exame selectedExame = new Exame();
		selectedExame.setCdExame(selectedCdExame);
		
		exameRealizado.setFuncionario(selectedFuncionario);
		exameRealizado.setExame(selectedExame);
		
		try {
			examesRealizadosService.createExameRealizado(exameRealizado);
		} catch (RequiredFieldsException e) {
			e.printStackTrace();
			return Action.INPUT;
		}
		
		return Action.SUCCESS;
	}
	
	public String update() {
		if (exameRealizado == null) {
			exameRealizado = examesRealizadosService.getExameRealizado(id);
			
			fillFuncionariosAndExames();
			
			return Action.INPUT;
		}
		
		if (fieldsHasError()) {
			fillFuncionariosAndExames();
			
			return Action.INPUT;
		}
		
		Funcionario selectedFuncionario = new Funcionario();
		selectedFuncionario.setCdFuncionario(selectedCdFuncionario);
		
		Exame selectedExame = new Exame();
		selectedExame.setCdExame(selectedCdExame);
		
		exameRealizado.setFuncionario(selectedFuncionario);
		exameRealizado.setExame(selectedExame);
		
		try {
			examesRealizadosService.updateExameRealizado(exameRealizado);
		} catch (RequiredFieldsException e) {
			e.printStackTrace();
			return Action.INPUT;
		}
		
		return Action.SUCCESS;
	}
	
	@Getter
	@Setter
	private Integer toDelete;
	
	public String delete() {
		
		examesRealizadosService.deleteExameRealizado(toDelete);
		
		return Action.SUCCESS;
	}
	
	public String getFormattedDtRealizacao() {
		Date date = dtRealizacao != null ? dtRealizacao : exameRealizado.getDtRealizacao();
		
        if (date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(date);
        }
        
        return null;
    }
	
	private void fillFuncionariosAndExames() {
		funcionarios = funcionariosService.getAllFuncionariosOrderedByName();			
		exames = examesService.getAllExamesAtivosOrderedByName();
	}
	
	private boolean fieldsHasError() {
		boolean hasError = false;
		
		if (exameRealizado == null)
			return hasError;
		
		if (selectedCdFuncionario == null) {
			addFieldError("funcionario", "Funcionário é obrigatório");
			hasError = true;
		}
		
		if (selectedCdExame == null) {
			addFieldError("exame", "Exame é obrigatório");
			hasError = true;
		}
		
		if (exameRealizado.getDtRealizacao() == null) {
			addFieldError("dtRealizacao", "Data de realização é obrigatório");
			hasError = true;
		}
		
		return hasError;
	}
}