<%-- 
    Document   : userTiket
    Created on : Jun 10, 2025, 8:13:36 AM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Tiket Saya | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />

        <style>
            .ticket-card {
                border: 2px dashed #007bff;
                border-radius: 15px;
                padding: 20px;
                margin-bottom: 20px;
                background-color: #f9f9f9;
                position: relative;
                transition: 0.3s;
            }

            .ticket-card.vip {
                border: 2px solid gold;
                background: linear-gradient(135deg, #fff8dc, #fff);
            }

            .ticket-card.vvip {
                border: 3px solid purple;
                background: linear-gradient(135deg, #e0c3fc, #8ec5fc);
                color: #fff;
            }

            .ticket-card.vvip .kode-tiket {
                color: #ffe600;
            }

            .ticket-card::before,
            .ticket-card::after {
                content: '';
                position: absolute;
                width: 20px;
                height: 20px;
                background-color: #fff;
                border-radius: 50%;
                top: 50%;
                transform: translateY(-50%);
                z-index: 1;
            }

            .ticket-card::before {
                left: -10px;
            }

            .ticket-card::after {
                right: -10px;
            }

            .kode-tiket {
                font-size: 1.2rem;
                font-weight: bold;
                color: #007bff;
            }

            .ticket-header {
                border-bottom: 1px dashed #ccc;
                margin-bottom: 10px;
                padding-bottom: 10px;
            }

            .badge-jenis {
                font-size: 0.85rem;
                padding: 4px 8px;
                border-radius: 5px;
            }

            .badge-reguler {
                background-color: #007bff;
                color: white;
            }

            .badge-vip {
                background-color: gold;
                color: black;
            }

            .badge-vvip {
                background-color: purple;
                color: white;
            }
        </style>
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <section class="payment-section" style="margin-top: 100px;">
            <h2 class="mb-4 text-center">Tiket Saya</h2>
            <div id="ticketContainer" class="row justify-content-center">
                <c:forEach var="ticket" items="${tickets}">
                    <div class="col-md-8">
                        <div class="ticket-card reguler">
                            <div class="ticket-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">${ticket.transaction.event.name}</h5>
                                <span class="badge badge-reguler">${ticket.transaction.eventPackage.name}</span>
                            </div>
                            <p><strong>Nama:</strong> ${ticket.transaction.user.full_nama}</p>
                            <p><strong>Tanggal:</strong> ${ticket.transaction.event.start_date}</p>
                            <p><strong>Lokasi:</strong> ${ticket.transaction.event.location}</p>
                            <p><strong>Jumlah Tiket:</strong> ${ticket.transaction.amount}</p>
                            <p class="kode-tiket">Kode Tiket: ${ticket.unique_code}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
