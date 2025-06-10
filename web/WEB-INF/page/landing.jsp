<%-- 
    Document   : landing
    Created on : May 21, 2025, 10:48:11 PM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />


        <style>
            .lihat-lainnya-btn {
                position: absolute;
                right: 30px;
                bottom: 20px;
                z-index: 10;
            }
        </style>
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <main class="main">
            <section id="hero" class="hero section dark-background">
                <img src="${baseUrl}/assets/img/hero-bg.jpg" alt="Hero Image" data-aos="fade-in" />

                <div class="container d-flex flex-column align-items-center text-center mt-auto">
                    <h2 data-aos="fade-up" data-aos-delay="100" class="">SELAMAT DATANG<br><span>DI WEBSITE</span> ${appName.toUpperCase()}</h2>
                    <p data-aos="fade-up" data-aos-delay="200">Solusi Digital Terbaik untuk Pengelolaan Acara & Penjualan Tiket</p>
                    <div data-aos="fade-up" data-aos-delay="300" class="">
                        <a href="https://www.youtube.com/watch?v=Y7f98aduVJ8" class="glightbox pulsating-play-btn mt-3"></a>
                    </div>
                </div>

                <div class="about-info mt-auto position-relative">
                    <div class="container position-relative" data-aos="fade-up">
                        <div class="row">
                            <div class="col-lg-6">
                                <h2>Tentang Acara</h2>
                                <p>Konser Sheila On 7 jadi momen nostalgia penuh kenangan bagi para penggemar. Lewat lagu-lagu legendaris seperti Dan, Sephia, dan Melompat Lebih Tinggi, suasana konser terasa hangat, akrab, dan penuh semangat dari Sheila Gank yang tak pernah padam.</p>
                            </div>
                            <div class="col-lg-3">
                                <h3>Lokasi</h3>
                                <p>Gor Satria, Purwokerto</p>
                            </div>
                            <div class="col-lg-3">
                                <h3>Waktu</h3>
                                <p>Sabtu, 14 Juni 2025</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="schedule" class="schedule section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Jadwal Acara</h2>
                    <p>Berikut adalah jadwal event yang akan berlangsung setiap bulan</p>
                </div>

                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <div class="accordion" id="eventScheduleAccordion">
                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingJan">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseJan" aria-expanded="true" aria-controls="collapseJan">
                                    Januari 2025
                                </button>
                            </h2>
                            <div id="collapseJan" class="accordion-collapse collapse show" aria-labelledby="headingJan" data-bs-parent="#eventScheduleAccordion">
                                <div class="accordion-body">
                                    <ul>
                                        <li>01 Jan – New Year Celebration Music Festival</li>
                                        <li>15 Jan – Startup Talk: Future of Tech</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingFeb">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFeb" aria-expanded="false" aria-controls="collapseFeb">
                                    Februari 2025
                                </button>
                            </h2>
                            <div id="collapseFeb" class="accordion-collapse collapse" aria-labelledby="headingFeb" data-bs-parent="#eventScheduleAccordion">
                                <div class="accordion-body">
                                    <ul>
                                        <li>10 Feb – Creative Writing Workshop</li>
                                        <li>25 Feb – Charity Run: Help & Hope</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="accordion-item">
                            <h2 class="accordion-header" id="headingMar">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseMar" aria-expanded="false" aria-controls="collapseMar">
                                    Maret 2025
                                </button>
                            </h2>
                            <div id="collapseMar" class="accordion-collapse collapse" aria-labelledby="headingMar" data-bs-parent="#eventScheduleAccordion">
                                <div class="accordion-body">
                                    <ul>
                                        <li>08 Mar – Women's Day Conference</li>
                                        <li>21 Mar – Jazz Night Live Performance</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="sport-event" class="section" style="position: relative;">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Acara Olahraga </h2>
                </div>

                <!-- Event Sport -->
                <c:forEach var="sport" items="${sports}">
                    <div class="row gy-4 align-items-center mb-5" data-aos="fade-up" data-aos-delay="100">
                        <div class="col-lg-6">
                            <img src="${sport.poster_url}" class="img-fluid rounded" alt="${sport.name}">
                        </div>
                        <div class="col-lg-6">
                            <h3>${sport.name}</h3>
                            <p><strong>Tanggal:</strong> ${sport.start_date}</p>
                            <p><strong>Lokasi:</strong> ${sport.location}</p>
                            <a href="${baseUrl}/event/detail?id=${sport.id}" class="btn btn-primary bayar-btn mt-3" data-event="${sport.name}">Bayar Tiket</a>
                        </div>
                    </div>
                </c:forEach>

                <!-- Tombol Lihat Event Lainnya di kanan bawah -->
                <a href="${baseUrl}/user/sport" class="btn btn-secondary lihat-lainnya-btn">
                    Lihat Acara Lainnya
                </a>
            </section>

            <!-- Sport Section -->
            <section id="sport-event" class="section" style="position: relative;">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Acara Konser </h2>
                </div>

                <!-- Event Konser -->
                <c:forEach var="concert" items="${concerts}">
                    <div class="row gy-4 align-items-center mb-5" data-aos="fade-up" data-aos-delay="100">
                        <div class="col-lg-6">
                            <img src="${concert.poster_url}" class="img-fluid rounded" alt="${concert.name}">
                        </div>
                        <div class="col-lg-6">
                            <h3>${concert.name}</h3>
                            <p><strong>Tanggal:</strong> ${concert.start_date}</p>
                            <p><strong>Lokasi:</strong> ${concert.location}</p>
                            <a href="${baseUrl}/event/detail?id=${concert.id}" class="btn btn-primary bayar-btn mt-3" data-event="${concert.name}">Bayar Tiket</a>
                        </div>
                    </div>
                </c:forEach>

                <!-- Tombol Lihat Event Lainnya di kanan bawah -->
                <a href="${baseUrl}/user/concert" class="btn btn-secondary lihat-lainnya-btn">
                    Lihat Acara Lainnya
                </a>
            </section>

            <!-- Sport Section -->
            <section id="sport-event" class="section" style="position: relative;">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Acara Seminar </h2>
                </div>

                <!-- Event Seminar -->
                <!-- Event Konser -->
                <c:forEach var="seminar" items="${seminars}">
                    <div class="row gy-4 align-items-center mb-5" data-aos="fade-up" data-aos-delay="100">
                        <div class="col-lg-6">
                            <img src="${seminar.poster_url}" class="img-fluid rounded" alt="${seminar.name}">
                        </div>
                        <div class="col-lg-6">
                            <h3>${seminar.name}</h3>
                            <p><strong>Tanggal:</strong> ${seminar.start_date}</p>
                            <p><strong>Lokasi:</strong> ${seminar.location}</p>
                            <a href="${baseUrl}/event/detail?id=${seminar.id}" class="btn btn-primary bayar-btn mt-3" data-event="${seminar.name}">Bayar Tiket</a>
                        </div>
                    </div>
                </c:forEach>

                <!-- Tombol Lihat Event Lainnya di kanan bawah -->
                <a href="${baseUrl}/user/seminar" class="btn btn-secondary lihat-lainnya-btn">
                    Lihat Acara Lainnya
                </a>
            </section>


            <section id="sponsors" class="sponsors section light-background">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Sponsors</h2>
                    <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
                </div>

                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <div class="row g-0 clients-wrap">
                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-1.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-2.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-3.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-4.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-5.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-6.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-7.png" class="img-fluid" alt="">
                        </div>

                        <div class="col-xl-3 col-md-4 client-logo">
                            <img src="${baseUrl}/assets/img/clients/client-8.png" class="img-fluid" alt="">
                        </div>
                    </div>
                </div>
            </section>

            <section id="contact" class="contact section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Contact</h2>
                    <p>Silahkan hubungi kami jika ingin mengetahui kami lebih dalam</p>
                </div>

                <div class="container" data-aos="fade-up" data-aos-delay="100">
                    <div class="row gy-4">
                        <div class="col-lg-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="200">
                                <i class="bi bi-geo-alt"></i>
                                <h3>Address</h3>
                                <p>A108 Adam Street, New York, NY 535022</p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-telephone"></i>
                                <h3>Call Us</h3>
                                <p>+1 5589 55488 55</p>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="info-item d-flex flex-column justify-content-center align-items-center" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-envelope"></i>
                                <h3>Email Us</h3>
                                <p>info@example.com</p>
                            </div>
                        </div>
                    </div>

                    <div class="row gy-4 mt-1">
                        <div class="col-lg-6" data-aos="fade-up" data-aos-delay="300">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d48389.78314118045!2d-74.006138!3d40.710059!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a22a3bda30d%3A0xb89d1fe6bc499443!2sDowntown%20Conference%20Center!5e0!3m2!1sen!2sus!4v1676961268712!5m2!1sen!2sus" class="contact-maps" frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" nonce="${cspNonce}"></iframe>
                        </div>

                        <div class="col-lg-6">
                            <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="400">
                                <div class="row gy-4">
                                    <div class="col-md-6">
                                        <input type="text" name="name" class="form-control" placeholder="Your Name" required="">
                                    </div>

                                    <div class="col-md-6 ">
                                        <input type="email" class="form-control" name="email" placeholder="Your Email" required="">
                                    </div>

                                    <div class="col-md-12">
                                        <input type="text" class="form-control" name="subject" placeholder="Subject" required="">
                                    </div>

                                    <div class="col-md-12">
                                        <textarea class="form-control" name="message" rows="6" placeholder="Message" required=""></textarea>
                                    </div>

                                    <div class="col-md-12 text-center">
                                        <div class="loading">Loading</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Your message has been sent. Thank you!</div>

                                        <button type="submit">Send Message</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <jsp:include page="../component/landing/footer.jsp" />
        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
