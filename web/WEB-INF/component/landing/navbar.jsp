<%-- 
    Document   : navbar
    Created on : May 23, 2025, 10:32:48 PM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">
        <a href="${baseUrl}" class="logo d-flex align-items-center me-auto">
            <img src="${baseUrl}/assets/img/logo.png" alt="Evotick Logo">
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="${baseUrl}" class="active">Beranda</a></li>
                <li><a href="${baseUrl}/event">Acara</a></li>

                <li class="dropdown">
                    <a href="#">
                        <span>Kategori</span>
                        <i class="bi bi-chevron-down dropdown-indicator"></i>
                    </a>
                    <ul>
                        <li><a href="${baseUrl}/user/concert">Konser</a></li>
                        <li><a href="${baseUrl}/user/seminar">Seminar</a></li>
                        <li><a href="${baseUrl}/user/sport">Olahraga</a></li>
                    </ul>
                </li>

                <c:if test="${user != null}">
                    <li><a href="${baseUrl}/user/history">Riwayat Pembelian</a></li>
                    <li><a href="${baseUrl}/user/ticket">Tiket Saya</a></li>
                </c:if>

                <c:if test="${user == null}">
                    <li class="dropdown">
                        <a href="#">
                            <span>Akun</span>
                            <i class="bi bi-chevron-down dropdown-indicator"></i>
                        </a>
                        <ul>
                            <li><a href="${baseUrl}/login">Masuk</a></li>
                            <li><a href="${baseUrl}/register">Daftar</a></li>
                        </ul>
                    </li>
                </c:if>
            </ul>

            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>

        <c:if test="${user != null}">
            <a class="cta-btn d-none d-sm-block" href="#" onclick="event.preventDefault();
                    if (confirm('Are you sure you want to log out?')) {
                        document.getElementById('logout-form').submit();
                    }">Keluar</a>
            <form id="logout-form" action="${baseUrl}/logout" method="POST" style="display: none;"></form>
        </c:if>
    </div>
</header>
