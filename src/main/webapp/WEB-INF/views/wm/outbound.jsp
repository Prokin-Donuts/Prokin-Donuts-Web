<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="<c:url value='/resources/images/logo/favicon_logo.png'/>" type="image/png" />
    <title>Prokin Donuts</title>

    <!-- ========== All CSS files linkup ========= -->
    <link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/lineicons.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value='/resources/css/materialdesignicons.min.css'/>" type="text/css" />
    <link rel="stylesheet" href="<c:url value='/resources/css/fullcalendar.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/main.css'/>" />
    <!-- datatable을 위해 필요함 -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
</head>

<body>
<!-- ======== Preloader =========== -->
<div id="preloader">
    <div class="spinner"></div>
</div>
<!-- ======== Preloader =========== -->

<!-- ======== sidebar-nav start =========== -->
<aside class="sidebar-nav-wrapper">
    <div class="navbar-logo">
        <a href="qh-dashboard.html">
            <img src="<c:url value='/resources/images/logo/menu_logo.png'/>" alt="logo" />
        </a>
    </div>
    <nav class="sidebar-nav">
        <ul>
            <li class="nav-item">
            </li>
            <li class="nav-item nav-item-has-children">
                <a
                        href="#0"
                        data-bs-toggle="collapse"
                        data-bs-target="#ddmenu_2"
                        aria-controls="ddmenu_2"
                        aria-expanded="true"
                        aria-label="Toggle navigation"
                >
              <span class="icon">
                <i width="20" height="20" viewBox="0 0 20 20" fill="none" class="lni lni-users"></i>
              </span>
                    <span class="text">회원관리</span>
                </a>
                <ul id="ddmenu_2" class="collapse dropdown-nav show">
                    <li>
                        <a href="qh-member-list.html" class="hover-text-grow"> 회원목록 </a>
                    </li>
                    <li>
                        <a href="qh-member-request.html" style="color: black; font-size: 17px;" > 회원 가입 요청 목록 </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="qh-warehouse.html">
              <span class="icon">
                <i width="20" height="20" viewBox="0 0 20 20" fill="none" class="lni lni-home"></i>
              </span>
                    <span class="text">창고관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="qh-franchise.html">
              <span class="icon">
                <i width="20" height="20" viewBox="0 0 20 20" fill="none" class="lni lni-apartment"></i>
              </span>
                    <span class="text">가맹점관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="qh-inventory.html">
              <span class="icon">
                <i width="20" height="20" viewBox="0 0 20 20" fill="none" class="lni lni-package"></i>
              </span>
                    <span class="text">재고관리</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="qh-product.html">
              <span class="icon">
                <i width="20" height="20" viewBox="0 0 20 20" fill="none" class="lni lni-chef-hat"></i>
              </span>
                    <span class="text">제품관리</span>
                </a>
            </li>
            <li class="nav-item nav-item-has-children">
                <a
                        href="#0"
                        class="collapsed"
                        data-bs-toggle="collapse"
                        data-bs-target="#ddmenu_55"
                        aria-controls="ddmenu_55"
                        aria-expanded="false"
                        aria-label="Toggle navigation"
                >
              <span class="icon">
                <i width="20" height="20" viewBox="0 0 20 20" fill="none" class="lni lni-cart"></i>
              </span>
                    <span class="text">입고관리</span>
                </a>
                <ul id="ddmenu_55" class="collapse dropdown-nav">
                    <li>
                        <a href="qh-inbound_request.html" class="hover-text-grow"> 입고 요청 목록 </a>
                    </li>
                    <li>
                        <a href="qh-inbound_status.html" class="hover-text-grow"> 입고현황 </a>
                    </li>
                </ul>
            </li>
            <li class="nav-item">
                <a href="qh-outbound.html">
              <span class="icon">
                <i width="20" height="20" viewBox="0 0 20 20" fill="none" class="lni lni-delivery"></i>
              </span>
                    <span class="text">출고관리</span>
                </a>
            </li>
        </ul>
    </nav>

</aside>
<div class="overlay"></div>
<!-- ======== sidebar-nav end =========== -->

