package com.ace.exames.web.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.ejb.EJB;

import com.ace.exames.core.interfaces.ExamesService;
import com.ace.exames.core.models.Exame;

import com.opensymphony.xwork2.Action;

import lombok.Getter;


public class ExamesController {
	
	@EJB(lookup  = "ejb:\"\"/core-0.0.1-SNAPSHOT/\"\"/ExamesService!com.ace.exames.core.interfaces.ExamesService")
    private ExamesService examesService;
	
	@Getter
	public List<Exame> exames = new ArrayList<>();
	
	public String exames() {
		if (examesService == null)
			System.out.println("BEAN IS NULL");
		
		this.exames = examesService.getExames();
		
		return Action.SUCCESS;
	}
}