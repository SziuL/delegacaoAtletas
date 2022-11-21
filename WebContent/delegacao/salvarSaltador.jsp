<%@page import="dominio.Saltador" %>
<%@page import="persistencia.SaltadorBD" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Salvar atleta</title>
</head>
<body>
	<%
	String alterado = request.getParameter("alterado");
	
	String nome = request.getParameter("nome");
	String modalidade = "saltador";
	String numero = request.getParameter("numero");
	String altura = request.getParameter("altura");
	
	Saltador saltador;
	
	
	if(alterado != null){
		saltador = SaltadorBD.getByNumero(alterado);
	}
	saltador = new Saltador();
	
	
	saltador.setNome(nome);
	saltador.setNumero(numero);
	saltador.setAltura(altura);
	
	if(alterado != null){
		SaltadorBD.alterar(saltador);
	}else{
		SaltadorBD.inserir(saltador);
	}
	%>
	
	Saltador cadastrado com sucesso!
	<% response.sendRedirect("tipoAtleta.jsp"); %>
	
	

</body>
</html>