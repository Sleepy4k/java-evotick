<%-- 
    Document   : register
    Created on : Jun 3, 2025, 9:42:03 PM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Register | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <section class="auth-section">
            <div class="text-center mb-4">
                <h1>Selamat Datang di ${appName}!</h1>
                <p>Silakan register untuk mengakses layanan kami.</p>
            </div>

            <div class="d-flex justify-content-center">
                <div class="card p-4 shadow auth-card">
                    <h4 class="mb-3 text-center">Register</h4>
                    <form method="POST" action="${baseUrl}/register">
                        <div class="mb-3">
                            <label for="username" class="form-label visually-hidden">Username</label>
                            <input type="text" name="username" id="username" class="form-control" placeholder="Your Username*" required />
                            <c:if test="${errors.username != null}">
                                <div class="mt-2">
                                    ${errors.username}
                                </div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="full_name" class="form-label visually-hidden">Nama Lengkap</label>
                            <input type="text" name="full_name" id="full_name" class="form-control" placeholder="Your Full Name*" required />
                            <c:if test="${errors.full_name != null}">
                                <div class="mt-2">
                                    ${errors.full_name}
                                </div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label visually-hidden">Email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Your Email*" required />
                            <c:if test="${errors.email != null}">
                                <div class="mt-2">
                                    ${errors.email}
                                </div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label visually-hidden">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Your Password*" required />
                            <c:if test="${errors.password != null}">
                                <div class="mt-2">
                                    ${errors.password}
                                </div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label visually-hidden">Phone Number</label>
                            <input type="text" name="phone" id="phone" class="form-control" placeholder="Your Phone Number" />
                            <c:if test="${errors.phone != null}">
                                <div class="mt-2">
                                    ${errors.phone}
                                </div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label visually-hidden">Address</label>
                            <input type="text" name="address" id="address" class="form-control" placeholder="Your Address" />
                            <c:if test="${errors.address != null}">
                                <div class="mt-2">
                                    ${errors.address}
                                </div>
                            </c:if>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Daftar</button>
                    </form>
                    <div class="text-center mt-3">
                        Sudah punya akun? <a href="${baseUrl}/login">Login</a>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
