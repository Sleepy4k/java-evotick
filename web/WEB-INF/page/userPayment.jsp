<%-- 
    Document   : payment
    Created on : Jun 9, 2025, 6:19:42 PM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Pembayaran | ${appName}</title>
        <jsp:include page="../component/header/landing.jsp" />
    </head>
    <body class="index-page">
        <jsp:include page="../component/landing/navbar.jsp" />

        <section class="payment-section" style="margin-top: 100px;">
            <div class="container">
                <div class="section-title text-center">
                    <h2>Pembayaran Tiket</h2>
                    <p>Isi detail pembayaran untuk menyelesaikan pembelian tiket event Anda.</p>
                </div>

                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <div class="card shadow-sm">
                            <div class="card-body p-5">
                                <form class="row g-4" action="#" method="post">
                                    <!-- Event Selection -->
                                    <div class="col-md-6">
                                        <label for="eventSelect" class="form-label">Pilih Event</label>
                                        <select id="eventSelect" class="form-select" required>
                                            <option value="" selected disabled>Pilih salah satu</option>
                                            <option value="1">New Year Celebration Music Festival</option>
                                            <option value="2">Startup Talk: Future of Tech</option>
                                            <option value="3">Women's Day Conference</option>
                                        </select>
                                    </div>

                                    <!-- Ticket Quantity -->
                                    <div class="col-md-6">
                                        <label for="ticketCount" class="form-label">Jumlah Tiket</label>
                                        <input type="number" class="form-control" id="ticketCount" name="ticketCount" min="1" required>
                                    </div>

                                    <!-- Personal Info -->
                                    <div class="col-md-6">
                                        <label for="name" class="form-label">Nama Lengkap</label>
                                        <input type="text" class="form-control" id="name" name="name" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email</label>
                                        <input type="email" class="form-control" id="email" name="email" required>
                                    </div>

                                    <!-- Payment Methods -->
                                    <div class="col-12">
                                        <h5 class="mb-3">Metode Pembayaran</h5>
                                        <div class="payment-methods">
                                            <div class="payment-method active">
                                                <input type="radio" name="paymentMethod" id="creditCard" checked hidden>
                                                <label for="creditCard" class="d-flex align-items-center">
                                                    <i class="far fa-credit-card"></i>
                                                    <span>Kartu Kredit/Debit</span>
                                                </label>
                                            </div>
                                            <div class="payment-method">
                                                <input type="radio" name="paymentMethod" id="bankTransfer" hidden>
                                                <label for="bankTransfer" class="d-flex align-items-center">
                                                    <i class="fas fa-university"></i>
                                                    <span>Transfer Bank</span>
                                                </label>
                                            </div>
                                            <div class="payment-method">
                                                <input type="radio" name="paymentMethod" id="ewallet" hidden>
                                                <label for="ewallet" class="d-flex align-items-center">
                                                    <i class="fas fa-wallet"></i>
                                                    <span>E-Wallet</span>
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Credit Card Details -->
                                    <div class="col-12">
                                        <label for="cardNumber" class="form-label">Nomor Kartu Kredit</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="1234 5678 9012 3456" required>
                                            <span class="input-group-text"><i class="fab fa-cc-visa"></i> <i class="fab fa-cc-mastercard"></i></span>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="expiryDate" class="form-label">Tanggal Kedaluwarsa</label>
                                        <input type="text" class="form-control" id="expiryDate" name="expiryDate" placeholder="MM/YY" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="cvv" class="form-label">CVV</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control" id="cvv" name="cvv" placeholder="123" required>
                                            <span class="input-group-text"><i class="fas fa-question-circle" data-bs-toggle="tooltip" title="3 digit di belakang kartu"></i></span>
                                        </div>
                                    </div>

                                    <!-- Order Summary -->
                                    <div class="col-12">
                                        <div class="border-top pt-3 mt-3">
                                            <h5>Ringkasan Pesanan</h5>
                                            <div class="d-flex justify-content-between">
                                                <span>Tiket Event:</span>
                                                <span id="eventPrice">Rp 250.000</span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span>Jumlah Tiket:</span>
                                                <span id="ticketQuantity">1</span>
                                            </div>
                                            <div class="d-flex justify-content-between fw-bold mt-2">
                                                <span>Total Pembayaran:</span>
                                                <span id="totalPayment">Rp 250.000</span>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Submit Button -->
                                    <div class="col-12 text-center mt-4">
                                        <button type="submit" class="btn btn-success px-5 py-3">
                                            <i class="fas fa-lock me-2"></i> Bayar Sekarang
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />
    </body>
</html>
