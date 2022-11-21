<%@page import="dominio.Atirador" %>
<%@page import="persistencia.AtiradorBD" %>
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
	String modalidade = "atirador";
	String numero = request.getParameter("numero");
	String pontos = request.getParameter("pontos");
	
	Atirador atirador;
	
	
	if(alterado != null){
		atirador = AtiradorBD.getByNumero(alterado);
	}
	atirador = new Atirador();
	
	
	atirador.setNome(nome);
	atirador.setNumero(numero);
	atirador.setPontos(pontos);
	
	if(alterado != null){
		AtiradorBD.alterar(atirador);
	}else{
		AtiradorBD.inserir(atirador);
	}
	%>
	
	Atirador cadastrado com sucesso!
	<% response.sendRedirect("tipoAtleta.jsp"); %>
	
	

</body>
</html>