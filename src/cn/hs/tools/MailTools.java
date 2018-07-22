package cn.hs.tools;
import org.apache.commons.mail.EmailException;  
import org.apache.commons.mail.HtmlEmail;  
import org.apache.log4j.Logger;

import cn.hs.pojo.Mail;  

//邮箱工具类--发送邮件
public class MailTools {

	 protected final Logger logger = Logger.getLogger(getClass());  
	  
	    public boolean send(Mail mail) {  
	        // 发送email  
	        HtmlEmail email = new HtmlEmail();  
	        try {  
	            // 这里是SMTP发送服务器的名字：163的如下："smtp.163.com"  
	            email.setHostName(mail.getHost());  
	            // 字符编码集的设置  
	            email.setCharset(Mail.ENCODEING);  
	            // 收件人的邮箱  
	            email.addTo(mail.getReceiver());  
	            // 发送人的邮箱  
	            email.setFrom(mail.getSender(), mail.getName());  
	            // 如果需要认证信息的话，设置认证：用户名-密码。分别为发件人在邮件服务器上的注册名称和密码  
	            email.setAuthentication(mail.getUsername(), mail.getPassword());  
	            // 要发送的邮件主题  
	            email.setSubject(mail.getSubject());  
	            // 要发送的信息，由于使用了HtmlEmail，可以在邮件内容中使用HTML标签  
	            email.setMsg(mail.getMessage());  
	            // 发送  
	            email.send();  
	            if (logger.isDebugEnabled()) {  
	                logger.debug(mail.getSender() + " 发送邮件到 " + mail.getReceiver()+"成功！");  
	            }  
	            return true;  
	        } catch (EmailException e) {  
	            e.printStackTrace();  
	            logger.info(mail.getSender() + " 发送邮件到 " + mail.getReceiver()  
	                    + " 失败");  
	            return false;  
	        }  
	    }
	    
	  //根据管理邮箱选择不同邮件服务器smtp.163.com/smtp.sina.com/smtp.126.com
	    public String host(String name){
	    	String host = "";
	    	String flag = name.substring(name.indexOf("@")+1, name.indexOf("."));
	    	if(flag.equals("163")){
	    		host="smtp.163.com";
	    	}else if(flag.equals("126")){
	    		host="smtp.126.com";
	    	}else if(flag.equals("sina")){
	    		host="smtp.sina.com";
	    	}else{
	    		host="smtp.163.com";
	    	}
	    	return host;
	    }
}
