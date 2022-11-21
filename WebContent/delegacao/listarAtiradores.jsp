<%@page import="persistencia.AtiradorBD" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dominio.Atirador" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de atiradores</title>
</head>
<body>
	<h1>Lista de Atiradores</h1>
	
	<table>
		<thead>
			<tr>	
				<th>Número</th>
				<th>Nome</th>
				<th>Pontos</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	<%
	ArrayList<Atirador> atiradores= AtiradorBD.listar();
	
	for(int i=0; i < atiradores.size(); i++){
		Atirador cadaAtirador = atiradores.get(i);
		%>
		<tr>
			<td><%=cadaAtirador.getNumero()%></td>
			<td><%=cadaAtirador.getNome()%></td>
			<td><%=cadaAtirador.getPontos()%></td>
			<td>
				<a href="cadastrarAtirador.jsp?nmr=<%=cadaAtirador.getNumero()%>" >Alterar</a>
				<a href="excluirAtirador.jsp?nmr=<%=cadaAtirador.getNumero()%>" onclick="return confirm('Deseja realmente excluir?')" >Excluir</a>
			</td>
		</tr>
		<%
		
	}
	%>
		</tbody>
	</table>
	
	
</body>
</html>