<%@page import="dominio.Saltador" %>
<%@page import="persistencia.SaltadorBD" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastro Saltador</title>
	</head>
	
	<body>
		<%
		Saltador saltador = null;
		
		
		String numero = request.getParameter("nmr");
		if(numero != null){
			saltador = SaltadorBD.getByNumero(numero);
			
		}else{
			saltador = new Saltador();
		}
		
		
		
		%>	
	
		<h1>Cadastro de saltadores</h1>
		<form name="formCadastro" method="post" action="salvarSaltador.jsp">
			<label>Nome</label>
			<input type="text" name="nome" value="<%=saltador.getNome()%>" />
			<br />
			<label>Número</label>
			<input type="text" name="numero" value="<%=saltador.getNumero()%>" />
			<br>
			<label>Altura</label>
			<input type="text" name="altura" value="<%=saltador.getAltura()%>" />
			
			<br />
			
		
			
			<input type="submit" name="salvar" value="Salvar"/>
			<input type="hidden" name="alterado" value="<%=numero%>"/>
			</form>

	</body>
</html>