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

<%@include file="/WEB-INF/views/includes/sidebar/qhSidebar.jsp"%>
<!-- ======== sidebar-nav end =========== -->

<!-- ======== main-wrapper start =========== -->
<main class="main-wrapper">
    <!-- ========== header start ========== -->
    <%@include file="/WEB-INF/views/includes/Header/qhHeader.jsp"%>
    <!-- ========== header end ========== -->
    <!-- 마이페이지 모달 -->
    <%@ include file="/WEB-INF/views/includes/mypage/mypage.jsp" %>
    <!-- Modal HTML End -->

    <!-- ========== section start ========== -->

    <!-- ========== section start ========== -->
    <section class="section">
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="title">
                            <h2>창고관리</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ========== title-wrapper end ========== -->

            <div class="row">

                <!-- Start col -->
                <div class="col-lg-4">
                    <!-- Start card -->

                    <!-- 지도 API 띄울 공간 -->
                    <div class="card-style mb-30">
                        <h6 class="mb-10">창고 위치</h6>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                        <p class="text-sm mb-20">지도 배치 예정</p>
                    </div>
                </div>

                <!-- Start col -->
                <div class="col-lg-8">
                    <!-- Start card -->
                    <div class="card-style mb-30">
                        <h6 class="mb-10">창고 목록</h6>
                        <p class="text-sm mb-20"></p>

                            <!-- 원하는 필터(중분류, 소분류) 설정 -->
                        <div id="myCustomFilters" style="display: none;">

                            <div class="d-flex flex-wrap gap-2">
                                <!-- 중분류 -->
                                <div >
                                    <div class="select-style-1">
                                        <div class="select-position">
                                            <select id="LocationCategories">
                                                <option value="">소재지</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- 필터 초기화 -->
                                <div class="mb-20">
                                    <button class="main-btn warning-btn-outline btn-hover btn-sm btn-xs" id="resetFilterBtn" style="height:auto; min-height:auto;">
                                        필터 초기화
                                    </button>
                                </div>

                                <!-- 오른쪽: 등록/수정/삭제 -->
                                <div class="btu-group-1 ms-auto gap-2 mb-20">
                                    <button class="main-btn warning-btn-outline btn-hover btn-sm btn-xs" id="btnWarehouseAdd">등록</button>
                                </div>
                            </div>

                        </div>

                        <div class="table-wrapper table-responsive p-0">


                            <!-- Start table -->
                            <table id="datatable" class="table striped-table w-100" style="width:100%">

                                <!-- colgroup를 통해 열 폭을 강제 지정 -->
                                <colgroup>
                                    <col style="width: 10%;" />
                                    <col style="width: 18%;" />
                                    <col style="width: 14%;" />
                                    <col style="width: 13%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 20%;" />
                                    <col style="width: 10%;" />
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>창고코드</th>
                                    <th>창고명</th>
                                    <th>소재지</th>
                                    <th>수용한도</th>
                                    <th>담당자</th>
                                    <th>담당자 이메일</th>
                                    <th>설정</th> <!-- 수정/삭제 열 -->
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="w" items="${warehouseList}">
                                    <tr>
                                        <td>${w.warehouseCode}</td>
                                        <td>${w.warehouseName}</td>
                                        <td>${w.address}</td>
                                        <td>${w.capacityLimit}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty w.memberName}">
                                                    ${w.memberName}
                                                </c:when>
                                                <c:otherwise>
                                                    담당자없음
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty w.memberEmail}">
                                                    ${w.memberEmail}
                                                </c:when>
                                                <c:otherwise>
                                                    없음
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="display: none;">${w.status}</td>
                                        <td style="display: none;">${w.memberCode}</td>
                                        <td>
                                            <button class="btn btn-edit" data-code="${w.warehouseCode}">수정</button>
                                            <button class="btn btn-delete" data-code="${w.warehouseCode}">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal HTML Start -->
            <!-- 창고 등록 모달 -->
            <div
                    class="modal fade" id="warehouseAddModal"
                    tabindex="-1" aria-labelledby="warehouseAddModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- 모달 헤더 -->
                        <div class="modal-header">
                            <h3 class="modal-title" id="warehouseAddModalLabel">창고 등록</h3>
                            <button
                                    type="button"
                                    class="btn-close"
                                    data-bs-dismiss="modal"
                                    aria-label="Close">
                            </button>
                        </div>

                        <!-- 모달 바디 -->
                        <div class="modal-body">

                            <!-- 필수 입력 항목 안내 -->
                            <p class="text-danger fw-normal mb-3">(*)는 필수 입력 항목입니다.</p>

                            <!-- 등록 폼 -->
                            <form id="warehouseRegisterForm" action="${pageContext.request.contextPath}/qh/warehouse/add" method="post">

                                <!-- 창고명 (중복확인 버튼 포함) -->
                                <div class="mb-3">
                                    <label for="warehouseName" class="form-label">창고명 (*)</label>
                                    <div class="d-flex gap-2">
                                        <input
                                                type="text"
                                                placeholder="창고명을 입력하세요"
                                                class="form-control"
                                                id="warehouseName"
                                                name="warehouseName"
                                        />
                                        <button
                                                type="button"
                                                class="main-btn primary-btn btn-hover btn-smaller"
                                                id="checkDuplicate"
                                        >
                                            중복 확인
                                        </button>
                                    </div>
                                </div>

                                <!-- 소재지 (다음 우편번호 API 적용) -->
                                <div class="mb-3">
                                    <label class="form-label">소재지 (*)</label>
                                    <div class="d-flex gap-2">
                                        <input
                                                type="text"
                                                class="form-control"
                                                id="zonecode_disp"
                                                placeholder="우편번호"
                                                disabled
                                        />
                                        <button
                                                type="button"
                                                class="main-btn primary-btn btn-hover btn-smaller"
                                                id="search-btn"
                                        >
                                            우편번호
                                        </button>
                                    </div>
                                    <input
                                            type="text"
                                            class="form-control mt-1"
                                            id="roadAddress_disp"
                                            placeholder="도로명 주소"
                                            disabled
                                    />
                                    <input
                                            type="text"
                                            class="form-control mt-1"
                                            id="detailAddress_disp"
                                            placeholder="상세주소를 입력해주세요."
                                    />

                                    <!-- ---------------------- -->
                                    <!-- 숨긴 필드: 서버 전송용 -->
                                    <!-- ---------------------- -->
                                    <input type="hidden" name="zonecode" id="zonecode_hidden" />
                                    <input type="hidden" name="roadAddress" id="roadAddress_hidden" />
                                    <input type="hidden" name="detailAddress" id="detailAddress_hidden" />
                                    <input type="hidden" name="address" id="fullAddress" />

                                </div>

                                <!-- 수용한도 (레이블 제거, 인풋 그룹 안에 표시) -->
                                <div class="mb-3">
                                    <label class="form-label" for="capacity">수용한도 (*)</label>
                                    <div class="input-group">
                                        <input
                                                type="text"
                                                class="form-control"
                                                id="capacity"
                                                name="capacityLimit"
                                                placeholder="한도를 입력하세요"
                                        />
                                        <span class="input-group-text">m제곱</span>
                                    </div>
                                </div>

                                <!-- 담당자 (드롭다운) -->
                                <div class="mb-3">
                                    <label for="member" class="form-label">담당자</label>
                                    <select class="form-select" id="member" name="memberCode">
                                        <option value="null">담당자 없음</option>
                                        <c:forEach var="m" items="${unassignedWMs}">
                                            <option value="${m.memberCode}">${m.memberCode} | ${m.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- 등록 버튼 -->
                                <div class="text-center w-100 mt-1 mb-3">
                                    <button
                                            type="submit"
                                            class="main-btn primary-btn btn-hover text-center"
                                            id="warehouseRegisterBtn"
                                    >
                                        등록
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 모달 끝 -->

            <!-- 수정 모달 -->
            <div class="modal fade" id="warehouseEditModal" tabindex="-1" role="dialog" aria-labelledby="warehouseEditModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">

                        <!-- 모달 헤더 -->
                        <div class="modal-header">
                            <h3 class="modal-title" id="warehouseEditModalLabel">창고 수정</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- 모달 바디 -->
                        <div class="modal-body">
                            <!-- 필수 입력 항목 안내 -->
                            <p class="text-danger fw-normal mb-3">(*)는 필수 입력 항목입니다.</p>

                            <!-- 창고명 (중복확인 버튼 포함) -->
                            <form id="modifyWarehouseForm" action="${pageContext.request.contextPath}/qh/warehouse/update" method="post">
                                <input type="hidden" name="warehouseCode" id="modifyWarehouseCode" />

                                <!-- 창고명 입력 & 중복확인 -->
                                <div class="mb-3">
                                    <label for="modifyWarehouseName" class="form-label">창고명 (*)</label>
                                    <div class="d-flex gap-2">
                                        <input type="text" class="form-control" id="modifyWarehouseName" name="warehouseName" placeholder="창고명을 입력하세요">
                                        <button type="button" class="main-btn primary-btn btn-hover btn-smaller" id="modifyCheckDuplicateWarehouse">중복 확인</button>
                                    </div>
                                </div>

                                <!-- 담당자 드롭박스 -->
                                <div class="mb-3">
                                    <label for="modifyWarehouseMember" class="form-label">담당자</label>
                                    <select class="form-select" id="modifyWarehouseMember" name="memberCode">
                                        <option value="null">담당자 없음</option>
                                        <c:forEach var="m" items="${unassignedWMs}">
                                            <option value="${m.memberCode}">${m.memberCode} | ${m.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- 모달 푸터: 제출 및 취소 버튼 -->
                                <div class="text-end">
                                    <button type="submit" class="main-btn primary-btn btn-hover text-center" id="warehouseModifyBtn">수정</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 삭제 모달 -->
            <div class="modal fade" id="warehouseDeleteModal" tabindex="-1" aria-labelledby="warehouseDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- 모달 헤더 -->
                        <div class="modal-header">
                            <h3 class="modal-title" id="warehouseDeleteModalLabel">창고 삭제</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <!-- 모달 바디 -->
                        <div class="modal-body">

                            <form id="warehouseDeleteForm" action="${pageContext.request.contextPath}/qh/warehouse/delete" method="post">
                                <input type="hidden" name="warehouseCode" id="deleteWarehouseCode" />

                                <!-- JS에서 체크한 행에 따라 채워질 영역 -->
                                <div id="deleteContentOk" style="display:none;"></div>
                                <div id="deleteContentNo" style="display:none;"></div>

                                <div class="d-flex justify-content-end gap-2">
                                    <button type="submit" class="main-btn primary-btn btn-hover text-center" id="confirmDeleteWarehouse">삭제</button>
                                </div>
                            </form>

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

<!-- 다음 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    $(document).ready(function() {
        // 1. 더미 데이터 정의 (소재지)
        const dummyLocationCategories = [
            { "id": "SL", "name": "서울특별시" },
            { "id": "GG", "name": "경기도" },
            { "id": "IC", "name": "인천광역시" },
            { "id": "GW", "name": "강원특별자치도" },
            { "id": "CB", "name": "충청북도" },
            { "id": "CN", "name": "충청남도" },
            { "id": "JB", "name": "전라북도" },
            { "id": "JN", "name": "전라남도" },
            { "id": "GB", "name": "경상북도" },
            { "id": "GN", "name": "경상남도" },
            { "id": "JJ", "name": "제주특별자치도" },
            { "id": "DJ", "name": "대전광역시" },
            { "id": "DG", "name": "대구광역시" },
            { "id": "GJ", "name": "광주광역시" },
            { "id": "BS", "name": "부산광역시" },
            { "id": "US", "name": "울산광역시" },
        ];

        // 2. 원본 필터 영역에 소재지 옵션 채우기
        var $midSelect = $('#myCustomFilters #LocationCategories');
        $.each(dummyLocationCategories, function(index, item) {
            $midSelect.append($('<option>', {
                value: item.id,
                text: item.name
            }));
        });

        // 5. DataTable 초기화 (dom 옵션에 사용자 정의 영역 포함)
        var table = $('#datatable').DataTable({
            autoWidth: false,
            columnDefs: [
                { width: '95px', targets: -1 },  // Actions 열 너비
                { targets: [0, 1, 2, 3, 4, 5, 8], className: 'text-center' } // JS 속성으로 가운데 정렬
            ],
            order: [[0, 'asc']],
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
            initComplete: function(settings, json) {
                fixLengthDropdownStyle();
            },
            drawCallback: function(settings) {
            }
        });

        function fixLengthDropdownStyle() {
            const $length = $('.dataTables_length');
            const $select = $length.find('select');
            const selectedValue = $select.val();

            const $filter = $('#datatable_filter')
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
        // 복제 후 삽입 시, ID 제거 필수!
        $clone.find('#LocationCategories').attr('id', 'LocationCategories_clone');

        $clone.find('#btnWarehouseAdd').attr('id', 'btnWarehouseAdd_clone');
        $clone.find('#btnWarehouseEdit').attr('id', 'btnWarehouseEdit_clone');
        $clone.find('#btnWarehouseDelete').attr('id', 'btnWarehouseDelete_clone');
        $clone.find('#btnWarehouseAdd, #btnWarehouseEdit, #btnWarehouseDelete').remove();
        $('div.myFilterArea').html($clone.html());

        // select 태그 감싸는 구조 적용
        $('.dataTables_length select').each(function() {
            const $select = $(this);
            if (!$select.parent().hasClass('select-position')) {
                $select.wrap('<div class="col-lg-2"><div class="select-style-1"><div class="select-position"></div></div></div>');
            }
        });

        // 6-1. 이벤트 위임 방식으로 변경된 ID에 새롭게 바인딩 (body를 통해 실제 필터에 작동하게!)
        $('body').on('change', '#LocationCategories_clone', function() {
            $('#LocationSubCategories_clone').val('');
            table.draw();
        });

        $('body').on('click', '#resetFilterBtn', function () {
            const table = $('#datatable').DataTable();

            table.search('').columns().search('');

            $('#LocationCategories_clone, #warehouseNameInput_clone').val('');

            table.order([[0, 'asc']]);
            table.draw();
        });

        // 7. 필터 이벤트: 드롭다운 변경 시 테이블 필터링
        $('#LocationCategories, #warehouseNameInput').on('change keyup', function() {
            table.draw();
        });

        // 7-1. (7번 함수에서 각각이 변경될 때마다) 필터링 함수도 변경된 ID값을 기준으로 수정
        $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
            const selectedLocation = $('#LocationCategories_clone').val();
            const categoryLocation = data[0]; // 창고코드를 기준으로

            // 일부 포함에도 검색
            if (selectedLocation && !categoryLocation.includes(selectedLocation)) {
                return false;
            }

            return true;
        });

        // 9. Edit/Delete 버튼 이벤트
        // 등록 버튼 클릭 시
        // 전역 변수: 창고명 중복 체크 상태 (초기값 false)
        let isWarehouseNameChecked = false;

        // 1. 등록 모달 열기
        $("#btnWarehouseAdd_clone").on("click", function () {
            $("#warehouseAddModal").modal("show");
        });

        // 2. 창고명 변경 시 중복 체크 초기화
        $("#warehouseName").on("input", function () {
            isWarehouseNameChecked = false;
        });

        // 3. 중복 확인 버튼 (SSR과 연계된 fetch 방식)
        $("#checkDuplicate").on("click", function () {
            const name = $("#warehouseName").val().trim();
            if (!name) {
                alert("창고명을 입력하세요.");
                return;
            }
            const reg = /^[A-Za-z0-9가-힣]{1,10}$/;
            if (!reg.test(name)) {
                alert("한글/영어/숫자만 가능하며 최대 10글자입니다.");
                return;
            }

            const contextPath = "${pageContext.request.contextPath}";
            fetch(contextPath + "/qh/warehouse/check?warehouseName=" + encodeURIComponent(name))
                .then(function (res) { return res.text(); })  // ← 여기!!
                .then(function (text) {
                    console.log("서버 응답:", text);
                    const isDup = (text === 'true');  // 문자열 비교
                    if (isDup) {
                        alert("이미 존재하는 창고명입니다.");
                        isWarehouseNameChecked = false;
                    } else {
                        alert("사용 가능한 창고명입니다.");
                        isWarehouseNameChecked = true;
                    }
                })
                .catch(function () {
                    alert("중복 확인 중 오류가 발생했습니다.");
                });
        });

        // 4. 다음 주소 API 연동
        $("#search-btn").on("click", function () {
            new daum.Postcode({
                oncomplete: function (data) {
                    $("#zonecode_disp").val(data.zonecode);
                    $("#roadAddress_disp").val(data.roadAddress);
                }
            }).open();
        });

        // 5. 상세 주소 입력 시 숨겨진 필드 업데이트
        $("#detailAddress_disp").on("change", function () {
            $("#detailAddress_hidden").val($(this).val());
        });

        // 6. 폼 제출 전 유효성 검사 및 address 합치기
        $("#warehouseRegisterForm").on("submit", function () {
            const name = $("#warehouseName").val().trim();
            const zonecode = $("#zonecode_disp").val().trim();
            const roadAddress = $("#roadAddress_disp").val().trim();
            const detailAddress = $("#detailAddress_disp").val().trim();
            const capacity = $("#capacity").val().trim();
            const regName = /^[A-Za-z0-9가-힣]{1,10}$/;
            const regCap = /^[0-9]+$/;

            if (!name || !zonecode || !roadAddress || !detailAddress || !capacity) {
                alert("필수 항목을 모두 입력해주세요.");
                return false;
            }

            if (!regName.test(name)) {
                alert("창고명은 한글/영어/숫자 조합이며 최대 10글자입니다.");
                return false;
            }

            if (!regCap.test(capacity)) {
                alert("수용한도는 숫자만 입력 가능합니다.");
                return false;
            }

            if (!isWarehouseNameChecked) {
                alert("창고명 중복확인을 해주세요.");
                return false;
            }

            // address 하나로 합쳐서 hidden 필드 추가
            const fullAddress = zonecode + " " + roadAddress + " " + detailAddress;
            $("<input>").attr({
                type: "hidden",
                name: "address",
                value: fullAddress
            }).appendTo(this);
        });

        let isModifyNameChecked = false;

// 1. 수정 버튼 클릭 시 - 모달 열기
        $('#datatable tbody').on('click', '.btn-edit', function (e) {
            e.preventDefault();

            const $tr = $(this).closest('tr');
            const rowData = table.row($tr).data();

            const code = rowData[0];        // 창고코드
            const name = rowData[1];        // 창고명
            const memberCode = rowData[7];  // 숨겨진 td: 담당자코드

            // 모달 input 세팅
            $('#modifyWarehouseCode').val(code);
            $('#modifyWarehouseName').val(name);

            const $select = $('#modifyWarehouseMember');
            if ($select.find("option[value='" + memberCode + "']").length > 0) {
                $select.val(memberCode);
            } else {
                $select.val("null"); // 없는 경우 기본값
            }

            // 중복확인 상태 초기화
            isModifyNameChecked = false;

            // 모달 열기
            $('#warehouseEditModal').modal('show');
        });

// 2. 창고명 입력 시 중복확인 초기화
        $("#modifyWarehouseName").on("input", function () {
            isModifyNameChecked = false;
        });

// 3. 중복 확인 버튼 클릭 시
        $("#modifyCheckDuplicateWarehouse").on("click", function (e) {
            e.preventDefault(); // 폼 제출 막기

            const name = $("#modifyWarehouseName").val().trim();
            const code = $("#modifyWarehouseCode").val().trim();

            if (!name) {
                alert("창고명을 입력하세요.");
                return;
            }

            const reg = /^[A-Za-z0-9가-힣]{1,10}$/;
            if (!reg.test(name)) {
                alert("한글/영어/숫자만 가능하며 최대 10글자입니다.");
                return;
            }

            const contextPath = "${pageContext.request.contextPath}";
            fetch(contextPath + "/qh/warehouse/check?warehouseName=" + encodeURIComponent(name) + "&warehouseCode=" + encodeURIComponent(code))
                .then((res) => res.text())
                .then((text) => {
                    const isDup = (text === "true");
                    if (isDup) {
                        alert("이미 존재하는 창고명입니다.");
                        isModifyNameChecked = false;
                    } else {
                        alert("사용 가능한 창고명입니다.");
                        isModifyNameChecked = true;
                    }
                })
                .catch(() => {
                    alert("중복 확인 중 오류가 발생했습니다.");
                });
        });

// 4. 최종 제출 시 유효성검사 + 중복확인 여부 체크
        $("#modifyWarehouseForm").on("submit", function (e) {
            const name = $("#modifyWarehouseName").val().trim();
            const reg = /^[A-Za-z0-9가-힣]{1,10}$/;

            if (!name) {
                alert("창고명을 입력하세요.");
                e.preventDefault();
                return;
            }

            if (!reg.test(name)) {
                alert("창고명은 한글/영어/숫자 조합이며 최대 10글자입니다.");
                e.preventDefault();
                return;
            }

            if (!isModifyNameChecked) {
                alert("창고명 중복확인을 해주세요.");
                e.preventDefault();
                return;
            }
        });

        // 삭제 버튼 클릭 시
        $('#datatable tbody').on('click', '.btn-delete', function (e) {
            e.preventDefault();

            const rowData = table.row($(this).closest('tr')).data();

            const warehouseCode = rowData[0];
            const warehouseName = rowData[1];
            const memberName = rowData[4];
            const statusRaw = rowData[6] || "";
            const memberCode = rowData[7];

            const cleanedStatus = statusRaw.replace(/\s/g, "");
            const isDeletable = cleanedStatus === "삭제가능";
            const wm = memberName ? memberName : "담당자없음";

            const badgeClass = isDeletable ? "bg-success" : "bg-danger";
            const badge = '<span class="badge ' + badgeClass + '">' + statusRaw.trim() + '</span>';

            let content = "";

            if (isDeletable) {
                content += '<h5>선택한 창고를 정말 삭제하시겠습니까?</h5>';
            } else {
                content += '<h5>선택한 창고는 진행 중인 업무로 인해 삭제할 수 없습니다.</h5>';
            }

            content += '<p>' + warehouseName + ' (' + memberCode + ' | ' + wm + ')</p>';
            content += badge;

            $('#deleteWarehouseCode').val(warehouseCode);
            $('#deleteContentOk, #deleteContentNo').hide().empty();

            if (isDeletable) {
                $('#deleteContentOk').html(content).show();
                $('#confirmDeleteWarehouse').show();
            } else {
                $('#deleteContentNo').html(content).show();
                $('#confirmDeleteWarehouse').hide();
            }

            $('#warehouseDeleteModal').modal('show');
        });

        // 삭제 모달의 실제 '삭제' 버튼 클릭 이벤트
        $('#confirmDeleteWarehouse').on('click', function() {
            if ($(this).is(':hidden')) {
                alert("삭제할 수 없는 창고입니다.");
                return;
            }
            alert("창고가 성공적으로 삭제되었습니다.");
            $('#warehouseDeleteModal').modal('hide');

            $('#warehouseDeleteForm').submit();
        });

    });
    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>

</script>
</body>
</html>
