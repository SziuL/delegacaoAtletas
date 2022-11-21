<%@page import="dominio.Corredor" %>
<%@page import="persistencia.CorredorBD" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastro Corredor</title>
	</head>
	
	<body>
		<%
		Corredor corredor = null;
		
		
		String numero = request.getParameter("nmr");
		if(numero != null){
			corredor = CorredorBD.getByNumero(numero);
			
		}else{
			corredor = new Corredor();
		}
		
		
		
		%>	
	
		<h1>Cadastro de corredores</h1>
		<form name="formCadastro" method="post" action="salvarCorredor.jsp">
			<label>Nome</label>
			<input type="text" name="nome" value="<%=corredor.getNome()%>" />
			<br />
			<label>Número</label>
			<input type="text" name="numero" value="<%=corredor.getNumero()%>" />
			<br>
			<label>Velocidade</label>
			<input type="text" name="velocidade" value="<%=corredor.getVelocidade()%>" />
			
			<br />
			
		
			
			<input type="submit" name="salvar" value="Salvar"/>
			<input type="hidden" name="alterado" value="<%=numero%>"/>
			</form>

	</body>
</html>