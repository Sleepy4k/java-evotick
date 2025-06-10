<%-- 
    Document   : userHistory
    Created on : Jun 10, 2025, 7:35:50 AM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Riwayat Pembelian | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <section class="payment-section" style="margin-top: 100px;">
            <h2 class="mb-4 text-center">Riwayat Pembelian Tiket</h2>

            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>No</th>
                            <th>Nama Pembeli</th>
                            <th>Nama Acara</th>
                            <th>Tanggal Pembelian</th>
                            <th>Jumlah Tiket</th>
                            <th>Jenis Tiket</th>
                            <th>Tiket ID</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody id="riwayatBody">
                        <c:forEach var="history" items="${histories}" varStatus="loop">
                            <tr>
                                <td>${loop.index + 1}</td>
                                <td>${history.user.full_name}</td>
                                <td>${history.event.name}</td>
                                <td>${history.purchased_at}</td>
                                <td>${history.amount}</td>
                                <td>${history.event.type.title}</td>
                                <td>${history.ticket.unique_code}</td>
                                <td><span class="badge bg-success">Paid</span></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </section>

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
