<%@page import="persistencia.CorredorBD" %>
<%
	String numero = request.getParameter("nmr");
	CorredorBD.excluir(numero);
	response.sendRedirect("tipoAtleta.jsp");
%>