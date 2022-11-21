<%@page import="dominio.Nadador" %>
<%@page import="persistencia.NadadorBD" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cadastro Nadador</title>
	</head>
	
	<body>
		<%
		Nadador nadador = null;
		
		
		String numero = request.getParameter("nmr");
		if(numero != null){
			nadador = NadadorBD.getByNumero(numero);
			
		}else{
			nadador = new Nadador();
		}
		
		
		
		%>
	
		<h1>Cadastro de nadadores</h1>
		<form name="formCadastro" method="post" action="salvarNadador.jsp">
			<label>Nome</label>
			<input type="text" name="nome" value="<%=nadador.getNome()%>" />
			<br />
			<label>Número</label>
			<input type="text" name="numero" value="<%=nadador.getNumero()%>" />
			<br>
			<label>Estilo</label>
			<input type="text" name="estilo" value="<%=nadador.getEstilo()%>" />

			<br />
			
		
			
			<input type="submit" name="salvar" value="Salvar"/>
			<input type="hidden" name="alterado" value="<%=numero%>"/>
			</form>

	</body>
</html>