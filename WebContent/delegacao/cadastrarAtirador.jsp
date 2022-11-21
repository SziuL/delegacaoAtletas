<%@page import="dominio.Atirador" %>
<%@page import="persistencia.AtiradorBD" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastro Atirador</title>
	</head>
	
	<body>
		<%
		Atirador atirador = null;
		
		
		String numero = request.getParameter("nmr");
		if(numero != null){
			atirador = AtiradorBD.getByNumero(numero);
			
		}else{
			atirador = new Atirador();
		}
		
		
		
		%>	
	
		<h1>Cadastro de corredores</h1>
		<form name="formCadastro" method="post" action="salvarAtirador.jsp">
			<label>Nome</label>
			<input type="text" name="nome" value="<%=atirador.getNome()%>" />
			<br />
			<label>Número</label>
			<input type="text" name="numero" value="<%=atirador.getNumero()%>" />
			<br>
			<label>Pontos</label>
			<input type="text" name="pontos" value="<%=atirador.getPontos()%>" />
			
			<br />
			
		
			
			<input type="submit" name="salvar" value="Salvar"/>
			<input type="hidden" name="alterado" value="<%=numero%>"/>
			</form>

	</body>
</html>