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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("<head>\n");
      out.write("    <style>\n");
      out.write("        * {\n");
      out.write("            font-family: \"Montserrat\", sans-serif;\n");
      out.write("            margin: 0;\n");
      out.write("            padding: 0;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("            text-decoration: none;\n");
      out.write("            outline: none;\n");
      out.write("            border: none;\n");
      out.write("            list-style-type: none;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        * {\n");
      out.write("            user-select: none;\n");
      out.write("            cursor: default;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        input:hover {\n");
      out.write("            cursor: text;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .footer a {\n");
      out.write("            color: #FFF;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        \n");
      out.write("\n");
      out.write("        footer {\n");
      out.write("            height: 400px;\n");
      out.write("            background-color: #C63F3E;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .footer {\n");
      out.write("            position: absolute;\n");
      out.write("            width: 80%;\n");
      out.write("            display: flex;\n");
      out.write("            align-items: start;\n");
      out.write("            justify-content: space-evenly;\n");
      out.write("            color: #FFF;\n");
      out.write("            padding-top: 80px;\n");
      out.write("            padding-bottom: 80px;\n");
      out.write("            margin: 0 10%;\n");
      out.write("            border-bottom: solid #EAE4DA 1px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-left p {\n");
      out.write("            max-width: 400px;\n");
      out.write("            margin-top: 16px;\n");
      out.write("            margin-bottom: 16px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-left div {\n");
      out.write("            gap: 16px\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-mid {\n");
      out.write("            margin-right: 100px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .social-ic i {\n");
      out.write("            color: #EAE4DA;\n");
      out.write("            font-size: 30px;\n");
      out.write("            margin-right: 16px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-mid li,h2 {\n");
      out.write("            margin-bottom: 8px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-mid i {\n");
      out.write("            color: #EAE4DA;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-contact {\n");
      out.write("            display: flex;\n");
      out.write("            flex-direction: column;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-contact {\n");
      out.write("            margin: 12px 0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .foot-contact a {\n");
      out.write("            margin-bottom: 8px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .Email {\n");
      out.write("            padding: 8px 12px;\n");
      out.write("            margin-bottom: 16px;\n");
      out.write("            border-bottom: solid #EAE4DA 5px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .btn {\n");
      out.write("            margin-top: 8px;\n");
      out.write("            padding: 12px 24px;\n");
      out.write("            background-color: #1d1d1b;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .footer a:hover {\n");
      out.write("            color: #fbe385;\n");
      out.write("        }\n");
      out.write("        \n");
      out.write("\n");
      out.write("    </style>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Document</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css\"\n");
      out.write("        integrity=\"sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==\"\n");
      out.write("        crossorigin=\"anonymous\" referrerpolicy=\"no-referrer\" />\n");
      out.write("    <link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("        <link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100..900;1,100..900&display=swap\" rel=\"stylesheet\">\n");
      out.write("</head>\n");
      out.write("\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    \n");
      out.write("    <footer>\n");
      out.write("        <div class=\"footer\">\n");
      out.write("            <div class=\"foot-left\">\n");
      out.write("                <h2>INFORMATION</h2>\n");
      out.write("                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper\n");
      out.write("                    mattis,\n");
      out.write("                    pulvinar dapibus leo.</p>\n");
      out.write("                <div class=\"social-ic\">\n");
      out.write("                    <a href=\"\"><i class=\"fa-brands fa-square-facebook\"></i></a>\n");
      out.write("                    <a href=\"\"><i class=\"fa-brands fa-square-x-twitter\"></i></a>\n");
      out.write("                    <a href=\"\"><i class=\"fa-brands fa-square-instagram\"></i></a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"foot-mid\">\n");
      out.write("                <h2>NAVIGATION</h2>\n");
      out.write("                <ul class=\"menu-navi\">\n");
      out.write("                    <li>\n");
      out.write("                        <i class=\"fa-solid fa-angle-right\"></i>\n");
      out.write("                        <a href=\"\">Home</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <i class=\"fa-solid fa-angle-right\"></i>\n");
      out.write("                        <a href=\"\">Product</a>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                        <i class=\"fa-solid fa-angle-right\"></i>\n");
      out.write("                        <a href=\"\">About us</a>\n");
      out.write("                    </li>\n");
      out.write("                </ul>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"foot-right\">\n");
      out.write("                <h2>CONTACT US</h2>\n");
      out.write("                <div class=\"foot-contact\">\n");
      out.write("                    <a href=\"\"><i class=\"fa-solid fa-location-dot\"></i> HCM - VietNam</a>\n");
      out.write("                    <a href=\"\"><i class=\"fa-solid fa-envelope\"></i> hello123@gmail.com</a>\n");
      out.write("                </div>\n");
      out.write("                <input type=\"text\" placeholder=\"Email Address\" class=\"Email\">\n");
      out.write("                <div class=\"foot-submit\">\n");
      out.write("                    <a href=\"\" class=\"btn\">SUBMIT</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </footer>\n");
      out.write("</body>\n");
      out.write("\n");
      out.write("</html>\n");
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
