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

        <div class="container mt-5 pt-5">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="card shadow-sm">
                        <div class="card-body p-5">
                            <h2 class="text-center mb-4"><i class="bi bi-credit-card"></i> Pembayaran Tiket</h2>

                            <form class="row g-4" action="${baseUrl}/user/payment" method="post">
                                <div class="col-12">
                                    <div class="alert alert-info">
                                        <h5 id="eventNameDisplay">${event.name}</h5>
                                        <p class="mb-1"><strong>Jenis Tiket:</strong> <span id="ticketTypeDisplay">${data.name}</span></p>
                                        <p class="mb-0"><strong>Harga Per Tiket:</strong> <span id="ticketPriceDisplay">Rp ${data.price}</span></p>
                                    </div>
                                    <input type="hidden" id="eventId" name="eventId" value="${event.id}">
                                    <input type="hidden" id="packageId" name="packageId" value="${data.id}">
                                </div>

                                <div class="col-md-6">
                                    <label for="ticketCount" class="form-label">Jumlah Tiket</label>
                                    <input type="number" class="form-control" id="ticketCount" name="ticketCount" min="1" value="1" required onchange="updateTotal()">
                                </div>

                                <div class="col-md-6">
                                    <label for="purchaseDate" class="form-label">Tanggal Pembelian</label>
                                    <input type="text" class="form-control" id="purchaseDate" name="purchaseDate" readonly>
                                </div>

                                <div class="col-md-6">
                                    <label for="rekening" class="form-label">Nomor Rekening</label>
                                    <input type="text" class="form-control" id="rekening" name="rekening" pattern="\d{10,20}" placeholder="Contoh: 1234567890" required>
                                </div>

                                <div class="col-md-6">
                                    <label for="cvv" class="form-label">CVV</label>
                                    <input type="text" class="form-control" id="cvv" name="cvv" maxlength="4" pattern="\d{3,4}" placeholder="3 atau 4 digit" required>
                                </div>

                                <div class="col-12">
                                    <div class="border-top pt-3 mt-3">
                                        <h5><i class="bi bi-receipt"></i> Ringkasan Pesanan</h5>
                                        <div class="d-flex justify-content-between">
                                            <span>Tiket Event:</span>
                                            <span id="summaryEvent">${event.name}</span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span>Jenis Tiket:</span>
                                            <span id="summaryTicketType">${data.name}</span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span>Harga Tiket:</span>
                                            <span id="summaryPrice">Rp ${data.price}</span>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <span>Jumlah Tiket:</span>
                                            <span id="summaryQuantity">1</span>
                                        </div>
                                        <div class="d-flex justify-content-between fw-bold mt-2">
                                            <span>Total Pembayaran:</span>
                                            <span id="totalPayment">Rp 0</span>
                                        </div>
                                    </div>
                                </div>

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

        <jsp:include page="../component/landing/scroller.jsp" />
        <jsp:include page="../component/landing/preloader.jsp" />

        <jsp:include page="../component/script/landing.jsp" />

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const now = new Date();
                const dateString = now.toISOString().split("T")[0];

                document.getElementById('purchaseDate').value = dateString;

                updateTotal();
            });

            function formatRupiah(angka) {
                return 'Rp ' + angka.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
            }

            function updateTotal() {
                const quantity = parseInt(document.getElementById('ticketCount').value) || 0;
                const total = quantity * ${data.price};
                document.getElementById('summaryQuantity').textContent = quantity;
                document.getElementById('totalPayment').textContent = formatRupiah(total);
            }
        </script>
    </body>
</html>
