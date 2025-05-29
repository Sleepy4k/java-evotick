<%-- 
    Document   : landing
    Created on : May 21, 2025, 10:48:11 PM
    Author     : Pandu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
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
                                <h2>About The Event</h2>
                                <p>Sed nam ut dolor qui repellendus iusto odit. Possimus inventore eveniet accusamus error amet eius aut
                                    accusantium et. Non odit consequatur repudiandae sequi ea odio molestiae. Enim possimus sunt inventore in
                                    est ut optio sequi unde.</p>
                            </div>
                            <div class="col-lg-3">
                                <h3>Where</h3>
                                <p>Downtown Conference Center, New York</p>
                            </div>
                            <div class="col-lg-3">
                                <h3>When</h3>
                                <p>Monday to Wednesday<br>10-12 December</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="speakers" class="speakers section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Type Event</h2>
                </div>

                <div class="container">
                    <div class="row gy-4">
                        <section id="type-event" class="py-5 bg-light">
                            <div class="container text-center">
                                <div class="row justify-content-center">
                                    <div class="col-md-4 mb-4">
                                        <a href="Login.html">
                                            <div class="card event-card shadow-sm">
                                                <img src="${baseUrl}/assets/img/speakers/KONSER.png" class="card-img-top event-img" alt="Concert">
                                                <div class="card-body">
                                                    <h5 class="card-title">Concert</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col-md-4 mb-4">
                                        <a href="Login.html">
                                            <div class="card event-card shadow-sm">
                                                <img src="${baseUrl}/assets/img/speakers/sport.png" class="card-img-top event-img" alt="Sport">
                                                <div class="card-body">
                                                    <h5 class="card-title">Sport</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>

                                    <div class="col-md-4 mb-4">
                                        <a href="Login.html">
                                            <div class="card event-card shadow-sm">
                                                <img src="${baseUrl}/assets/img/speakers/SEMINAR.png" class="card-img-top event-img" alt="Seminar">
                                                <div class="card-body">
                                                    <h5 class="card-title">Seminar</h5>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </section>

            <section id="schedule" class="schedule section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Schedule Event</h2>
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

            <section id="sport-event" class="section">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Event Sport</h2>
                </div>

                <div class="container">
                    <div class="row gy-4 align-items-center" data-aos="fade-up" data-aos-delay="100">
                        <div class="col-lg-6">
                            <img src="https://assets.loket.com/neo/production/images/banner/m8IW7_1746684706944067.jpeg" class="img-fluid rounded" alt="MotoGP Mandalika">
                        </div>

                        <div class="col-lg-6">
                            <h3>Pertamina Grand Prix of Indonesia 2025</h3>
                            <p><strong>Tanggal:</strong> 03 – 05 Oktober 2025</p>
                            <p><strong>Waktu:</strong> 10:00 – 22:00 WIB</p>
                            <p><strong>Lokasi:</strong> Sirkuit Internasional Pertamina Mandalika</p>
                            <a href="Login.html" class="btn btn-primary bayar-btn mt-3" data-event="Pertamina Grand Prix of Indonesia 2025">Bayar Tiket</a>
                        </div>
                    </div>
                </div>
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
                    <p>Necessitatibus eius consequatur ex aliquid fuga eum quidem sint consectetur velit</p>
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
