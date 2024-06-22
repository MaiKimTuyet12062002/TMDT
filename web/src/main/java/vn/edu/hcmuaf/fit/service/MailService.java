package vn.edu.hcmuaf.fit.service;

        import java.io.UnsupportedEncodingException;
        import java.util.Date;
        import java.util.Properties;
        import javax.mail.*;
        import javax.mail.internet.InternetAddress;
        import javax.mail.internet.MimeMessage;
        import javax.mail.internet.MimeUtility;


public class MailService {

   static final String username = "webtmdttest@gmail.com";
    static final String password = "vdmmohpuwjmqiijg";

    public void sendMail(String to,String title, String content) {
        Properties prop = new Properties();
        prop.put("mail.smtp.host", "smtp.gmail.com");
        prop.put("mail.smtp.port", "587");//sử dụng TLS
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.ssl.protocols", "TLSv1.2");
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
       Authenticator authenticator = new Authenticator() {
           @Override
           protected PasswordAuthentication getPasswordAuthentication() {
               return new PasswordAuthentication(username,password);
           }
       };
       //Session
        Session session = Session.getInstance(prop,authenticator);
        //Tạo tin nhắn
        MimeMessage mimeMessage = new MimeMessage(session);
        try {
            mimeMessage.addHeader("Content-Type","text/HTML; charset=UTF-8");
        mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipients(Message.RecipientType.TO,InternetAddress.parse(to,false));
            mimeMessage.setSubject(MimeUtility.encodeText(title, "UTF-8", "Q"));
            mimeMessage.setContent(content,"text/HTML; charset=UTF-8");
            mimeMessage.setSentDate(new Date());
            Transport.send(mimeMessage);
            System.out.println("oke roi");
            System.out.println(content);
        } catch (MessagingException e) {
            System.out.println("loi roi ma");
            System.out.println(e.getMessage().toString());
            throw new RuntimeException(e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }
//    public void sendLink(String username, ){
//
//    }
    public static String randomKey() {
        String str = "qwert1yui2op3as4dfg5hj6klzx7cvb8nmQ9WE0RTYUIOPASDFGHJKLZXCVBNM";
        Integer length = str.length() - 1;
        StringBuilder stringBuilder = new StringBuilder("");
        for (int i = 0; i < 10; i++) {
            Integer ran = (int) (Math.random() * length);
            stringBuilder.append(str.charAt(ran));
        }
        return String.valueOf(stringBuilder);
    }

    public static String randomPassword() {
        String str = "qwert1yui2op3as4dfg5hj6klzx7cvb8nmQ9WE0RTYUIOPASDFGHJKLZXCVBNM";
        Integer length = str.length() - 1;
        StringBuilder stringBuilder = new StringBuilder("");
        for (int i = 0; i < 6; i++) {
            Integer ran = (int) (Math.random() * length);
            stringBuilder.append(str.charAt(ran));
        }
        return String.valueOf(stringBuilder);
    }

    public static void main(String[] args) {
        MailService mailService = new MailService();

        mailService.sendMail("giadinh05082003@gmail.com","ngọc thảo","ngọc thảo");
    }
}
