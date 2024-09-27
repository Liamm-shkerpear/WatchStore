/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import Model.User;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
    
    public String getRandom() {
        Random random = new Random();
        int number = random.nextInt(999999);
        return String.format("%06d", number);
    }
    
    public boolean sendEmail(User user, String otp) {
        boolean test = false;
        
        String toEmail = user.getEmail();
        final String fromEmail = "minhtri192035@gmail.com";
        final String password = "vlrzcqbmnezqbbxm";
        try {
            Properties p = new Properties();
            p.put("mail.smtp.host", "smtp.gmail.com");
            p.put("mail.smtp.port", "587");
            p.put("mail.smtp.auth", "true");
            p.put("mail.smtp.starttls.enable", "true");

            Session s = Session.getInstance(p, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            Message msg = new MimeMessage(s);
            msg.setFrom(new InternetAddress(fromEmail));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            msg.setSubject("User email verification");
            msg.setText("Your OTP: " + otp);
            Transport.send(msg);
            test = true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return test;
    }
}