<!-- ======== main-wrapper start =========== -->
<main class="main-wrapper">
    <!-- ========== header start ========== -->
    <%@include file="/WEB-INF/views/includes/wmHeader.jsp"%>
    <!-- ========== header end ========== -->
    <!-- Modal HTML Start -->
    <%@ include file="/WEB-INF/views/includes/mypage.jsp" %>
    <!-- Modal HTML End -->

    <!-- ========== section start ========== -->
    <section class="section">
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="title">
                            <h2>출고관리</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== title-wrapper end ========== -->

            <div class="row">
                <!-- Start col -->
                <div class="col-lg-12">
                    <!-- Start card -->
                    <div class="card-style mb-30">
                        <h6 class="mb-10">회원가입 요청 목록</h6>
                        <p class="text-sm mb-20"></p>

                        <div id="myCustomFilters" style="display: none;">
                            <div class="d-flex align-items-center gap-2" style="margin-top: -30px;">
                                <!-- 승인-->
                                <div class="btu-group-1 d-flex gap-2">
                                    <button class="main-btn warning-btn-outline btn-hover btn-sm btn-xs" id="btnApprove">승인</button>
                                </div>
                            </div>
                        </div>
                        <div class="table-wrapper table-responsive p-0">
                            <!-- Start table -->
                            <table id="datatable" class="table striped-table w-100 member-datatable" style="width:100%">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="select-all"></th>
                                    <th>요청 날짜</th>
                                    <th>성함</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>주소</th>
                                    <th>아이디</th>
                                    <th>비밀번호</th>
                                    <th>요청상태</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal HTML Start -->
            <!-- 승인 모달 -->
            <div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="approveModalLabel">회원가입 요청 승인</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>선택한 회원의 가입요청을 승인하겠습니까?</h5><br>
                            <ul id="approveList" class="list-group mb-3">
                                <!-- 선택된 회원 목록 삽입 -->
                            </ul>
                            <div class="d-flex justify-content-end gap-2">
                                <button type="button" class="main-btn primary-btn btn-hover text-center" id="confirmApprove">승인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal HTML End -->

        </div>
    </section>
    <!-- ========== section end ========== -->

    <!-- ========== footer start =========== -->
    <footer class="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="terms d-flex justify-content-center justify-content-md-end">
                        <a href="https://small-ragdoll-a57.notion.site/Prokin-Donuts-1b83a719d3508047953eeda89caeec14" class="text-sm">Brand Story</a>
                        <a href="https://github.com/Prokin-Donuts/Prokin-Donuts" class="text-sm ml-15">Dev Hub</a>
                    </div>
                </div>
                <!-- end col-->
            </div>
            <!-- end row -->
        </div>
        <!-- end container -->
    </footer>
    <!-- ========== footer end =========== -->
</main>
<!-- ======== main-wrapper end =========== -->

<!-- ========= All Javascript files linkup ======== -->
<script src="<c:url value='/resources/js/Chart.min.js'/>"></script>
<script src="<c:url value='/resources/js/dynamic-pie-chart.js'/>"></script>
<script src="<c:url value='/resources/js/moment.min.js'/>"></script>
<script src="<c:url value='/resources/js/fullcalendar.js'/>"></script>
<script src="<c:url value='/resources/js/jvectormap.min.js'/>"></script>
<script src="<c:url value='/resources/js/world-merc.js'/>"></script>
<script src="<c:url value='/resources/js/polyfill.js'/>"></script>
<script src="<c:url value='/resources/js/main.js'/>"></script>
<!-- datatable을 위해 필요함 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="<c:url value='/resources/js/bootstrap.bundle.min.js'/>"></script>

