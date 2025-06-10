<%-- 
    Document   : sidebar
    Created on : Jun 10, 2025, 12:13:04 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-md-3 col-lg-2 d-md-block sidebar collapse">
    <div class="position-sticky pt-3">
        <div class="text-center mb-4">
            <h4 class="logo">EVOTICK</h4>
        </div>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="${baseUrl}/admin-event">
                    <i class="fas fa-calendar-alt"></i> Acara
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${baseUrl}/admin-package">
                    <i class="fas fa-box-open"></i> Package Event
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${baseUrl}/admin-ticket">
                    <i class="fas fa-ticket-alt"></i> Tiket
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${baseUrl}/admin-user">
                    <i class="fas fa-users"></i> Pengguna
                </a>
            </li>
            <li class="nav-item mt-4">
                <a class="nav-link text-danger" href="#" onclick="event.preventDefault();
                    if (confirm('Are you sure you want to log out?')) {
                        document.getElementById('logout-form').submit();
                    }"><i class="fas fa-sign-out-alt"></i> Keluar</a>
                <form id="logout-form" action="${baseUrl}/logout" method="POST" style="display: none;"></form>
            </li>
        </ul>
    </div>
</div>
