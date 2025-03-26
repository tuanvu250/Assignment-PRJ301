<%-- 
    Document   : productForm
    Created on : Mar 18, 2025, 9:10:42 AM
    Author     : ADMIN
--%>

<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="dao.VoucherDAO"%>
<%@page import="dto.VoucherDTO"%>
<%@page import="utils.AuthUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Voucher Form</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/productForm.css">    

    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
                VoucherDAO dao = new VoucherDAO(); VoucherDTO voucher = null;
                //String add_editFailed = request.getAttribute("add_editFailed") + "";
        %>

        <div class="container">
            <div class="form-container">
                <%  String action = null; String voucherId = null;
                    if (request.getAttribute("voucherId") != null) {
                        action = "updateVoucher";
                        voucherId = (String) request.getAttribute("voucherId");
                        voucher = dao.readById(voucherId);
                %>
                <h1>Edit Voucher</h1>
                <%                } else { action = "createVoucher";
                %>
                <h1>Add New Voucher</h1>
                <%}%>

                <form id="productForm" method="post" action="<%= request.getContextPath()%>/VoucherController">
                    <input type="hidden" name="action" value="<%=action%>">
                    <%
                        if (request.getAttribute("voucherId") != null) {
                    %>
                    <input type="hidden" name="voucherId" value="<%=(String) request.getAttribute("voucherId")%>">
                    <%
                        }
                    %>
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">CODE</label>
                                <input type="text" id="name" name="code" oninput="this.value = this.value.toUpperCase()"
                                       value="<%=voucherId == null ? "" : voucher.getCode()%>" required>
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Discount(%)</label>
                                <input type="number" id="name" name="discount" value="<%=voucherId == null ? "" : voucher.getDiscount()*100 %>" required>
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Quantity</label>
                                <input type="number" id="name" name="quantity" value="<%=voucherId == null ? "" : voucher.getQuantity()%>" required>
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Start date</label>
                                <input type="date" id="name" name="startDate" 
                                       value="<%=voucherId == null ? Date.valueOf(LocalDate.now()) : voucher.getStart_date()%>" required>
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">End date</label>
                                <input type="date" id="name" name="endDate" 
                                       value="<%=voucherId == null ? null : voucher.getEnd_date()%>" required>
                            </div>
                        </div>
                    </div>
                            
                    <div class="form-row">
                        <div class="form-col">
                            <div class="form-group">
                                <label for="name">Status</label>
                                <select name="status">
                                    <option value="" hidden selected></option>
                                    <option value="ACTIVE" <%if(voucherId != null&&voucher.getStatus().equals("ACTIVE")) {%> selected<%}%>
                                            >ACTIVE</option>
                                    <option value="EXPIRED" <%if(voucherId != null&&voucher.getStatus().equals("EXPIRED")) {%> selected<%}%>
                                            >EXPIRED</option>
                                </select>
                            </div>
                        </div>
                    </div>
                                    <%
                        if (request.getAttribute("error_editAdd")!=null) {
                            String error_editAdd = (String)request.getAttribute("error_editAdd");
                    %>
                    <p style="color: red"><%=error_editAdd%></p>
                    <%
                        }
                        if (request.getAttribute("add_editFailed")!=null) {

                            String add_editFailed = (String)request.getAttribute("add_editFailed");
                    %>
                    <p style="color: red"><%=add_editFailed%></p>
                    <%
                        }
                    %>
                    <div class="form-actions">
                        <button type="reset" class="btn btn-secondary"><a href="<%= request.getContextPath()%>/VoucherController?action=manageVoucher" style="color: black; text-decoration: none">Cancel</a></button>
                        <%
                            if (request.getAttribute("voucherId") != null) {
                        %>
                        <button type="submit" class="btn btn-primary">Edit Voucher</button>
                        <%
                        } else {
                        %>
                        <button type="submit" class="btn btn-primary">Add New Voucher</button>
                        <%}%>
                    </div>
                </form>
            </div>
            <%
                }
            %>
        </div>
    </body>
</html>
