<%@page import="persistencia.SaltadorBD" %>
<%
	String numero = request.getParameter("nmr");
	SaltadorBD.excluir(numero);
	response.sendRedirect("tipoAtleta.jsp");
%>