package utils;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Thư viện: https://mvnrepository.com/artifact/com.sun.mail/javax.mail Tao mật
 * khẩu ứng dụng: https://myaccount.google.com/apppasswords
 */
public class EmailUtils {

    // Thông tin tài khoản email dùng để gửi (thay đổi thông tin này)
    private static final String EMAIL_USERNAME = "bloomonfoot@gmail.com";
    private static final String EMAIL_PASSWORD = "wuth arym basu svdx";

    // Cấu hình SMTP server
    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";

    /**
     * Gửi email thông báo đăng ký thành công
     *
     * @param toEmail Địa chỉ email người nhận
     * @param fullName Tên đầy đủ của người dùng
     * @param userID ID người dùng
     * @return true nếu gửi email thành công, false nếu có lỗi
     */
    public static boolean sendRegistrationEmail(String toEmail, String fullName, String userID) {
        try {
            // Thiết lập các thuộc tính
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", SMTP_HOST);
            props.put("mail.smtp.port", SMTP_PORT);

            // Tạo phiên xác thực
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
                }
            });

            // Tạo message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Welcome to Our Website - Registration Successful");

            // Xây dựng nội dung HTML email
            String htmlContent = createRegistrationEmailContent(fullName, userID);
            message.setContent(htmlContent, "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    
    public static boolean sendOTPEmail(String toEmail, String fullName, String otp) {
        try {
            // Thiết lập các thuộc tính SMTP
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", SMTP_HOST);
            props.put("mail.smtp.port", SMTP_PORT);

            // Tạo phiên SMTP với xác thực
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
                }
            });

            // Tạo email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Your OTP Code - Reset Password");

            // Nội dung HTML của email
            String htmlContent = createOTPEmailContent(fullName, otp);
            message.setContent(htmlContent, "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Xây dựng nội dung HTML cho email đăng ký thành công
     *
     * @param fullName Tên đầy đủ người dùng
     * @param userID ID người dùng
     * @return Chuỗi HTML hoàn chỉnh cho nội dung email
     */
    private static String createRegistrationEmailContent(String fullName, String userID) {
        return "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <title>Registration Successful</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: 'Segoe UI', Arial, sans-serif;\n"
                + "            line-height: 1.6;\n"
                + "            color: #333;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "            background-color: #f5f7fa;\n"
                + "        }\n"
                + "        .container {\n"
                + "            max-width: 600px;\n"
                + "            margin: 20px auto;\n"
                + "            padding: 0;\n"
                + "            background-color: #ffffff;\n"
                + "            border-radius: 8px;\n"
                + "            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);\n"
                + "            overflow: hidden;\n"
                + "        }\n"
                + "        .header {\n"
                + "            background-color: #ff5e3a;\n"
                + "            background-image: linear-gradient(to right, #ff5e3a, #ff7e5f);\n"
                + "            color: white;\n"
                + "            padding: 30px 20px;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        .header h1 {\n"
                + "            margin: 0;\n"
                + "            font-weight: 600;\n"
                + "            font-size: 28px;\n"
                + "            letter-spacing: 0.5px;\n"
                + "        }\n"
                + "        .content {\n"
                + "            padding: 30px;\n"
                + "            background-color: white;\n"
                + "        }\n"
                + "        .content h2 {\n"
                + "            color: #2c3e50;\n"
                + "            margin-top: 0;\n"
                + "            font-size: 22px;\n"
                + "        }\n"
                + "        .content p {\n"
                + "            margin-bottom: 16px;\n"
                + "            color: #4a4a4a;\n"
                + "        }\n"
                + "        .login-info {\n"
                + "            background-color: #fff5f2;\n"
                + "            border-left: 4px solid #ff5e3a;\n"
                + "            padding: 15px;\n"
                + "            margin: 20px 0;\n"
                + "            border-radius: 0 4px 4px 0;\n"
                + "        }\n"
                + "        .button {\n"
                + "            display: inline-block;\n"
                + "            padding: 12px 24px;\n"
                + "            background-color: #ff5e3a;\n"
                + "            color: white;\n"
                + "            text-decoration: none;\n"
                + "            border-radius: 4px;\n"
                + "            margin: 20px 0;\n"
                + "            font-weight: 600;\n"
                + "            text-align: center;\n"
                + "            transition: background-color 0.3s;\n"
                + "        }\n"
                + "        .button:hover {\n"
                + "            background-color: #e84c2b;\n"
                + "        }\n"
                + "        .footer {\n"
                + "            text-align: center;\n"
                + "            margin-top: 10px;\n"
                + "            padding: 20px;\n"
                + "            font-size: 13px;\n"
                + "            color: #7f8c8d;\n"
                + "            border-top: 1px solid #eaeaea;\n"
                + "            background-color: #fafafa;\n"
                + "        }\n"
                + "        .signature {\n"
                + "            margin-top: 30px;\n"
                + "            padding-top: 15px;\n"
                + "            border-top: 1px solid #eaeaea;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <div class=\"header\">\n"
                + "            <h1>Welcome to Our Website!</h1>\n"
                + "        </div>\n"
                + "        <div class=\"content\">\n"
                + "            <h2>Hello, " + fullName + " !</h2>\n"
                + "            <p>Thank you for registering with our website. Your account has been successfully created.</p>\n"
                + "            \n"
                + "            <div class=\"login-info\">\n"
                + "                <p><strong>Your login information:</strong></p>\n"
                + "                <p>Username: <strong>" + userID + "</strong></p>\n"
                + "            </div>\n"
                + "            \n"
                + "            <p>You can now login to your account and start exploring our services.</p>\n"
                + "            <a href=\"http://yourwebsite.com/login\" class=\"button\">Login to Your Account</a>\n"
                + "            \n"
                + "            <div class=\"signature\">\n"
                + "                <p>If you have any questions or need assistance, please don't hesitate to contact our support team.</p>\n"
                + "                <p>Best regards,<br><strong>The Team</strong></p>\n"
                + "            </div>\n"
                + "        </div>\n"
                + "        <div class=\"footer\">\n"
                + "            <p>This is an automated message, please do not reply to this email.</p>\n"
                + "            <p>&copy; 2025 Your Company. All rights reserved.</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>\n";
    }

    private static String createOTPEmailContent(String fullName, String otp) {
        return "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <title>Password Reset Code</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: 'Segoe UI', Arial, sans-serif;\n"
                + "            line-height: 1.6;\n"
                + "            color: #333;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "            background-color: #f5f7fa;\n"
                + "        }\n"
                + "        .container {\n"
                + "            max-width: 600px;\n"
                + "            margin: 20px auto;\n"
                + "            padding: 0;\n"
                + "            background-color: #ffffff;\n"
                + "            border-radius: 8px;\n"
                + "            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);\n"
                + "            overflow: hidden;\n"
                + "        }\n"
                + "        .header {\n"
                + "            background-color: #ff5e3a;\n"
                + "            background-image: linear-gradient(to right, #ff5e3a, #ff7e5f);\n"
                + "            color: white;\n"
                + "            padding: 30px 20px;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        .header h1 {\n"
                + "            margin: 0;\n"
                + "            font-weight: 600;\n"
                + "            font-size: 28px;\n"
                + "            letter-spacing: 0.5px;\n"
                + "        }\n"
                + "        .content {\n"
                + "            padding: 30px;\n"
                + "            background-color: white;\n"
                + "        }\n"
                + "        .content h2 {\n"
                + "            color: #2c3e50;\n"
                + "            margin-top: 0;\n"
                + "            font-size: 22px;\n"
                + "        }\n"
                + "        .content p {\n"
                + "            margin-bottom: 16px;\n"
                + "            color: #4a4a4a;\n"
                + "        }\n"
                + "        .otp-code {\n"
                + "            background-color: #fff5f2;\n"
                + "            border: 2px dashed #ff5e3a;\n"
                + "            padding: 20px;\n"
                + "            margin: 25px 0;\n"
                + "            border-radius: 6px;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        .otp-code h2 {\n"
                + "            margin: 0;\n"
                + "            color: #ff5e3a;\n"
                + "            font-size: 42px;\n"
                + "            letter-spacing: 5px;\n"
                + "            font-weight: 700;\n"
                + "        }\n"
                + "        .button {\n"
                + "            display: inline-block;\n"
                + "            padding: 12px 24px;\n"
                + "            background-color: #ff5e3a;\n"
                + "            color: white;\n"
                + "            text-decoration: none;\n"
                + "            border-radius: 4px;\n"
                + "            margin: 20px 0;\n"
                + "            font-weight: 600;\n"
                + "            text-align: center;\n"
                + "            transition: background-color 0.3s;\n"
                + "        }\n"
                + "        .button:hover {\n"
                + "            background-color: #e84c2b;\n"
                + "        }\n"
                + "        .warning {\n"
                + "            background-color: #fff9f2;\n"
                + "            border-left: 4px solid #ffaa5f;\n"
                + "            padding: 15px;\n"
                + "            margin: 20px 0;\n"
                + "            border-radius: 0 4px 4px 0;\n"
                + "            font-size: 14px;\n"
                + "        }\n"
                + "        .footer {\n"
                + "            text-align: center;\n"
                + "            margin-top: 10px;\n"
                + "            padding: 20px;\n"
                + "            font-size: 13px;\n"
                + "            color: #7f8c8d;\n"
                + "            border-top: 1px solid #eaeaea;\n"
                + "            background-color: #fafafa;\n"
                + "        }\n"
                + "        .expiry {\n"
                + "            font-weight: bold;\n"
                + "            color: #e84c2b;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <div class=\"header\">\n"
                + "            <h1>Password Reset Code</h1>\n"
                + "        </div>\n"
                + "        <div class=\"content\">\n"
                + "            <h2>Hello, "+ fullName +"!</h2>\n"
                + "            <p>We received a request to reset your password. Use the verification code below to complete the process:</p>\n"
                + "            \n"
                + "            <div class=\"otp-code\">\n"
                + "                <h2>"+ otp +"</h2>\n"
                + "            </div>\n"
                + "            \n"
                + "            <p>Enter this code on the password reset page to verify your identity and create a new password.</p>\n"
                + "            <p>This code will expire in <span class=\"expiry\">5 minutes</span>.</p>\n"
                + "            \n"
                + "            <a href=\"http://yourwebsite.com/reset-password\" class=\"button\">Reset Password</a>\n"
                + "            \n"
                + "            <div class=\"warning\">\n"
                + "                <p><strong>Security Notice:</strong> If you didn't request this password reset, please ignore this email or contact our support team immediately as your account may be at risk.</p>\n"
                + "            </div>\n"
                + "            \n"
                + "            <p>For security reasons, never share this code with anyone, including our support team. We will never ask for your verification code.</p>\n"
                + "            \n"
                + "            <p>Best regards,<br><strong>The Security Team</strong></p>\n"
                + "        </div>\n"
                + "        <div class=\"footer\">\n"
                + "            <p>This is an automated message, please do not reply to this email.</p>\n"
                + "            <p>&copy; 2025 Your Company. All rights reserved.</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>\n";
    }

    /**
     * Gửi email xác thực đăng ký với token xác thực
     *
     * @param toEmail Địa chỉ email người nhận
     * @param fullName Tên đầy đủ của người dùng
     * @param token Token xác thực
     * @return true nếu gửi email thành công, false nếu có lỗi
     */
    public static boolean sendVerificationEmail(String toEmail, String fullName, String token) {
        try {
            // Thiết lập các thuộc tính
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", SMTP_HOST);
            props.put("mail.smtp.port", SMTP_PORT);

            // Tạo phiên xác thực
            Session session = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(EMAIL_USERNAME, EMAIL_PASSWORD);
                }
            });

            // Tạo message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(EMAIL_USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Account Verification Required");

            // Xây dựng nội dung HTML email
            String verificationLink = "http://yourwebsite.com/verify?token=" + token;
            String htmlContent = createVerificationEmailContent(fullName, verificationLink);
            message.setContent(htmlContent, "text/html; charset=utf-8");

            // Gửi email
            Transport.send(message);

            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Xây dựng nội dung HTML cho email xác thực tài khoản
     *
     * @param fullName Tên đầy đủ người dùng
     * @param verificationLink Đường dẫn xác thực
     * @return Chuỗi HTML hoàn chỉnh cho nội dung email
     */
    private static String createVerificationEmailContent(String fullName, String verificationLink) {
        return "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "    <meta charset=\"UTF-8\">\n"
                + "    <title>Verify Your Account</title>\n"
                + "    <style>\n"
                + "        body {\n"
                + "            font-family: Arial, sans-serif;\n"
                + "            line-height: 1.6;\n"
                + "            color: #333;\n"
                + "            margin: 0;\n"
                + "            padding: 0;\n"
                + "        }\n"
                + "        .container {\n"
                + "            max-width: 600px;\n"
                + "            margin: 0 auto;\n"
                + "            padding: 20px;\n"
                + "            background-color: #f9f9f9;\n"
                + "        }\n"
                + "        .header {\n"
                + "            background-color: #4a90e2;\n"
                + "            color: white;\n"
                + "            padding: 20px;\n"
                + "            text-align: center;\n"
                + "        }\n"
                + "        .content {\n"
                + "            padding: 20px;\n"
                + "            background-color: white;\n"
                + "            border-radius: 5px;\n"
                + "        }\n"
                + "        .button {\n"
                + "            display: inline-block;\n"
                + "            padding: 10px 20px;\n"
                + "            background-color: #4a90e2;\n"
                + "            color: white;\n"
                + "            text-decoration: none;\n"
                + "            border-radius: 5px;\n"
                + "            margin: 20px 0;\n"
                + "        }\n"
                + "        .footer {\n"
                + "            text-align: center;\n"
                + "            margin-top: 20px;\n"
                + "            font-size: 12px;\n"
                + "            color: #666;\n"
                + "        }\n"
                + "    </style>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <div class=\"container\">\n"
                + "        <div class=\"header\">\n"
                + "            <h1>Verify Your Account</h1>\n"
                + "        </div>\n"
                + "        <div class=\"content\">\n"
                + "            <h2>Hello, " + fullName + "!</h2>\n"
                + "            <p>Thank you for registering with our website. To complete your registration, please verify your email address by clicking the button below:</p>\n"
                + "            <a href=\"" + verificationLink + "\" class=\"button\">Verify Your Account</a>\n"
                + "            <p>If the button doesn't work, you can also copy and paste the following link into your browser:</p>\n"
                + "            <p><a href=\"" + verificationLink + "\">" + verificationLink + "</a></p>\n"
                + "            <p>This verification link will expire in 24 hours.</p>\n"
                + "            <p>If you did not sign up for an account, please ignore this email.</p>\n"
                + "            <p>Best regards,<br>The Team</p>\n"
                + "        </div>\n"
                + "        <div class=\"footer\">\n"
                + "            <p>This is an automated message, please do not reply to this email.</p>\n"
                + "            <p>&copy; 2025 Your Company. All rights reserved.</p>\n"
                + "        </div>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";
    }

}