<script>
    var table = $('#datatable').DataTable({
        autoWidth: false,
        columnDefs: [
            { width: '95px', targets: -1 },  // Actions 열 너비
            { targets: [1, 2, 3, 4, 6, 7], className: 'text-center' } // JS 속성으로 가운데 정렬
        ],
        order: [[1, 'asc']],
        ajax: function(data, callback, settings) {
            const dummyMembers = [
                {
                    requestDate: "2025-03-15",
                    name: "김주현",
                    phone: "010-3498-1265",
                    email: "juhyun_kim@gmail.com",
                    address: "서울특별시 동작구 사당로 22",
                    id: "juhyun01",
                    password: "juhyun01!",
                    status: "승인대기"
                },
                {
                    requestDate: "2025-03-27",
                    name: "이채원",
                    phone: "010-8217-9033",
                    email: "chae_lee@gmail.com",
                    address: "경기도 고양시 일산동구 중앙로 88",
                    id: "cwlee99",
                    password: "cwlee99!",
                    status: "승인대기"
                },
                {
                    requestDate: "2025-03-30",
                    name: "박상우",
                    phone: "010-4726-8859",
                    email: "sangwoo_p@gmail.com",
                    address: "인천광역시 연수구 센트럴로 11",
                    id: "psw321",
                    password: "psw321!",
                    status: "승인대기"
                },
                {
                    requestDate: "2025-04-02",
                    name: "정예린",
                    phone: "010-6325-7104",
                    email: "yerin_j@gmail.com",
                    address: "대전광역시 유성구 유성대로 135",
                    id: "yerin333",
                    password: "yerin333!",
                    status: "승인대기"
                },
                {
                    requestDate: "2025-04-04",
                    name: "오태경",
                    phone: "010-2951-4480",
                    email: "taek_oh@naver.com",
                    address: "부산광역시 해운대구 마린시티2로 77",
                    id: "otk_84",
                    password: "otk_84!",
                    status: "승인대기"
                }
            ];

            // 데이터를 비동기적으로 불러온 후 callback으로 전달
            // 페이지네이션을 위해 반드시 필요 (단, 본인 더미데이터 변수로 변경 필요)
            Promise.resolve().then(() => {
                callback({ data: dummyMembers });
            });
        },
        columns: [
            { // 체크박스 컬럼
                data: null,
                orderable: false,
                searchable: false,
                render: function(data, type, row, meta) {
                    return '<input type="checkbox" class="row-checkbox">';
                }
            },
            { data: 'requestDate', title: '요청날짜' },
            { data: 'name', title: '성함' },
            { data: 'phone', title: '전화번호' },
            { data: 'email', title: '이메일' },
            { data: 'address', title: '주소' },
            { data: 'id', title: '아이디' },
            { data: 'password', title: '비밀번호' },
            { data: 'status', title: '요청상태' },
        ],
        paging: true,
        pageLength: 10,
        lengthMenu: [[5, 10, 20, -1], ['5개', '10개', '20개', '전체']],
        searching: true,
        ordering: true,
        info: true,
        lengthChange: true,
        dom: '<"top"l<"myFilterArea">fr>t<"bottom"ip>',
        language: {
            lengthMenu: '_MENU_',
            search: "검색 ",
            info: "Showing _START_ to _END_ of _TOTAL_ entries",
            infoEmpty: "no data",
            emptyTable: "empty table",
            paginate: {
                previous: "< prev",
                next: "next >"
            }
        },
        // 초기에 체크박스에서 정렬 화살표 지우기
        initComplete: function(settings, json) {
            $('#datatable thead th').eq(0).removeClass('sorting sorting_asc sorting_desc');
            fixLengthDropdownStyle();
        },
        // 새로고침 후 체크박스에서 정렬 화살표 지우기 (유지)
        drawCallback: function(settings) {
            $('#datatable thead th').eq(0).removeClass('sorting sorting_asc sorting_desc');
        }
    });

    // 5. DataTable 초기화 (dom 옵션에 사용자 정의 영역 포함)
    function fixLengthDropdownStyle() {
        const $length = $('.dataTables_length');
        const $select = $length.find('select');
        const selectedValue = $select.val();

        const $filter = $('#datatable_filter');
        const $input = $filter.find('input');

        // 기존 label 텍스트 제거 (ex. "표시 개수")
        $length.find('label').contents().filter(function () {
            return this.nodeType === 3; // 텍스트 노드
        }).remove();

        // 새 구조로 재조립
        const $newWrapper = $(`
            <div class="select-style-1">
              <div class="select-position"></div>
            </div>
          `);

        const $newInput = $(`
            <div class="input-style-1">
            </div>
          `);

        $select.detach();
        $newWrapper.find('.select-position').append($select);
        $length.empty().append($newWrapper);

        $input.detach();
        $input.attr('placeholder', 'Search...');
        $newInput.append($input);
        $filter.empty().append($newInput);

        $select.val(selectedValue);
    }

    table.on('draw', function () {
        $('.dataTables_paginate .paginate_button').removeClass().addClass('main-btn deactive-btn-outline square-btn btn-hover mt-1 pt-2 pb-2 pl-15 pr-15');
    });
    // 6. 사용자 정의 필터 영역에 원본 필터를 복제하여 주입
    var $clone = $('#myCustomFilters').clone(true);
    // 복제 후 삽입 시, ID 제거 필수
    $clone.find('#btnApprove').attr('id', 'btnApprove_clone');
    $clone.find('#btnApprove').remove();

    $('div.myFilterArea').html($clone.html());

    // select 태그 감싸는 구조 적용
    $('.dataTables_length select').each(function() {
        const $select = $(this);
        if (!$select.parent().hasClass('select-position')) {
            $select.wrap('<div class="col-lg-2"><div class="select-style-1"><div class="select-position"></div></div></div>');
        }
    });
    // 8. "Select All" 체크박스 이벤트 및 페이지 변경 시 초기화 등은 그대로 유지
    $('#select-all').on('click', function() {
        const rows = table.rows({ page: 'current' }).nodes();
        $('input.row-checkbox', rows).prop('checked', this.checked);
    });
    $('#datatable tbody').on('change', 'input.row-checkbox', function() {
        if(!this.checked) {
            const el = $('#select-all').get(0);
            if(el && el.checked) {
                el.checked = false;
            }
        }
    });

    table.on('draw', function() {
        $('#select-all').prop('checked', false);
    });

    // 승인 버튼 클릭 시
    $('#btnApprove_clone').on('click', function (e) {
        const selectedRows = table.rows({ page: 'current' }).nodes();
        const selectedData = [];

        $(selectedRows).each(function () {
            if ($(this).find('.row-checkbox').prop('checked')) {
                const data = table.row(this).data();
                selectedData.push(data);
            }
        });

        if (selectedData.length === 0) {
            alert('승인할 요청을 선택하세요.');
            return;
        }

        // 회원 목록을 <ul> 안에 추가
        const $list = $('#approveList');
        $list.empty(); // 기존 내용 비우고

        selectedData.forEach((item) => {
            const $li = $(`
      <li class="list-group-item d-flex justify-content-between align-items-center">
        <span>${item.name} (${item.id})</span>
        <span class="badge bg-secondary">${item.status}</span>
      </li>
    `);
            $list.append($li);
        });
        $('#approveModal').modal('show');
    });

    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypageData.jsp" %>

</script>

</body>
</html>