<%-- 
    Document   : footer
    Created on : May 23, 2025, 10:32:54 PM
    Author     : Pandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<footer id="footer" class="footer dark-background">
    <div class="footer-top">
        <div class="container">
            <div class="row gy-4 mb-3">
                <div class="col-lg-4 col-md-6 footer-about">
                    <a href="${baseUrl}" class="logo d-flex align-items-center">
                        <span class="sitename">${appName}</span>
                    </a>
                    <div class="footer-contact pt-3">
                        <p>Jl. DI Panjaitan No.128</p>
                        <p>Purwokerto, Jawa Tengah 53147</p>
                        <p class="mt-3"><strong>Phone:</strong> <span>+62 281 641629</span></p>
                        <p><strong>Email:</strong> <span>info@evotick.com</span></p>
                    </div>
                </div>

                <div class="col-lg-2 col-md-3 footer-links"></div>

                <div class="col-lg-2 col-md-3 footer-links"></div>

                <div class="col-lg-2 col-md-3 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><a href="${baseUrl}">Home</a></li>
                        <li><a href="${baseUrl}/event">Event</a></li>
                        <li><a href="${baseUrl}/login">Login</a></li>
                        <li><a href="${baseUrl}/register">Register</a></li>
                    </ul>
                </div>

                <div class="col-lg-2 col-md-3 footer-links">
                    <h4>Our Event</h4>
                    <ul>
                        <li><a href="${baseUrl}/sport">Sport</a></li>
                        <li><a href="${baseUrl}/concert">Concert</a></li>
                        <li><a href="${baseUrl}/seminar">Seminar</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="copyright text-center">
        <div class="container d-flex flex-column flex-lg-row justify-content-center justify-content-lg-between align-items-center">
            <div class="d-flex flex-column align-items-center align-items-lg-start">
                <div>
                    © Copyright <strong><span>${appName}</span></strong>. All Rights Reserved
                </div>
            </div>

            <div class="social-links order-first order-lg-last mb-3 mb-lg-0">
                <a href=""><i class="bi bi-twitter-x"></i></a>
                <a href=""><i class="bi bi-facebook"></i></a>
                <a href=""><i class="bi bi-instagram"></i></a>
                <a href=""><i class="bi bi-linkedin"></i></a>
            </div>
        </div>
    </div>
</footer>
