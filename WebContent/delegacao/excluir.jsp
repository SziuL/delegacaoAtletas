<%@page import="persistencia.NadadorBD" %>
<%
	String numero = request.getParameter("nmr");
	NadadorBD.excluir(numero);
	response.sendRedirect("tipoAtleta.jsp");
%>