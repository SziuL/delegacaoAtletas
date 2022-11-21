<%@page import="dominio.Corredor" %>
<%@page import="persistencia.CorredorBD" %>
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
	String modalidade = "corredor";
	String numero = request.getParameter("numero");
	String velocidade = request.getParameter("velocidade");
	
	Corredor corredor;
	
	
	if(alterado != null){
		corredor = CorredorBD.getByNumero(alterado);
	}
	corredor = new Corredor();
	
	
	corredor.setNome(nome);
	corredor.setNumero(numero);
	corredor.setVelocidade(velocidade);
	
	if(alterado != null){
		CorredorBD.alterar(corredor);
	}else{
		CorredorBD.inserir(corredor);
	}
	%>
	
	Atirador cadastrado com sucesso!
	<% response.sendRedirect("tipoAtleta.jsp"); %>
	
	

</body>
</html>