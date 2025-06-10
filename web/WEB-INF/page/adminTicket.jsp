<%-- 
    Document   : adminTicket
    Created on : Jun 10, 2025, 11:09:21 PM
    Author     : Pandu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Ticket | ${appName}</title>
        <jsp:include page="../component/header/dashboard.jsp" />

        <style>
            :root {
                --primary-color: #ef9245;
                --secondary-color: #6c757d;
                --dark-color: #343a40;
                --light-color: #f8f9fa;
                --success-color: #28a745;
                --danger-color: #dc3545;
                --warning-color: #fd7e14;
                --info-color: #17a2b8;
            }

            body {
                background-color: var(--light-color);
                font-family: 'Roboto', sans-serif;
            }

            .sidebar {
                min-height: 100vh;
                background: linear-gradient(135deg, #2c3e50, #4a6491);
            }

            .sidebar .nav-link {
                color: rgba(255, 255, 255, 0.85);
                font-family: 'Raleway', sans-serif;
                font-weight: 500;
                padding: 0.75rem 1.5rem;
                margin: 0.25rem 0;
                border-radius: 0.25rem;
                transition: all 0.3s ease;
            }

            .sidebar .nav-link.active {
                color: #fff;
                background-color: var(--primary-color);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .sidebar .nav-link:hover {
                color: #fff;
                background-color: rgba(255, 255, 255, 0.1);
            }

            .sidebar .nav-link i {
                margin-right: 10px;
                width: 20px;
                text-align: center;
            }

            .main-content {
                padding: 20px;
                background-color: #fff;
            }

            .table-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
                padding: 20px;
                margin-top: 20px;
            }

            h1, h2, h3, h4, h5, h6 {
                font-family: 'Raleway', sans-serif;
                font-weight: 600;
                color: #2c3e50;
            }

            .header {
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 15px 0;
                margin-bottom: 20px;
            }

            .logo {
                font-family: 'Raleway', sans-serif;
                font-weight: 700;
                font-size: 1.5rem;
                color: var(--primary-color);
            }

            .table thead th {
                background-color: #f8f9fa;
                color: #495057;
                font-family: 'Raleway', sans-serif;
                font-weight: 600;
                border-bottom: 2px solid #e9ecef;
            }

            .table tbody tr:hover {
                background-color: rgba(232, 62, 140, 0.05);
            }
            .badge.bg-primary {
                background-color: var(--primary-color) !important;
            }
            .badge.bg-success {
                background-color: var(--success-color) !important;
            }
            .badge.bg-warning {
                background-color: var(--warning-color) !important;
            }


            ::-webkit-scrollbar {
                width: 8px;
            }
            ::-webkit-scrollbar-track {
                background: #f1f1f1;
            }
            ::-webkit-scrollbar-thumb {
                background: var(--primary-color);
                border-radius: 4px;
            }
            ::-webkit-scrollbar-thumb:hover {
                background: #d62a76;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <jsp:include page="../component/dashboard/sidebar.jsp" />

                <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 main-content">
                    <div class="header">
                        <div
                            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center"
                            >
                            <h1 class="h2">Tiket yang Terjual</h1>
                        </div>
                    </div>

                    <div class="table-container">
                        <table
                            id="eventsTable"
                            class="table table-hover"
                            style="width: 100%"
                            >
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nama Acara</th>
                                    <th>Nama Pembeli</th>
                                    <th>Tanggal Pembelian</th>
                                    <th>Jenis Tiket</th>
                                    <th>Harga (IDR)</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="ticket" items="${tickets}" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${ticket.transaction.event.name}</td>
                                        <td>${ticket.transaction.user.full_name}</td>
                                        <td>${ticket.transaction.purchased_at}</td>
                                        <td>${ticket.transaction.eventPackage.name}</td>
                                        <td>${ticket.transaction.eventPackage.price * ticket.transaction.amount}</td>
                                        <td><span class="badge bg-success">Paid</span></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>

        <div class="modal fade" id="addPackageModal" tabindex="-1" aria-labelledby="addPackageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addPackageModalLabel">Tambah Paket</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="addPackageForm">
                            <div class="mb-3">
                                <label for="eventSelector" class="form-label">Pilih Event Induk</label>
                                <select class="form-select" id="eventSelector" required>
                                    <option value="" selected disabled>-- Pilih salah satu event --</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="packageName" class="form-label">Nama Package</label>
                                <input type="text" class="form-control" id="packageName" required>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="packagePrice" class="form-label">Price (IDR)</label>
                                    <input type="number" class="form-control" id="packagePrice" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="packageQuota" class="form-label">Quota</label>
                                    <input type="number" class="form-control" id="packageQuota" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="packageDetail" class="form-label">Detail Text</label>
                                <textarea class="form-control" id="packageDetail" rows="4" required></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batalkan</button>
                        <button type="button" class="btn btn-primary" id="savePackage">Simpan Paket</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="editPackageModal" tabindex="-1" aria-labelledby="editPackageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editPackageModalLabel">Edit Package</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="editPackageForm">
                            <input type="hidden" id="editPackageId">
                            <div class="mb-3">
                                <label for="editEventSelector" class="form-label">Event Induk</label>
                                <select class="form-select" id="editEventSelector" required>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="editPackageName" class="form-label">Nama Package</label>
                                <input type="text" class="form-control" id="editPackageName" required>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="editPackagePrice" class="form-label">Price (IDR)</label>
                                    <input type="number" class="form-control" id="editPackagePrice" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="editPackageQuota" class="form-label">Quota</label>
                                    <input type="number" class="form-control" id="editPackageQuota" required>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="editPackageDetail" class="form-label">Detail Paket</label>
                                <textarea class="form-control" id="editPackageDetail" rows="4" required></textarea>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batalkan</button>
                        <button type="button" class="btn btn-primary" id="updatePackage">Perbarui Package</button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../component/script/dashboard.jsp" />

        <script>
            $(document).ready(function () {
                // Inisialisasi DataTable dengan kolom baru
                var packagesTable = $('#packagesTable').DataTable({
                    responsive: true,
                    language: {search: "_INPUT_", searchPlaceholder: "Cari paket..."},
                    dom: '<"top"f>rt<"bottom"lip><"clear">',
                });

                $('#savePackage').click(function () {
                    if ($('#addPackageForm')[0].checkValidity()) {
                        const newId = dummyPackageData.length > 0 ? Math.max(...dummyPackageData.map(p => p.id)) + 1 : 101;
                        const newPackage = {
                            id: newId,
                            eventId: parseInt($('#eventSelector').val()), // Mengambil eventId dari dropdown
                            name: $('#packageName').val(),
                            price: parseInt($('#packagePrice').val()),
                            quota: parseInt($('#packageQuota').val()),
                            detail: $('#packageDetail').val()
                        };

                        dummyPackageData.push(newPackage);
                        reloadTable();

                        alert('Package baru berhasil disimpan!');
                        $('#addPackageModal').modal('hide');
                        $('#addPackageForm')[0].reset();
                        $('#eventSelector').val(""); // Reset dropdown ke pilihan default
                    } else {
                        $('#addPackageForm')[0].reportValidity();
                    }
                });

                // --- READ & UPDATE (Edit Package) ---
                $('#packagesTable tbody').on('click', '.btn-edit', function () {
                    var rowData = packagesTable.row($(this).parents('tr')).data();
                    $('#editPackageId').val(rowData.id);
                    $('#editEventSelector').val(rowData.eventId); // Set dropdown ke event yang sesuai
                    $('#editPackageName').val(rowData.name);
                    $('#editPackagePrice').val(rowData.price);
                    $('#editPackageQuota').val(rowData.quota);
                    $('#editPackageDetail').val(rowData.detail);
                });

                $('#updatePackage').click(function () {
                    if ($('#editPackageForm')[0].checkValidity()) {
                        const packageId = parseInt($('#editPackageId').val());
                        const packageIndex = dummyPackageData.findIndex(p => p.id === packageId);

                        if (packageIndex !== -1) {
                            dummyPackageData[packageIndex] = {
                                id: packageId,
                                eventId: parseInt($('#editEventSelector').val()), // Ambil eventId dari dropdown edit
                                name: $('#editPackageName').val(),
                                price: parseInt($('#editPackagePrice').val()),
                                quota: parseInt($('#editPackageQuota').val()),
                                detail: $('#editPackageDetail').val()
                            };

                            reloadTable();
                            alert('Package ID ' + packageId + ' berhasil diperbarui!');
                            $('#editPackageModal').modal('hide');
                        }
                    } else {
                        $('#editPackageForm')[0].reportValidity();
                    }
                });

                // --- DELETE (Hapus Package) ---
                $('#packagesTable tbody').on('click', '.btn-delete', function () {
                    var rowData = packagesTable.row($(this).parents('tr')).data();
                    if (confirm('Apakah Anda yakin ingin menghapus package: "' + rowData.name + '"?')) {
                        dummyPackageData = dummyPackageData.filter(p => p.id !== rowData.id);
                        reloadTable();
                        alert('Package berhasil dihapus!');
                    }
                });
            });
        </script>
    </body>
</html>