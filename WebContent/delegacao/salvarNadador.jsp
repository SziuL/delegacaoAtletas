<%@page import="dominio.Nadador" %>
<%@page import="persistencia.NadadorBD" %>
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
	String modalidade = "nadador";
	String numero = request.getParameter("numero");
	String estilo = request.getParameter("estilo");
	
	Nadador nadador;
	
	
	if(alterado != null){	
		nadador = NadadorBD.getByNumero(alterado);
	}
	nadador = new Nadador();
	
	
	nadador.setNome(nome);
	nadador.setNumero(numero);
	nadador.setEstilo(estilo);
	
	if(alterado != null){
		NadadorBD.alterar(nadador);
	}else{
		NadadorBD.inserir(nadador);
	}
	%>
	
	Nadador cadastrado com sucesso!
	<% response.sendRedirect("tipoAtleta.jsp"); %>
	
	

</body>
</html>