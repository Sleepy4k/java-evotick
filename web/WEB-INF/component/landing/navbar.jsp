<%-- 
    Document   : navbar
    Created on : May 23, 2025, 10:32:48 PM
    Author     : Pandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="header d-flex align-items-center fixed-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">
        <a href="${baseUrl}" class="logo d-flex align-items-center me-auto">
            <img src="${baseUrl}/assets/img/logo.png" alt="Evotick Logo">
        </a>

        <nav id="navmenu" class="navmenu">
            <ul>
                <li><a href="${baseUrl}" class="active">Home</a></li>
                <li><a href="${baseUrl}/event">Event</a></li>

                <li class="dropdown">
                    <a href="#">
                        <span>Type Event</span>
                        <i class="bi bi-chevron-down dropdown-indicator"></i>
                    </a>
                    <ul>
                        <li><a href="Login.html">Concert</a></li>
                        <li><a href="Login.html">Seminar</a></li>
                        <li><a href="Login.html">Sport</a></li>
                    </ul>
                </li>

                <li class="dropdown">
                    <a href="#">
                        <span>Account</span>
                        <i class="bi bi-chevron-down dropdown-indicator"></i>
                    </a>
                    <ul>
                        <li><a href="${baseUrl}/login">Login</a></li>
                        <li><a href="${baseUrl}/register">Register</a></li>
                    </ul>
                </li>
            </ul>

            <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
        </nav>
    </div>
</header>
