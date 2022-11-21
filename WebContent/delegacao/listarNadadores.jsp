<%@page import="persistencia.NadadorBD" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dominio.Nadador" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de nadadores</title>
</head>
<body>
	<h1>Lista de Nadadores</h1>
	
	<table>
		<thead>
			<tr>
				<th>Número</th>
				<th>Nome</th>
				<th>Estilo</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	<%
	ArrayList<Nadador> nadadores = NadadorBD.listar();
	
	for(int i=0; i < nadadores.size(); i++){
		Nadador cadaNadador = nadadores.get(i);
		%>
		<tr>
			<td><%=cadaNadador.getNumero()%></td>
			<td><%=cadaNadador.getNome()%></td>
			<td><%=cadaNadador.getEstilo()%></td>
			<td>
				<a href="cadastrarNadador.jsp?nmr=<%=cadaNadador.getNumero()%>" >Alterar</a>
				<a href="excluir.jsp?nmr=<%=cadaNadador.getNumero()%>" onclick="return confirm('Deseja realmente excluir?')" >Excluir</a>
			</td>
		</tr>
		<%
		
	}
	%>
		</tbody>
	</table>
	
	
</body>
</html>