<%-- 
    Document   : userEvent
    Created on : Jun 10, 2025, 1:52:49 AM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Acara | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <main class="container mt-5 pt-5">
            <section class="text-center my-5">
                <h1>📅 Event Spesial</h1>
                <p class="lead">Jelajahi berbagai event menarik mulai dari konser, seminar, festival, hingga workshop! Temukan pengalaman seru yang tak terlupakan di sini! 🎉✨</p>

                <c:if test="${events.size() == 0}">
                    <div class="col-12 d-flex justify-content-center">
                        <div class="alert alert-info text-center" role="alert">
                            Tidak ada acara yang tersedia saat ini. Silakan cek kembali nanti!
                        </div>
                    </div>
                </c:if>

                <section class="row row-cols-1 row-cols-md-3 g-4">
                    <c:forEach var="event" items="${events}">
                        <div class="col">
                            <div class="card h-100 shadow">
                                <img src="${event.poster_url}" class="card-img-top" alt="Konser 1">
                                <div class="card-body">
                                    <h5 class="card-title">${event.name}</h5>
                                    <p class="card-text">Tanggal: ${event.start_date}</p>
                                    <p class="card-text">Lokasi: ${event.location}</p>
                                    <p class="card-text">Harga: Rp${event.packages[0].price}</p>
                                    <c:set var="btnClass" value="
                                        ${event.type.title == 'konser' ? 'btn-primary' : 
                                          event.type.title == 'olahraga' ? 'btn-warning' : 
                                          event.type.title == 'seminar' ? 'btn-success' : 'btn-secondary'}
                                    " />
                                    <a href="${baseUrl}/event/detail?id=${event.id}" class="btn ${btnClass} w-100">Lihat Detail</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </section>
            </section>
        </main>

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
