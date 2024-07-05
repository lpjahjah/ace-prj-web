package com.ace.exames.web.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;

import com.ace.exames.core.exceptions.InitialDateGreaterThanFinalDateException;
import com.ace.exames.core.interfaces.ExamesRealizadosService;
import com.ace.exames.core.models.ExameRealizado;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

import lombok.Getter;
import lombok.Setter;


public class RelatoriosController extends ActionSupport {
	
	private static final long serialVersionUID = 1L;

	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/ExamesRealizadosService!com.ace.exames.core.interfaces.ExamesRealizadosService")
    private ExamesRealizadosService examesRealizadosService;
	
	@Setter
	@Getter
	private List<ExameRealizado> examesRealizados = new ArrayList<>();
	
	@Getter
	@Setter
	private Date dtInicial;
	
	@Getter
	@Setter
	private Date dtFinal;
	
	public String relatorio() {		
		if (fieldsHasError()) {
			return Action.INPUT;
		}
		
		try {
			examesRealizados = examesRealizadosService.getExamesRealizadosBetween(dtInicial, dtFinal);
		} catch (InitialDateGreaterThanFinalDateException e) {
			e.printStackTrace();
			addActionError("O Campo de Data Final deve ser maior que o campo de Data Inicial.");
			return Action.INPUT;
		}
		
		return Action.SUCCESS;
	}
	
	public String getFormattedDtInicial() {
		Date date = dtInicial;
		
        if (date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(date);
        }
        
        return null;
    }
	
	public String getFormattedDtFinal() {
		Date date = dtFinal;
		
        if (date != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(date);
        }
        
        return null;
    }
	
	private boolean fieldsHasError() {
		boolean hasError = false;
		
		if (dtInicial == null) {
			addFieldError("funcionario", "Funcionário é obrigatório");
			hasError = true;
		}
		
		if (dtFinal == null) {
			addFieldError("exame", "Exame é obrigatório");
			hasError = true;
		}
		
		return hasError;
	}
}