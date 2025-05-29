<%-- 
    Document   : login
    Created on : May 23, 2025, 10:52:15 PM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Login | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <section class="auth-section">
            <div class="text-center mb-4">
                <h1>Selamat Datang di ${appName}!</h1>
                <p>Silakan login untuk mengakses layanan kami.</p>
            </div>

            <div class="d-flex justify-content-center">
                <div class="card p-4 shadow auth-card">
                    <h4 class="mb-3 text-center">Login</h4>
                    <form method="POST" action="${baseUrl}/login">
                        <div class="mb-3">
                            <label for="email" class="form-label visually-hidden">Email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="Your Email" required />
                            <c:if test="true">
                                <div class="invalid-feedback">
                                    <c:forEach var="error" items="${errors}">
                                        ${error}
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label visually-hidden">Password</label>
                            <input type="password" name="password" id="password" class="form-control" placeholder="Your Password" required />
                            <c:if test="${errors.password != null}">
                                <div class="invalid-feedback">
                                    ${errors.password}
                                </div>
                            </c:if>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Masuk</button>
                    </form>
                    <div class="text-center mt-3">
                        Belum punya akun? <a href="${baseUrl}/register">Daftar</a>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../component/landing/footer.jsp" />
        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
