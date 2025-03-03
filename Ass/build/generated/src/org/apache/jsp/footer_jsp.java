package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <style>\r\n");
      out.write("            * {\r\n");
      out.write("                font-family: \"Montserrat\", sans-serif;\r\n");
      out.write("                margin: 0;\r\n");
      out.write("                padding: 0;\r\n");
      out.write("                box-sizing: border-box;\r\n");
      out.write("                text-decoration: none;\r\n");
      out.write("                outline: none;\r\n");
      out.write("                border: none;\r\n");
      out.write("                list-style-type: none;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            * {\r\n");
      out.write("                user-select: none;\r\n");
      out.write("                cursor: default;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            input:hover {\r\n");
      out.write("                cursor: text;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .footer a {\r\n");
      out.write("                color: #FFF;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("            footer {\r\n");
      out.write("                height: 400px;\r\n");
      out.write("                width: 100%;\r\n");
      out.write("                background-color: #C63F3E;\r\n");
      out.write("                position: relative;\r\n");
      out.write("                bottom: 0;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .footer {\r\n");
      out.write("                display: flex;\r\n");
      out.write("                align-items: start;\r\n");
      out.write("                justify-content: space-evenly;\r\n");
      out.write("                color: #FFF;\r\n");
      out.write("                padding-top: 80px;\r\n");
      out.write("                padding-bottom: 80px;\r\n");
      out.write("                margin: 0 10%;\r\n");
      out.write("                border-bottom: solid #EAE4DA 1px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-left p {\r\n");
      out.write("                max-width: 400px;\r\n");
      out.write("                margin-top: 16px;\r\n");
      out.write("                margin-bottom: 16px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-left div {\r\n");
      out.write("                gap: 16px\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-mid {\r\n");
      out.write("                margin-right: 100px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .social-ic i {\r\n");
      out.write("                color: #EAE4DA;\r\n");
      out.write("                font-size: 30px;\r\n");
      out.write("                margin-right: 16px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-mid li,h2 {\r\n");
      out.write("                margin-bottom: 8px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-mid i {\r\n");
      out.write("                color: #EAE4DA;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-contact {\r\n");
      out.write("                display: flex;\r\n");
      out.write("                flex-direction: column;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-contact {\r\n");
      out.write("                margin: 12px 0;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-contact a {\r\n");
      out.write("                margin-bottom: 8px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .Email {\r\n");
      out.write("                padding: 8px 12px;\r\n");
      out.write("                margin-bottom: 16px;\r\n");
      out.write("                border-bottom: solid #EAE4DA 5px;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .foot-right form {\r\n");
      out.write("                display: flex;\r\n");
      out.write("                flex-direction: column;\r\n");
      out.write("                gap: 2px;\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            .btn-submit {\r\n");
      out.write("                padding: 12px 24px;\r\n");
      out.write("                background-color: #1d1d1b;\r\n");
      out.write("                color: #FFF;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("            .footer a:hover {\r\n");
      out.write("                color: #fbe385;\r\n");
      out.write("            }\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        </style>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n");
      out.write("        <title>Document</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css\"\r\n");
      out.write("              integrity=\"sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==\"\r\n");
      out.write("              crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\r\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\r\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap\" rel=\"stylesheet\">\r\n");
      out.write("    </head>\r\n");
      out.write("\r\n");
      out.write("    <body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <footer>\r\n");
      out.write("            <div class=\"footer\">\r\n");
      out.write("                <div class=\"foot-left\">\r\n");
      out.write("                    <h2>INFORMATION</h2>\r\n");
      out.write("                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper\r\n");
      out.write("                        mattis,\r\n");
      out.write("                        pulvinar dapibus leo.</p>\r\n");
      out.write("                    <div class=\"social-ic\">\r\n");
      out.write("                        <a href=\"\"><i class=\"fa-brands fa-square-facebook\"></i></a>\r\n");
      out.write("                        <a href=\"\"><i class=\"fa-brands fa-square-x-twitter\"></i></a>\r\n");
      out.write("                        <a href=\"\"><i class=\"fa-brands fa-square-instagram\"></i></a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"foot-mid\">\r\n");
      out.write("                    <h2>NAVIGATION</h2>\r\n");
      out.write("                    <ul class=\"menu-navi\">\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <i class=\"fa-solid fa-angle-right\"></i>\r\n");
      out.write("                            <a href=\"\">Home</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <i class=\"fa-solid fa-angle-right\"></i>\r\n");
      out.write("                            <a href=\"\">Product</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                        <li>\r\n");
      out.write("                            <i class=\"fa-solid fa-angle-right\"></i>\r\n");
      out.write("                            <a href=\"\">About us</a>\r\n");
      out.write("                        </li>\r\n");
      out.write("                    </ul>\r\n");
      out.write("                </div>\r\n");
      out.write("                <div class=\"foot-right\">\r\n");
      out.write("                    <h2>CONTACT US</h2>\r\n");
      out.write("                    <div class=\"foot-contact\">\r\n");
      out.write("                        <a href=\"\"><i class=\"fa-solid fa-location-dot\"></i> HCM - VietNam</a>\r\n");
      out.write("                        <a href=\"\"><i class=\"fa-solid fa-envelope\"></i> hello123@gmail.com</a>\r\n");
      out.write("                    </div>\r\n");
      out.write("                    <form>\r\n");
      out.write("                        <input type=\"text\" placeholder=\"Email Address\" class=\"Email\">\r\n");
      out.write("                        <button class=\"btn-submit\">SUBMIT</button>\r\n");
      out.write("                    </form>\r\n");
      out.write("                </div>\r\n");
      out.write("            </div>\r\n");
      out.write("        </footer>\r\n");
      out.write("    </body>\r\n");
      out.write("\r\n");
      out.write("</html>\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
