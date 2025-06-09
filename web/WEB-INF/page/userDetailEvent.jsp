<%-- 
    Document   : userDetailEvent
    Created on : Jun 10, 2025, 4:17:36 AM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Detail Acara | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <div class="container" style="margin-top: 100px; padding-top: 20px;">
            <div id="konserDetail" class="row">
                <div class="col-md-6">
                    <img src="${event.poster_url}" class="img-fluid rounded shadow" alt="${event.name}">
                </div>
                <div class="col-md-6">
                    <h1>${event.name}</h1>
                    <p><i class="bi bi-calendar-event"></i> <strong>Tanggal:</strong> ${event.start_date}</p>
                    <p><i class="bi bi-geo-alt"></i> <strong>Lokasi:</strong> ${event.location}</p>

                    <h4 class="mt-4"><i class="bi bi-ticket-perforated"></i> Pilihan Tiket</h4>
                    <div class="list-group">
                        <c:forEach var="data" items="${packages}">
                            <a href="${baseUrl}/user/payment?id=${event.id}&package=${data.id}" 
                               class="list-group-item list-group-item-action d-flex justify-content-between align-items-center">
                                ${data.name} (${data.quota} Kuota Tersisa)
                                <span class="badge bg-primary rounded-pill">${data.price}</span>
                            </a>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-12 mt-4">
                    <hr>
                    <h3><i class="bi bi-info-circle"></i> Deskripsi Acara</h3>
                    <p>${event.description}</p>

                    <h4><i class="bi bi-exclamation-triangle"></i> Peraturan Penting</h4>
                    <ul>${event.type.rules}</ul>
                </div>
            </div>
        </div>

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
