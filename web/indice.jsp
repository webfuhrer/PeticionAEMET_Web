<%-- 
    Document   : indice
    Created on : 29-nov-2018, 9:41:10
    Author     : Mañanas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="paqueteaemet.Dia"%>
<%@page import="paqueteaemet.Clima"%>
<%@page import="org.jdom2.Document"%>
<%@page import="paqueteaemet.ParseaXML"%>
<%@page import="paqueteaemet.AccesoWeb"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
String respuesta=AccesoWeb.pedirXML("28079");
Document documento_xml=ParseaXML.convertirStringEnDocument(respuesta);
Clima c=ParseaXML.parsearXML(documento_xml);
ArrayList<Dia> lista_dias=c.getLista_dias();

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clima</title>
    </head>
    <body>
        <table>
            <tr><th>Día</th><th>Mínima</th><th>Máxima</th></tr>
            <%
                for (int i=0; i<lista_dias.size(); i++)
                { 
                Dia d=lista_dias.get(i);
            %>
            <tr><td><%=d.getFecha()%></td><td><%=d.getT_minima()%></td><td><%=d.getT_maxima()%></td></tr>
                <%}%>
        
                
            
            
        </table>
    </body>
</html>
