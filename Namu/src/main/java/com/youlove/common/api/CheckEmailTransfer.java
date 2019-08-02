package com.youlove.common.api;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

/**
 * 
 * @author 김성용
 * @since 2019.06.08
 * 				사용 방법
 * 			Google 계정 > 보안 > 보안 수준이 낮은 앱의 액세스 ( 사용 )
 * 			Gmail > 설정 > 전달 및 POP/IMAP >   POP설정 허용, IMAP 사용
 * 
 * 			lib - https://mvnrepository.com/artifact/javax.mail/mail/1.4.7
 * 
 * 
 */			


public class CheckEmailTransfer {

	
	
	
	public static void gmailSend(String title, String content, String receiver,HttpServletRequest request) {
		
	final String user = "bityong0802@gmail.com";
	final String password = "gnfkqh12";
	
	Properties prop = new Properties(); 
	prop.put("mail.smtp.host", "smtp.gmail.com"); 
	prop.put("mail.smtp.port", 465); 
	prop.put("mail.smtp.auth", "true"); 
	prop.put("mail.smtp.ssl.enable", "true"); 
	prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
	
	
	Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(user, password);
        }
    });
	
	

    try {
    	//Transport transport = session.getTransport();
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(user));

        //수신자메일주소
        message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 

        // 메일 제목
        message.setSubject(title); 

        // 메일 내용
        //message.setText(content);
        //message.setContent(content,"text/html; charset=UTF-8");

        
        MimeMultipart multipart = new MimeMultipart("related");
        
     // first part  (the html)
        BodyPart messageBodyPart = new MimeBodyPart();
        String htmlText = "<img width='200' src=\"cid:image\">"+content;
        messageBodyPart.setContent(htmlText, "text/html; charset=UTF-8");
        
        // add it
        multipart.addBodyPart(messageBodyPart);
        
        
     // second part (the image)
        messageBodyPart = new MimeBodyPart();
        DataSource fds = new FileDataSource
        		(request.getSession().getServletContext().getRealPath("resources")+"\\images\\youloveplan_logo.png");
          //("C:\\images\\AT.png");
        messageBodyPart.setDataHandler(new DataHandler(fds));
        messageBodyPart.setHeader("Content-ID","<image>");
        
     // add it
        multipart.addBodyPart(messageBodyPart);
        
     // put everything together
        message.setContent(multipart);
        
       
        // 메일 전송
        
        Transport.send(message);
        
        System.out.println("message sent successfully...");
        
    } catch (AddressException e) {
        e.printStackTrace();
    } catch (MessagingException e) {
        e.printStackTrace();
    }


	}
	
}
