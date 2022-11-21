<%@page import="persistencia.AtiradorBD"%>

<%
	String numero = request.getParameter("nmr");
	AtiradorBD.excluir(numero);
	response.sendRedirect("tipoAtleta.jsp");
%>