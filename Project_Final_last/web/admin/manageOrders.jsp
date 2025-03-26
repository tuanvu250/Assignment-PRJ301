<%-- 
    Document   : manageOrders
    Created on : Mar 26, 2025, 9:00:12 AM
    Author     : ADMIN
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dto.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Orders</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/assets/css/manageOrders.css">
    </head>
    <body>
        <%
            if (AuthUtils.checkIsAdmin(session)) {
        %>
        <div class="page-container">
            <%@include file="../includes/sidebar.jsp" %>
            <div class="container">
                <div class="header">
                    <h1>Manage Orders</h1>
                    <%
                        String searchTerm = request.getAttribute("searchTerm") + "";
                        searchTerm = searchTerm.equals("null") ? "" : searchTerm;
                    %>
                    <form class="search-bar" action="<%=request.getContextPath()%>/OrderController">
                        <input type="hidden" name="action" value="searchOrders"/>
                        <input type="text" placeholder="Search by order ID or username" name="searchTerm"
                               value="<%=searchTerm%>">
                        <button class="search-button" type="submit">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                </div>
                <%

                    if (request.getAttribute("listOrder") != null) {
                        List<OrderDTO> listOrder = (List<OrderDTO>) request.getAttribute("listOrder");
                        if (request.getAttribute("checkUpdate") != null) {
                            boolean check = (boolean) request.getAttribute("checkUpdate");
                            if (check) { %>
                <div style="color: green">Update order successful</div> <%} else {%>    
                <div style="color: red">Update order fail </div>
                <%}
                    }
                    if (request.getAttribute("successStatus") != null) {
                        String successStatus = (String) request.getAttribute("successStatus");
                %> <p style="color: green;"><%=successStatus%></p> <%}%>
                <p></p>
                <div class="table-container" style="margin-top: 10px;">
                    <table>
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Username</th>
                                <th>Full Name</th>
                                <th>Phone</th>
                                <th>Email</th>
                                <th>Date</th>
                                <th>Address</th>
                                <th>Status</th>
                                <th>Payment Method</th>
                                <th>Total Price</th>
                                <th>
                                    Detail
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (OrderDTO order : listOrder) {
                                    NumberFormat currencyVN = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
                            %>
                            <tr>
                                <td><%=order.getOrder_id()%></td>
                                <td><%=order.getUsername()%></td>
                                <td><%=order.getFullName()%></td>
                                <td><%=order.getPhone()%></td>
                                <td><%=order.getEmail()%></td>
                                <td><%=order.getDate_ordered()%></td>
                                <td class="truncate"><%=order.getAddress()%></td>
                                <td>
                                    <form action="<%=request.getContextPath()%>/OrderController">
                                        <input type="hidden" name="orderId" value="<%=order.getOrder_id()%>"/>
                                        <input type="hidden" name="action" value="updateStatus" />
                                        <select name="newStatus" onchange="this.form.submit()">

                                            <option <%if (order.getStatus().equals("Pending")) {%> selected hidden <%}%>
                                                                                                   value="Pending" >Pending</option>
                                            <option <%if (order.getStatus().equals("Processing")) {%> selected hidden<%}%> 
                                                                                                      value="Processing" >Processing</option>
                                            <option <%if (order.getStatus().equals("Shipped")) {%> selected hidden<%}%>
                                                                                                   value="Shipped" >Shipped</option>
                                            <option <%if (order.getStatus().equals("Delivered")) {%> selected hidden<%}%>
                                                                                                     value="Delivered" >Delivered</option>
                                            <option <%if (order.getStatus().equals("Cancelled")) {%> selected hidden<%}%>
                                                                                                     value="Cancelled" >Canceled</option>
                                        </select>
                                    </form>
                                </td>
                                <td><%=order.getMethod_pay()%></td>
                                <td><%=currencyVN.format(order.getTotal_price())%></td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="<%= request.getContextPath()%>/OrderController?action=adminOrderDetail&orderId=<%=order.getOrder_id()%>" 
                                           class="detail-button">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="<%= request.getContextPath()%>/OrderController?action=editOrderDetail&orderId=<%=order.getOrder_id()%>" 
                                           class="edit-button">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr> <%}%>
                        </tbody>
                    </table>
                    <%
                        int currentPage = (int) request.getAttribute("currentPage");
                        int totalPages = (int) request.getAttribute("totalPages");
                    %>

                    <% if (totalPages > 1) { %>
                    <div style="display: flex; justify-content: center; align-items: center; gap: 100px;">
                        <% if (currentPage > 1) {%>
                        <a style="text-align: center; font-size: 18px; background-color: #C63F3E; width: 50px; border-radius: 10px;"
                           href="<%= request.getContextPath()%>/OrderController?action=searchOrders&searchTerm=<%=searchTerm%>&page=<%= currentPage - 1%>">Previous</a>
                        <% }%>

                        <span> Page <%= currentPage%> of <%= totalPages%> </span>

                        <% if (currentPage < totalPages) {%>
                        <a style="text-align: center; font-size: 18px;background-color: #C63F3E; width: 50px; border-radius: 10px;"
                           href="<%= request.getContextPath()%>/OrderController?action=searchOrders&searchTerm=<%=searchTerm%>&page=<%= currentPage + 1%>">Next</a>
                        <% } %>
                    </div>
                    <%} %>  
                </div> <%}%>
            </div>
        </div> <%}%>
    </body>
</html>
