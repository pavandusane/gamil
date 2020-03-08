<%@page import= "java.util.Date"%>
<%@ page import="java.util.Properties" %>
<%@ page import=" javax.mail.Authenticator" %>
<%@ page import=" javax.mail.Message" %>
<%@ page import=" javax.mail.MessagingException" %>
<%@ page import=" javax.mail.PasswordAuthentication" %>
<%@ page import=" javax.mail.Session" %>
<%@ page import=" javax.mail.Transport" %>
<%@ page import=" javax.mail.internet.AddressException" %>
<%@ page import=" javax.mail.internet.InternetAddress" %>
<%@ page import=" javax.mail.internet.MimeMessage" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        
        <%
     String str=request.getParameter("Email");
     final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
     Properties props = System.getProperties();
     props.setProperty("mail.smtp.host", "smtp.gmail.com");
     props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
     props.setProperty("mail.smtp.socketFactory.fallback", "false");
     props.setProperty("mail.smtp.port", "465");
     props.setProperty("mail.smtp.socketFactory.port", "465");
     props.put("mail.smtp.auth", "true");
     props.put("mail.debug", "true");
     props.put("mail.store.protocol", "pop3");
     props.put("mail.transport.protocol", "smtp");
     final String username = "digiplannersevent123@gmail.com";//
     final String password = "digiplannersbooking@1012";
     try{
     Session session1 = Session.getInstance(props, 
                          new Authenticator(){
                             protected PasswordAuthentication getPasswordAuthentication() {
                                return new PasswordAuthentication(username, password);
                             }});
     Message msg = new MimeMessage(session1);
     msg.setFrom(new InternetAddress("digiplannersevent123@gmail.com"));
     msg.setRecipients(Message.RecipientType.TO, 
                      InternetAddress.parse(str,false));
     msg.setSubject("Mail From :Digi_Planners");
     msg.setContent("<h1>Sucessfully Approved</h1><br><b>Registration Sucessfully Approved.You can now book events like birthdays,weddings,parties ,college events and many more.Login to you account and start booking.<br> Thank you for registration!! </b>","text/html");
     msg.setSentDate(new Date());
     Transport.send(msg);
     out.println("Message sent.......");
     %><h2> <% out.println("Message sent."); %> </h2> <%
         response.sendRedirect("login.jsp");
  }catch (MessagingException e){ System.out.println("Erreur d'envoi, cause: " + e);}
              %>
    </body>
</html>
