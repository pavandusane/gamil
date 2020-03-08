<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import= "javax.mail.*" %>
<%@page import= "javax.mail.internet.InternetAddress" %>
<%@page import= "javax.mail.internet.MimeMessage" %>
<%@page import= "java.util.Properties" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>  
<%      String str=request.getParameter("email");
        final String username = "dusanepv7@gmail.com";
        final String password = "pavanvd@3210";
        Properties prop = new Properties();
	prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.port", "465");
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.socketFactory.port", "465");
        prop.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
    
        try{
        Session session1 = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });        
            Message message = new MimeMessage(session1);
            message.setFrom(new InternetAddress("dusanepv7@gmail.com"));
            message.setRecipients(
            Message.RecipientType.TO,
            InternetAddress.parse(str)
            );
            message.setSubject("Your Digi-Mart.in order is successful placed");
            message.setText("Hello Pavan,"
                    + "\n\n Thank You For Your Order!"+"\n\n ");
            out.println("Hiii");
            Transport.send(message);
            System.out.println("Done");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
%>
 </body>
</html>