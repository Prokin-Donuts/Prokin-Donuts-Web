<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
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
<%@include file="/WEB-INF/views/includes/sidebar/wmSidebar.jsp"%>
<!-- ======== sidebar-nav end =========== -->

<!-- ======== main-wrapper start =========== -->
<main class="main-wrapper">
    <!-- ========== header start ========== -->
    <%@include file="/WEB-INF/views/includes/header/wmHeader.jsp"%>
    <!-- ========== header end ========== -->
    <!-- Modal HTML Start -->
    <%@ include file="/WEB-INF/views/includes/mypage/mypage.jsp" %>
    <!-- Modal HTML End -->

    <!-- ========== section start ========== -->
    <section class="section">
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="title">
                            <h2>입고요청</h2>
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
                        <h6 class="mb-10">제품 메뉴</h6>
                        <p class="text-sm mb-20"></p>

                        <div id="myCustomFilters" style="display: none;">
                            <div class="d-flex align-items-center gap-2" style="margin-top: -30px;">
                                <!-- 오른쪽: 등록/수정/삭제 -->
                                <div class="btu-group-1 d-flex gap-2">
                                    <button class="main-btn warning-btn-outline btn-hover btn-sm btn-xs" id="btnInboundAdd">입고 요청</button>
                                </div>
                            </div>
                        </div>
                        <div class="table-wrapper table-responsive p-0">
                            <!-- Start table -->
                            <table id="datatable" class="table striped-table w-100 inbound-datatable" style="width:100%">
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="select-all"></th>
                                    <th>제품코드</th>
                                    <th>제품명</th>
                                    <th>제품단가</th>
                                    <th>보관타입</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="product" items="${product}">
                                    <tr>
                                        <td></td>
                                        <td>${product.productCode}</td>
                                        <td>${product.productName}</td>
                                        <td>${product.productPrice}</td>
                                        <td>${product.storedType}</td>

                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal HTML Start -->
            <!-- 입고 요청 모달 -->
            <form id="inboundForm" action="/wm/inbound/request" method="post"  accept-charset="UTF-8">
                <div class="modal fade" id="addInboundModal" tabindex="-1" role="dialog" aria-labelledby="addInboundModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document"> <!-- modal-lg: 큰 창 -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">입고 요청 확인</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <%--<c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger mt-3">
                                            ${errorMessage}
                                    </div>
                                </c:if>--%>
                                <p>수량과 입고 날짜를 선택하고 입고요청 완료 버튼을 클릭하세요.</p>
                                <table class="table" id="selectedProductsTable">
                                    <thead>
                                    <tr>
                                        <th>번호</th>
                                        <th>제품코드</th>
                                        <th>제품명</th>
                                        <th>제품단가</th>
                                        <th>보관타입</th>
                                        <th>수량</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- JS로 동적 추가 -->
                                    </tbody>
                                </table>
                            </div>
                            <div class="modal-footer d-flex justify-content-between align-items-center">
                                <!-- 왼쪽: 입고 날짜 -->
                                <div class="form-group mb-0">
                                    <label for="inboundDate" class="mr-2 mb-0">입고 날짜:</label>
                                    <input type="date" class="form-control form-control-sm d-inline-block" id="inboundDate" style="width: auto;" />
                                </div>

                                <div>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                    <button type="button" class="main-btn primary-btn btn-primary btn-sm">입고 요청 완료</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </form>
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
    //ID가 datatable인 테이블을 DataTables로 초기화하고 반환된 객체를 table 변수에 저장.
    var table = $('#datatable').DataTable({
        autoWidth: false,
        columnDefs: [
            {targets: 0, orderable: false, searchable: false}, // 체크박스 컬럼
            // { targets: [0, 1, 2, 3], className: 'text-center' }
            {targets: [1, 2, 3, 4], className: 'text-center'}
            // { targets: [1, 2, 3, 4, 6, 7], className: 'text-center' }
        ],
        order: [[1, 'asc']],
        columns: [
            { // 체크박스 컬럼
                data: null,
                orderable: false,
                searchable: false,
                render: function (data, type, row, meta) {
                    return '<input type="checkbox" class="row-checkbox">';
                }
            },
            {data: 'productCode', title: '제품코드'},
            {data: 'productName', title: '제품명'},
            {data: 'productPrice', title: '제품단가'},
            {data: 'storedType', title: '보관타입'},
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
        initComplete: function (settings, json) {
            $('#datatable thead th').eq(0).removeClass('sorting sorting_asc sorting_desc');
            fixLengthDropdownStyle();
        },
        // 새로고침 후 체크박스에서 정렬 화살표 지우기 (유지)
        drawCallback: function (settings) {
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

    $clone.find('#btnInboundAdd').attr('id', 'btnInboundAdd_clone');
    $clone.find('#btnInboundEdit').attr('id', 'btnInboundEdit_clone');
    $clone.find('#btnInboundDelete').attr('id', 'btnInboundDelete_clone');
    $clone.find('#btnInboundAdd, #btnInboundEdit, #btnInboundDelete').remove();
    $('div.myFilterArea').html($clone.html());

    // select 태그 감싸는 구조 적용
    $('.dataTables_length select').each(function () {
        const $select = $(this);
        if (!$select.parent().hasClass('select-position')) {
            $select.wrap('<div class="col-lg-2"><div class="select-style-1"><div class="select-position"></div></div></div>');
        }
    });
    // 8. "Select All" 체크박스 이벤트 및 페이지 변경 시 초기화 등은 그대로 유지
    $('#select-all').on('click', function () {
        const rows = table.rows({page: 'current'}).nodes();
        $('input.row-checkbox', rows).prop('checked', this.checked);
    });
    $('#datatable tbody').on('change', 'input.row-checkbox', function () {
        if (!this.checked) {
            const el = $('#select-all').get(0);
            if (el && el.checked) {
                el.checked = false;
            }
        }
    });

    table.on('draw', function () {
        $('#select-all').prop('checked', false);
    });

    // "입고 요청" 버튼 클릭 시
    $('#btnInboundAdd_clone').on('click', function () {
        const selectedData = [];

        // 체크된 행들의 데이터 수집
        $('#datatable tbody input.row-checkbox:checked').each(function () {
            const rowData = table.row($(this).closest('tr')).data();
            console.log(rowData);
            selectedData.push(rowData);
        });

        // 체크 안 되어 있으면 알림
        if (selectedData.length === 0) {
            alert('입고 요청할 제품을 선택해주세요.');
            return;
        }

        // 모달 내부 테이블 초기화
        const $tableBody = $('#selectedProductsTable tbody');
        $tableBody.empty();

        // 선택한 제품 정보 테이블에 삽입
        selectedData.forEach((item, index) => {
            const rowHtml = `
        <tr>
          <td> ` + (index + 1) + `</td>
          <td>` + item.productCode + `</td>
          <td>` + item.productName + `</td>
          <td>` + item.productPrice + `</td>
          <td>` + item.storedType + `</td>
          <td><input type="number" class="form-control quantity-input"   min="100" value="100" step="100" style="width: 80px;"></td>
        </tr>
      `;
            $tableBody.append(rowHtml);
        });

        // 모달 열기
        $('#addInboundModal').modal('show');
    });

    $('#addInboundModal').on('shown.bs.modal', function () {
        const today = new Date();
        console.log(today);

        const yyyy = today.getFullYear();
        const mm = String(today.getMonth() + 1).padStart(2, '0'); // 반드시 +1 필요
        const dd = String(today.getDate()).padStart(2, '0');      // 0으로 시작되게 패딩

        const minDate = `` + yyyy + `-` + mm + `-` + dd + ``;

        console.log('✅ 오늘 날짜 (minDate):', minDate); // 여기서 값 확인
        $('#inboundDate').attr('min', minDate);

    });



    $('#addInboundModal .btn-primary').on('click', function () {
        let invalid = false;
        // 기존 input 정리
        $('#inboundForm input.dynamic-field').remove();
        // 날짜 추가
        const inboundDate = $('#inboundDate').val();
        //입고 날짜 선택 안 하면 return
        if (!inboundDate) {
            alert('입고 날짜를 선택해주세요.');
            return;
        }

        $('<input>').attr({
            type: 'hidden',
            name: 'inboundDate',
            value: inboundDate,
            class: 'dynamic-field'
        }).appendTo('#inboundForm');

        // 제품 목록 반복
        $('#selectedProductsTable tbody tr').each(function (i) {

            const $tds = $(this).find('td');
            const quantity = $(this).find('.quantity-input').val();

            if (!/^\d+$/.test(quantity)) {
                alert("수량은 자연수만 입력해주세요.");
                invalid = true;
                return false;
            }

            const productCode = $tds.eq(1).text().trim();
            const productName = $tds.eq(2).text().trim();
            const productPrice = $tds.eq(3).text().trim();
            const storedType = $tds.eq(4).text().trim();

            // form에 hidden input 추가
            $('<input>').attr({
                type: 'hidden',
                name: 'productList[' + i + '].productCode',
                value: productCode,
                class: 'dynamic-field'
            }).appendTo('#inboundForm');

            $('<input>').attr({
                type: 'hidden',
                name: 'productList[' + i + '].productName',
                value: productName,
                class: 'dynamic-field'
            }).appendTo('#inboundForm');

            $('<input>').attr({
                type: 'hidden',
                name: 'productList[' + i + '].productPrice',
                value: productPrice,
                class: 'dynamic-field'
            }).appendTo('#inboundForm');

            $('<input>').attr({
                type: 'hidden',
                name: 'productList[' + i + '].storedType',
                value: storedType,
                class: 'dynamic-field'
            }).appendTo('#inboundForm');

            $('<input>').attr({
                type: 'hidden',
                name: 'productList[' + i + '].quantity',
                value: quantity,
                class: 'dynamic-field'
            }).appendTo('#inboundForm');
        });

        if (invalid) {
            return;
        }
        // form 전송
        $('#inboundForm').submit();
    });
    console.log($('#inboundDate').length); // 1 아니면 문제 있음
    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>


</script>
<c:if test="${not empty successMessage}">
    <script>
        alert('${successMessage}');
    </script>
</c:if>

<c:if test="${not empty errorMessage}">
    <script>
        alert('${errorMessage}');
    </script>
</c:if>

<c:if test="${showModal}">
    <script>
        $(document).ready(function () {
            $('#addInboundModal').modal('show'); // ❗ 등록 실패 후 모달 유지
        });
    </script>
</c:if>
</body>
</html>