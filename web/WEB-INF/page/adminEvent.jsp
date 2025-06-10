<%-- 
    Document   : adminEvent
    Created on : Jun 10, 2025, 12:12:19 PM
    Author     : LENOVO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="../component/meta.jsp" />
        <title>Event | ${appName}</title>
        <jsp:include page="../component/header/dashboard.jsp" />

        <style>
            :root {
                --primary-color: #ef9245; /* Warna pink khas EVOTICK */
                --secondary-color: #6c757d;
                --dark-color: #343a40;
                --light-color: #f8f9fa;
                --success-color: #28a745;
                --danger-color: #ef9245;
                --warning-color: #fd7e14;
                --info-color: #17a2b8;
            }

            body {
                background-color: var(--light-color);
                font-family: "Roboto", sans-serif;
            }

            .sidebar {
                min-height: 100vh;
                background: linear-gradient(
                    135deg,
                    #2c3e50,
                    #4a6491
                    ); /* Gradient gelap untuk sidebar */
            }

            .sidebar .nav-link {
                color: rgba(255, 255, 255, 0.85);
                font-family: "Raleway", sans-serif;
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
                background-color: #fff; /* Konten utama dengan background putih */
            }

            .table-container {
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
                padding: 20px;
                margin-top: 20px;
            }

            .action-btns .btn {
                padding: 0.25rem 0.5rem;
                font-size: 0.875rem;
                transition: all 0.3s ease;
            }

            .btn-primary {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
            }

            .btn-primary:hover {
                background-color: #ed712e; /* Warna pink sedikit lebih gelap saat hover */
                border-color: #d67d2a;
            }

            .badge.bg-success {
                background-color: var(--success-color) !important;
            }
            .badge.bg-danger {
                background-color: var(--danger-color) !important;
            }
            .badge.bg-warning {
                background-color: var(--warning-color) !important;
            }
            .badge.bg-primary {
                background-color: var(--primary-color) !important;
            } /* Badge primary sesuai tema */
            .badge.bg-info {
                background-color: var(--info-color) !important;
            }

            h1,
            h2,
            h3,
            h4,
            h5,
            h6 {
                font-family: "Raleway", sans-serif;
                font-weight: 600;
                color: #2c3e50; /* Warna gelap untuk heading */
            }

            .header {
                background-color: #fff;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
                padding: 15px 0;
                margin-bottom: 20px;
            }

            .logo {
                font-family: "Raleway", sans-serif;
                font-weight: 700;
                font-size: 1.5rem;
                color: var(--primary-color); /* Logo dengan warna primary */
            }

            .card {
                border: none;
                border-radius: 8px;
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            }
            .card.bg-primary {
                background-color: var(--primary-color) !important;
            }
            .card.bg-success {
                background-color: var(--success-color) !important;
            }
            .card.bg-warning {
                background-color: var(--warning-color) !important;
            }
            .card.bg-danger {
                background-color: var(--danger-color) !important;
            }

            .modal-header {
                background-color: var(--primary-color);
                color: white;
                border-radius: 8px 8px 0 0;
            }

            .modal-title {
                font-family: "Raleway", sans-serif;
                font-weight: 600;
            }

            .table thead th {
                background-color: #f8f9fa;
                color: #495057;
                font-family: "Raleway", sans-serif;
                font-weight: 600;
                border-bottom: 2px solid #e9ecef;
            }

            .table tbody tr:hover {
                background-color: rgba(
                    232,
                    62,
                    140,
                    0.05
                    ); /* Hover baris tabel dengan hint warna primary */
            }

            @keyframes pulse {
                0% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.05);
                }
                100% {
                    transform: scale(1);
                }
            }

            .btn-pulse:hover {
                animation: pulse 1s infinite;
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
                background: #ef9245;
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
                            <h1 class="h2">Manajemen Acara</h1>
                            <div class="btn-toolbar mb-2 mb-md-0">
                                <button
                                    class="btn btn-primary btn-pulse"
                                    data-bs-toggle="modal"
                                    data-bs-target="#addEventModal"
                                    >
                                    <i class="fas fa-plus me-1"></i> Tambahkan Acara
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-3">
                            <div class="card bg-primary text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Total Acara</h5>
                                    <h2 class="mb-0">${totalEvent}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-success text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Acara Aktif</h5>
                                    <h2 class="mb-0">${totalEventOnGoing}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-warning text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Acara yang akan datang</h5>
                                    <h2 class="mb-0">${totalEventFinished}</h2>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card bg-danger text-white">
                                <div class="card-body">
                                    <h5 class="card-title">Habis Terjual</h5>
                                    <h2 class="mb-0">${totalTicket}</h2>
                                </div>
                            </div>
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
                                    <th>#</th>
                                    <th>Nama Acara</th>
                                    <th>Tanggal</th>
                                    <th>Lokasi</th>
                                    <th>Tipe</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="event" items="${events}" varStatus="loop">
                                    <tr>
                                        <td>${loop.index + 1}</td>
                                        <td>${event.name}</td>
                                        <td>${event.start_date}</td>
                                        <td>${event.location}</td>
                                        <td><span class="badge bg-primary">${event.type.title}</span></td>
                                        <td>
                                            <span class="badge bg-success">${event.status.name}</span>
                                        </td>
                                        <td class="action-btns">
                                            <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#editEventModal">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger delete-event">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </main>
            </div>
        </div>

        <div
            class="modal fade"
            id="addEventModal"
            tabindex="-1"
            aria-labelledby="addEventModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addEventModalLabel">
                            Tambah Acara Baru
                        </h5>
                        <button
                            type="button"
                            class="btn-close btn-close-white"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                            ></button>
                    </div>
                        <form method="post" action="${baseUrl}/admin-event">
                    <div class="modal-body">
                            <div class="mb-3">
                                <label for="name" class="form-label">Nama Acara</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="name"
                                    required
                                    />
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="start_date" class="form-label">Tanggal Mulai</label>
                                    <input
                                        type="date"
                                        class="form-control"
                                        id="start_date"
                                        required
                                        />
                                </div>
                                <div class="col-md-6">
                                    <label for="end_date" class="form-label">Tanggal Selesai</label>
                                    <input
                                        type="date"
                                        class="form-control"
                                        id="end_date"
                                        required
                                        />
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="location" class="form-label">Lokasi</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="location"
                                    required
                                    />
                            </div>
                            <div class="mb-3">
                                <label for="eventType" class="form-label">Tipe</label>
                                <select class="form-select" id="eventType" required>
                                    <option value="konser">Konser</option>
                                    <option value="seminar">Seminar</option>
                                    <option value="olahraga">Olahraga</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label"
                                       >Deskripsi</label
                                >
                                <textarea
                                    class="form-control"
                                    id="description"
                                    rows="3"
                                    ></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="poster_url" class="form-label">Gambar Acara</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="poster_url"
                                    required
                                    />
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal"
                            >
                            Batalkan
                        </button>
                        <button type="submit" class="btn btn-primary" id="saveEvent">
                            Simpan Acara
                        </button>
                    </div>
                        </form>
                </div>
            </div>
        </div>

        <div
            class="modal fade"
            id="editEventModal"
            tabindex="-1"
            aria-labelledby="editEventModalLabel"
            aria-hidden="true"
            >
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editEventModalLabel">Edit Acara</h5>
                        <button
                            type="button"
                            class="btn-close btn-close-white"
                            data-bs-dismiss="modal"
                            aria-label="Close"
                            ></button>
                    </div>
                    <div class="modal-body">
                        <form id="editEventForm">
                            <input type="hidden" id="editEventId" />
                            <div class="mb-3">
                                <label for="editEventName" class="form-label">Event Name</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="editEventName"
                                    required
                                    />
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="editEventDate" class="form-label">Date</label>
                                    <input
                                        type="date"
                                        class="form-control"
                                        id="editEventDate"
                                        required
                                        />
                                </div>
                                <div class="col-md-6">
                                    <label for="editEventType" class="form-label">Tipe</label>
                                    <select class="form-select" id="editEventType" required>
                                        <option value="concert">Konser</option>
                                        <option value="seminar">Seminar</option>
                                        <option value="sport">Olahraga</option>
                                        <option value="exhibition">Pameran</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="editEventLocation" class="form-label">Lokasi</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="editEventLocation"
                                    required
                                    />
                            </div>
                            <div class="row mb-3"></div>
                            <div class="mb-3"></div>
                            <div class="mb-3">
                                <label for="editEventStatus" class="form-label">Status</label>
                                <select class="form-select" id="editEventStatus" required>
                                    <option value="active">Aktif</option>
                                    <option value="inactive">Tidak aktif</option>
                                    <option value="soldout">Habis Terjual</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="editEventDescription" class="form-label"
                                       >Deskripsi</label
                                >
                                <textarea
                                    class="form-control"
                                    id="editEventDescription"
                                    rows="3"
                                    ></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="editimage" class="form-label">URL image</label>
                                <input
                                    type="text"
                                    class="form-control"
                                    id="editimage"
                                    required
                                    />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button
                            type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal"
                            >
                            Batalkan
                        </button>
                        <button type="button" class="btn btn-primary" id="updateEvent">
                            Perbaru Acara
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <jsp:include page="../component/script/dashboard.jsp" />

        <script>
            $(document).ready(function () {
                var eventsTable = $('#eventsTable').DataTable({
                    responsive: true,
                    language: {
                        search: "_INPUT_",
                        searchPlaceholder: "Search events...",
                    },
                    dom: '<"top"f>rt<"bottom"lip><"clear">',
                });

                function populateEditModal(eventId) {
                    var event = dummyEventData.find(e => e.id === eventId);
                    if (event) {
                        $('#editEventId').val(event.id);
                        $('#editEventName').val(event.name);
                        $('#editEventDate').val(event.date);
                        $('#editEventType').val(event.type);
                        $('#editEventLocation').val(event.location);
                        $('#editTotalTickets').val(event.totalTickets);
                        $('#editSoldTickets').val(event.soldTickets); // Populate sold tickets
                        $('#editTicketPrice').val(event.price);
                        $('#editEventStatus').val(event.status);
                        $('#editEventDescription').val(event.description);
                        $('#currentImageText').text(event.image ? 'Current image: ' + event.image : 'No image uploaded.');
                        $('#editEventImage').val(''); // Clear file input

                        if (event.status === 'soldout') {
                            $('#editEventModal .form-control, #editEventModal .form-select').prop('disabled', true);
                            $('#updateEvent').prop('disabled', true);
                        } else {
                            $('#editEventModal .form-control, #editEventModal .form-select').prop('disabled', false);
                            $('#updateEvent').prop('disabled', false);
                        }
                    }
                }

                $('#eventsTable tbody').on('click', '.delete-event', function () {
                    var row = $(this).closest('tr');
                    console.log(row.data());
                    if (confirm('Are you sure you want to delete this event?')) {
                        eventsTable.row(row).remove().draw(false);
                        fetch('${baseUrl}/admin-event', {
                            method: 'DELETE',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({ id: row.data()[0] })
                        }).then(response => {
                            if (response.ok) {
                                alert('Event deleted successfully');
                            } else {
                                alert('Failed to delete event');
                            }
                        });
                    }
                });
            });
        </script>
    </body>
</html>
