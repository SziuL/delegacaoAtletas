<%@page import="persistencia.SaltadorBD" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dominio.Saltador" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de saltadores</title>
</head>
<body>
	<h1>Lista de Saltadores</h1>
	
	<table>
		<thead>
			<tr>
				<th>Número</th>
				<th>Nome</th>
				<th>Altura</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	<%
	ArrayList<Saltador> saltadores = SaltadorBD.listar();
	
	for(int i=0; i < saltadores.size(); i++){
		Saltador cadaSaltador = saltadores.get(i);
		%>
		<tr>
			<td><%=cadaSaltador.getNumero()%></td>
			<td><%=cadaSaltador.getNome()%></td>
			<td><%=cadaSaltador.getAltura()%></td>
			<td>
				<a href="cadastrarSaltador.jsp?nmr=<%=cadaSaltador.getNumero()%>" >Alterar</a>
				<a href="excluirSaltador.jsp?nmr=<%=cadaSaltador.getNumero()%>" onclick="return confirm('Deseja realmente excluir?')" >Excluir</a>
			</td>
		</tr>
		<%
		
	}
	%>
		</tbody>
	</table>
	
	
</body>
</html>