<%@page import="persistencia.CorredorBD" %>
<%@page import="java.util.ArrayList" %>
<%@page import="dominio.Corredor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lista de corredores</title>
</head>
<body>
	<h1>Lista de Corredores</h1>
	
	<table>
		<thead>
			<tr>	
				<th>Número</th>
				<th>Nome</th>
				<th>Velocidade</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
	<%
	ArrayList<Corredor> corredores = CorredorBD.listar();
	
	for(int i=0; i < corredores.size(); i++){
		Corredor cadaCorredor = corredores.get(i);
		%>
		<tr>
			<td><%=cadaCorredor.getNumero()%></td>
			<td><%=cadaCorredor.getNome()%></td>
			<td><%=cadaCorredor.getVelocidade()%></td>
			<td>
				<a href="cadastrarCorredor.jsp?nmr=<%=cadaCorredor.getNumero()%>" >Alterar</a>
				<a href="excluirCorredor.jsp?nmr=<%=cadaCorredor.getNumero()%>" onclick="return confirm('Deseja realmente excluir?')" >Excluir</a>
			</td>
		</tr>
		<%
		
	}
	%>
		</tbody>
	</table>
	
	
</body>
</html>