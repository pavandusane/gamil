<%-- 
    Document   : send2
    Created on : Mar 8, 2020, 9:40:36 PM
    Author     : Pavan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import= "java.util.Date" %>
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

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
                    String str=request.getParameter("email");
			 final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
		     //Get a Properties object
			 Properties props = System.getProperties();
			 props.setProperty("mail.smtp.host", "smtp.gmail.com");
			 props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
			 props.setProperty("mail.smtp.socketFactory.fallback", "false");
			 props.setProperty("mail.smtp.port", "465");
			 props.setProperty("mail.smtp.socketFactory.port", "465");
			 props.put("mail.smtp.auth", "true");
			 props.put("mail.debug", "true");
                         props.put("mail.smtp.port","888");
                         props.put("mail.smtp.connectiontimeout","t1");
                         props.put("mail.smtp.timeout","t2");
                         props.put("mail.store.protocol", "pop3");
			 props.put("mail.transport.protocol", "smtp");
			 final String username = "dusanepv7@gmail.com";//
			 final String password = "pavanvd@3210";
                         out.println(str);    
                         try{
			 Session session1 = Session.getInstance(props, 
                         new Authenticator(){
                         protected PasswordAuthentication getPasswordAuthentication() {
                         return new PasswordAuthentication(username, password);
			 }});
                        javax.mail.Transport transport = session1.getTransport("smtp");
                         Message message = new MimeMessage(session1);
                         message.setFrom(new InternetAddress("dusanepv7@gmail.com"));
                         message.setRecipients(
                         Message.RecipientType.TO,
                         InternetAddress.parse(str)
                         );
                         out.println("Hello");
                         message.setSubject("Your Digi-Mart.in order is successful placed");
                         out.println("Hello");
                         message.setText("Hello Pavan,"+ "\n\n Thank You For Your Order!"+"\n\n ");
                         out.println("Hello");
                         transport.send(message);
                         out.println("Hello");
                         System.out.println("Done");
                         }catch (MessagingException e){ System.out.println("Erreur d'envoi, cause: " + e);
                        
                         }
                    %>
                    <h1>Hello World!</h1>
    </body>
</html>
