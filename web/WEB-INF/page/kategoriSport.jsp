<%-- 
    Document   : kategoriSport
    Created on : Jun 10, 2025, 7:15:00 AM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Olahraga | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <main class="container mt-5 pt-5">
            <section class="text-center my-5">
                <h1>🏆 Event Olahraga</h1>
                <p class="lead">Tonton langsung pertandingan seru dari tim favoritmu!</p>
            </section>

            <section class="row row-cols-1 row-cols-md-3 g-4">
                <c:forEach var="data" items="${sports}">
                    <div class="col">
                        <div class="card h-100 shadow">
                            <img src="${data.poster_url}" class="card-img-top" alt="${data.name}">
                            <div class="card-body">
                                <h5 class="card-title">${data.name}</h5>
                                <p class="card-text">Tanggal: ${data.start_date}</p>
                                <p class="card-text">Lokasi: ${data.location}</p>
                                <p class="card-text">Harga: Rp${data.packages[0].price}</p>
                                <a href="${baseUrl}/event/detail?id=${event.id}" class="btn btn-success w-100">Lihat Detail</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </section>
        </main>

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
