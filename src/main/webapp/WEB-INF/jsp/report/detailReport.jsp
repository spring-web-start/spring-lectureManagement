<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="modal.jsp"/>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>리포트 관리</title>

    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top" onload="init();">

<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="/index.jsp">Start Bootstrap</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for..." aria-label="Search"
                   aria-describedby="basic-addon2">
            <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <span class="badge badge-danger">9+</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="alertsDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow mx-1">
            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <span class="badge badge-danger">7</span>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="messagesDropdown">
                <a class="dropdown-item" href="#">Action</a>
                <a class="dropdown-item" href="#">Another action</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Something else here</a>
            </div>
        </li>
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-user-circle fa-fw"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Activity Log</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">Logout</a>
            </div>
        </li>
    </ul>

</nav>

<div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
        <li class="nav-item">
            <a class="nav-link" href="#">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="pagesDropdown" role="button" data-toggle="dropdown"
               aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-fw fa-folder"></i>
                <span>Pages</span>
            </a>
            <div class="dropdown-menu" aria-labelledby="pagesDropdown">
                <h6 class="dropdown-header">Login Screens:</h6>
                <a class="dropdown-item" href="/security/login">Login</a>
                <a class="dropdown-item" href="/security/signUp">Register</a>
                <a class="dropdown-item" href="/calendar/timetable">TimeTable</a>
                <a class="dropdown-item" href="/forgot-password.html">Forgot Password</a>
                <div class="dropdown-divider"></div>
                <h6 class="dropdown-header">Other Pages:</h6>
                <a class="dropdown-item" href="/404.html">404 Page</a>
                <a class="dropdown-item" href="/blank.html">Blank Page</a>
            </div>
        </li>
        <li class="nav-item active">
            <a class="nav-link" href="/report/">
                <i class="fas fa-fw fa-clipboard"></i>
                <span>Reports</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/charts.html">
                <i class="fas fa-fw fa-chart-area"></i>
                <span>Charts</span></a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/tables.html">
                <i class="fas fa-fw fa-table"></i>
                <span>Tables</span></a>
        </li>
    </ul>

    <div id="content-wrapper">

        <div class="container-fluid">

            <%--상단 탭 --%>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link" href="/report/room/${roomNo}">방 소개</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="/report/report/${roomNo}">과제</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/report/trello/${roomNo}">업무 배분</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/report/chat/${roomNo}">채팅</a>
                </li>
            </ul>
            <br>
            <div class="container">
                <h2>글 상세 보기</h2>
                <div class="table table-responsive">
                    <table class="table">
                        <tr>
                            <th class="success">작성자</th>
                            <td>${board.userName}</td>
                            <th class="success">작성일</th>
                            <td>${board.createdDate}</td>
                        </tr>
                        <tr>
                            <th class="success">조회수</th>
                            <td>${board.viesNum}</td>
                            <th class="success">수정일</th>
                            <td>${board.modifiedDate}</td>
                        </tr>
                        <tr>
                            <th class="success">제목</th>
                            <td colspan="3">${board.title}</td>
                        </tr>

                        <tr>
                            <th class="success">글 내용</th>
                            <td colspan="3">${board.contents}</td>
                        </tr>
                    </table>
                    <button type="button" class="btn btn-info" onclick="location.href='/report/report/${roomNo}'">목록으로
                    </button>
                    <c:if test="${isMyBoard eq true}">
                        <input type="hidden" id="roomNoFromDetailReport" value="${roomNo}"/>
                        <button type="button" class="btn btn-success" onclick="modifiedBoard('${board.bno}','${board.title}','${board.contents}')">수정하기</button>
                        <button type="button" class="btn btn-danger" onclick="deleteBoard('${board.bno}')">삭제하기</button>
                    </c:if>

                </div>
            </div>

            <!-- Sticky Footer -->
            <footer class="sticky-footer">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright © Your Website 2019</span>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="security/login.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function deleteBoard(bno) {

            $("#deleteBno").val(bno);

            //modal을 띄워준다.
            $("#deleteBoardModal").modal('show');
        }

        function modifiedBoard(bno,title,contents) {
            $("#modifiedBno").val(bno);
            $("#modifiedBoardTitle").val(title);
            $("#modifedBoardContents").val(contents);

            //modal을 띄워준다.
            $("#modifiedBoardModal").modal('show');
        }
    </script>

    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <%--modal--%>
    <script src="/js/modal.js" type="text/javascript" charset="utf-8"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Page level plugin JavaScript-->
    <script src="/vendor/chart.js/Chart.min.js"></script>
    <script src="/vendor/datatables/jquery.dataTables.js"></script>
    <script src="/vendor/datatables/dataTables.bootstrap4.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin.min.js"></script>

    <!-- dhtmlxscheduler js -->
    <script src="/js/dhtmlxscheduler.js" type="text/javascript" charset="utf-8"></script>
    <script src="/js/dhtmlxscheduler_tooltip.js" type="text/javascript" charset="utf-8"></script>
</body>

</html>