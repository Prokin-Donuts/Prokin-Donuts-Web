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
    <section class="section">
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="title">
                            <h2>가맹점 관리</h2>
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
                        <h6 class="mb-10">가맹점 위치</h6>
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
                        <h6 class="mb-10">가맹점 목록</h6>
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
                                    <button class="main-btn warning-btn-outline btn-hover btn-sm btn-xs" id="btnFranchiseAdd">등록</button>
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
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>가맹점코드</th>
                                    <th>가맹점명</th>
                                    <th>소재지</th>
                                    <th>점주</th>
                                    <th>점주 이메일</th>
                                    <th>설정</th> <!-- 수정/삭제 열 -->
                                </tr>
                                </thead>

                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal HTML Start -->

            <!-- 가맹점 등록 모달 (단 하나만 선언) -->
            <div class="modal fade" id="franchiseAddModal" tabindex="-1"
                 aria-labelledby="franchiseAddModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- 모달 헤더 -->
                        <div class="modal-header">
                            <h3 class="modal-title" id="franchiseAddModalLabel">가맹점 등록</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <!-- 모달 바디 -->
                        <div class="modal-body">
                            <p class="text-danger fw-normal mb-3">(*)는 필수 입력 항목입니다.</p>
                            <form id="registerForm" action="#" method="post">

                                <!-- 가맹점명 (중복확인 버튼 포함) -->
                                <div class="mb-3">
                                    <label class="form-label" for="registerFranchiseName" >가맹점명 (*)</label>
                                    <div class="d-flex gap-2">
                                        <input type="text" class="form-control" id="registerFranchiseName" name="registerFranchiseName" placeholder="가맹점명을 입력하세요" />
                                        <button type="button" class="main-btn primary-btn btn-hover btn-smaller" id="checkDuplicate">중복체크</button>
                                    </div>
                                </div>

                                <!-- 소재지 (우편번호 및 상세주소) -->
                                <div class="mb-3">
                                    <label class="form-label">소재지 (*)</label>
                                    <div class="d-flex gap-2">
                                        <input type="text" class="form-control" id="franchiseZonecode_disp" placeholder="우편번호" disabled />
                                        <button type="button" class="main-btn primary-btn btn-hover btn-smaller" id="franchiseSearchBtn">우편번호</button>
                                    </div>
                                    <input type="text" class="form-control mt-1" id="franchiseRoadAddress_disp" placeholder="도로명 주소" disabled />
                                    <input type="text" class="form-control mt-1" id="franchiseDetailAddress_disp" placeholder="상세주소를 입력해주세요." />
                                    <!-- 숨긴 필드 (서버 전송용) -->
                                    <input type="hidden" name="zonecode" id="franchiseZonecode_hidden" />
                                    <input type="hidden" name="roadAddress" id="franchiseRoadAddress_hidden" />
                                    <input type="hidden" name="detailAddress" id="franchiseDetailAddress_hidden" />
                                </div>
                                <!-- 점주 드롭박스 -->
                                <div class="mb-3">
                                    <label class="form-label">점주</label>
                                    <select class="form-select" id="registerFranchiseManager" name="registerFranchiseManager">
                                        <option value="">점주 선택</option>
                                        <!-- 점주 옵션은 AJAX 등으로 채움 -->
                                    </select>
                                </div>
                                <!-- 등록 버튼 -->
                                <div class="text-center w-100 mt-1 mb-3">
                                    <button type="submit" class="main-btn primary-btn btn-hover text-center" id="franchiseRegisterBtn">등록</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 가맹점 수정 모달 -->
            <div class="modal fade" id="franchiseEditModal"
                 tabindex="-1" aria-labelledby="franchiseEditModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <!-- 모달 헤더 -->
                        <div class="modal-header">
                            <h3 class="modal-title" id="franchiseEditModalLabel">가맹점 정보 수정</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <!-- 모달 바디 -->
                        <div class="modal-body">
                            <p class="text-danger fw-normal mb-3">(*)는 필수 입력 항목입니다.</p>
                            <form id="modifyFranchiseForm" action="#" method="post">
                                <!-- 수정할 가맹점 구분용 숨은 필드 -->
                                <input type="hidden" id="modifyFranchiseId" name="modifyFranchiseId">

                                <!-- 가맹점명 (중복 체크 버튼 포함) -->
                                <div class="mb-3">
                                    <label class="form-label" for="modifyFranchiseName">가맹점명 (*)</label>
                                    <div class="d-flex gap-2">
                                        <input type="text" class="form-control" id="modifyFranchiseName" name="modifyFranchiseName" placeholder="가맹점명을 입력하세요">
                                        <button type="button" class="main-btn primary-btn btn-hover btn-smaller" id="modifyCheckDuplicate">중복체크</button>
                                    </div>
                                </div>

                                <!-- 점주 드롭박스 -->
                                <div class="mb-3">
                                    <label class="form-label" for="modifyFranchiseManager">점주</label>
                                    <select class="form-select" id="modifyFranchiseManager" name="modifyFranchiseManager">
                                        <option value="">점주 선택</option>
                                        <!-- 점주 옵션은 AJAX(더미 데이터)로 채워질 예정 -->
                                    </select>
                                </div>

                                <!-- 수정 버튼 -->
                                <div class="text-end">
                                    <button type="submit" class="main-btn primary-btn btn-hover text-center" id="franchiseModifyBtn">수정</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 삭제 모달 -->
            <div class="modal fade" id="franchiseDeleteModal" tabindex="-1" aria-labelledby="franchiseDeleteModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h3 class="modal-title" id="franchiseDeleteModalLabel">가맹점 삭제</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <div class="modal-body">

                            <!-- 삭제 가능 시 -->
                            <div id="franchiseDeleteContentOk" style="display: none;">
                                <h5>선택한 가맹점을 정말 삭제하시겠습니까?</h5><br>
                                <ul id="deleteFranchiseListOk" class="list-group mb-3"></ul>
                            </div>

                            <!-- 삭제 불가 시 -->
                            <div id="franchiseDeleteContentNo" style="display: none;">
                                <h5>선택한 가맹점은 진행 중인 업무로 인해 삭제할 수 없습니다.</h5><br>
                                <ul id="deleteFranchiseListNo" class="list-group mb-3"></ul>
                            </div>

                            <div class="d-flex justify-content-end gap-2">
                                <button type="button" class="main-btn primary-btn btn-hover text-center" id="confirmDeleteFranchise">삭제</button>
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

<!-- 다음 우편번호 API -->
<script src="<c:url value='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'/>"></script>

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
                { targets: [0, 1, 2, 3, 4, 5], className: 'text-center' } // JS 속성으로 가운데 정렬
            ],
            order: [[0, 'asc']],
            ajax: function(data, callback, settings) {
                const dummyData = [
                    {
                        "franchiseCode": "GGF1",
                        "franchiseName": "수원영통점",
                        "franchiseLocation": "경기도 수원시 영통구 덕영대로 156",
                        "mamberCode": "FM1",
                        "name": "박열정",
                        "email": "fire123@gmail.com"
                    },
                    {
                        "franchiseCode": "DJF1",
                        "franchiseName": "대전둔산점",
                        "franchiseLocation": "대전광역시 서구 둔산로 121",
                        "mamberCode": "FM2",
                        "name": "조아현",
                        "email": "ahyun_fm2@gmail.com"
                    },
                    {
                        "franchiseCode": "SLF1",
                        "franchiseName": "서울강남1호점",
                        "franchiseLocation": "서울특별시 강남구 테헤란로 152",
                        "mamberCode" : null,
                        "name": null,
                        "email": null
                    },
                    {
                        "franchiseCode": "ICF1",
                        "franchiseName": "인천부평역점",
                        "franchiseLocation": "인천광역시 부평구 부평대로 45",
                        "mamberCode" : null,
                        "name": null,
                        "email": null
                    },
                    {
                        "franchiseCode": "GWF1",
                        "franchiseName": "강릉경포대점",
                        "franchiseLocation": "강원특별자치도 강릉시 경포로 87",
                        "mamberCode" : null,
                        "name": null,
                        "email": null
                    },
                    {
                        "franchiseCode": "CBF1",
                        "franchiseName": "청주성안길점",
                        "franchiseLocation": "충청북도 청주시 상당구 중앙로 24",
                        "mamberCode" : null,
                        "name": null,
                        "email": null
                    },
                    {
                        "franchiseCode": "JBF1",
                        "franchiseName": "전주한옥마을점",
                        "franchiseLocation": "전라북도 전주시 완산구 은행로 12",
                        "mamberCode" : null,
                        "name": null,
                        "email": null
                    }
                ];
                Promise.resolve().then(() => {
                    callback({ data: dummyData });
                });
            },
            columns: [
                { data: 'franchiseCode', title: '가맹점코드' },
                { data: 'franchiseName', title: '가맹점명' },
                { data: 'franchiseLocation', title: '소재지' },
                { data: 'name', title: '점주' },
                { data: 'email', title: '점주 이메일' },
                { // Edit/Delete 버튼
                    data: null,
                    orderable: false,
                    searchable: false,
                    render: function(data, type, row, meta) {
                        return `
                  <div class="btu-group-2">
                    <button class="btn btn-edit text-primary-2">
                      <i class="lni lni-pencil"></i>
                    </button>
                    <button class="btn btn-delete text-danger">
                      <i class="lni lni-trash-can"></i>
                    </button>
                  </div>
                `;
                    },
                    title: '설정'
                }
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

        $clone.find('#btnFranchiseAdd').attr('id', 'btnFranchiseAdd_clone');
        $clone.find('#btnFranchiseEdit').attr('id', 'btnFranchiseEdit_clone');
        $clone.find('#btnFranchiseDelete').attr('id', 'btnFranchiseDelete_clone');
        $clone.find('#btnFranchiseAdd, #btnFranchiseEdit, #btnFranchiseDelete').remove();
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

            $('#LocationCategories_clone, #franchiseNameInput_clone').val('');

            table.order([[0, 'asc']]);
            table.draw();
        });

        // 7. 필터 이벤트: 드롭다운 변경 시 테이블 필터링
        $('#LocationCategories, #franchiseNameInput').on('change keyup', function() {
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

        // 9. Edit/Delete 버튼 이벤트 (제품명 대신 productName 사용)
        // 등록 버튼 클릭 시
        // 전역 변수: 가맹점명 중복 체크 상태 (초기값 false)
        var isFranchiseNameChecked = false;

        // 모달 열기 버튼 이벤트
        $("#btnFranchiseAdd_clone").on("click", function() {
            $("#franchiseAddModal").modal("show");
        });

        // 가맹점명 입력 변경 시 중복 체크 상태 초기화
        $("#registerFranchiseName").on("input", function() {
            isFranchiseNameChecked = false;
        });

        // 가맹점명 중복 체크 버튼 이벤트 (더미 AJAX 처리)
        $("#checkDuplicate").on("click", function() {
            var fname = $("#registerFranchiseName").val().trim();
            if (!fname) {
                alert("가맹점명을 입력하세요.");
                return;
            }
            // 정규표현식: 한글, 영어, 숫자만 허용, 최대 10글자
            var regName = /^[A-Za-z0-9가-힣]{1,10}$/;
            if (!regName.test(fname)) {
                alert("가맹점명은 한글, 영어, 숫자만 가능하며 최대 10글자까지 입력할 수 있습니다.");
                return;
            }
            // 여기서는 중복 없음으로 가정 (실제 AJAX 호출 가능)
            alert("사용 가능한 가맹점명입니다.");
            isFranchiseNameChecked = true;
        });

        // Daum 우편번호 API (소재지)
        $("#franchiseSearchBtn").on("click", function() {
            new daum.Postcode({
                oncomplete: function(data) {
                    $("#franchiseZonecode_disp").val(data.zonecode);
                    $("#franchiseRoadAddress_disp").val(data.roadAddress);
                    $("#franchiseZonecode_hidden").val(data.zonecode);
                    $("#franchiseRoadAddress_hidden").val(data.roadAddress);
                }
            }).open();
        });

        // 상세주소 입력이 변경될 때 hidden 업데이트
        $("#franchiseDetailAddress_disp").on("change", function() {
            $("#franchiseDetailAddress_hidden").val($(this).val());
        });

        // 점주 드롭박스: 더미 데이터 채우기
        function loadFranchiseManagers() {
            var dummyManagers = [
                { id: "FM1", name: "박열정" },
                { id: "FM2", name: "조아현" },
                { id: "FM3", name: "백승우" },
                { id: "FM4", name: "윤가영" }
            ];
            var $select = $("#registerFranchiseManager");
            $select.empty().append('<option value="">점주 선택</option>');
            $.each(dummyManagers, function(i, mgr) {
                $select.append(`<option value="${mgr.id}">${mgr.id} | ${mgr.name}</option>`);
            });
        }
        $("#franchiseAddModal").on("show.bs.modal", function() {
            loadFranchiseManagers();
        });

        // 폼 제출 시 유효성 검사
        $("#registerForm").on("submit", function(e) {
            e.preventDefault();
            var fname = $("#registerFranchiseName").val().trim();
            var zonecode = $("#franchiseZonecode_disp").val().trim();
            var roadAddr = $("#franchiseRoadAddress_disp").val().trim();
            var detailAddr = $("#franchiseDetailAddress_disp").val().trim();

            if (!fname || !zonecode || !roadAddr || !detailAddr) {
                alert("필수 입력 항목이 비어있습니다. 모두 입력해주세요.");
                return;
            }
            // 가맹점명 정규식 검사
            var regName = /^[A-Za-z0-9가-힣]{1,10}$/;
            if (!regName.test(fname)) {
                alert("가맹점명은 한글, 영어, 숫자만 가능하며 최대 10글자까지 입력할 수 있습니다.");
                return;
            }
            if (!isFranchiseNameChecked) {
                alert("가맹점명 중복체크를 해주세요.");
                return;
            }
            // 모든 검증 통과 시 처리
            alert("가맹점이 성공적으로 등록되었습니다.");
            $("#franchiseAddModal").modal("hide");
            $(this)[0].reset();
            isFranchiseNameChecked = false;
        });

        // 수정 버튼 클릭 시
        $('#datatable tbody').on('click', '.btn-edit', function(e) {
            e.preventDefault();

            // DataTables 인스턴스 얻기
            var table = $('#datatable').DataTable();
            // 클릭한 버튼이 속한 <tr> 요소
            var $row = $(this).closest('tr');
            // 해당 행의 데이터(예: 대전둔산점 등)
            var rowData = table.row($row).data();

            // 모달의 입력 필드에 해당 행의 데이터를 미리 채워 넣기
            if (rowData) {
                // 가맹점명 입력란에 rowData의 franchiseName 값을 기본값으로 설정
                $("#modifyFranchiseName").val(rowData.franchiseName);
                // 점주 드롭박스에 선택할 값으로 rowData의 memberCode (혹은 mamberCode)가 있으면 할당
                $("#modifyFranchiseManager").val(rowData.mamberCode);
            }

            // 전역 변수: 수정 모달에서 가맹점명 중복 체크 상태 (초기값 false)
            // 반드시 전역변수가 이벤트 재등록보다 선행되어야 함.
            var isModifyFranchiseNameChecked = false;

            // 기존의 이벤트 핸들러 제거 후 재등록 (중복 방지)
            $("#modifyFranchiseName").off("input").off("input").on("input", function () {
                isModifyFranchiseNameChecked = false;
            });

            // 가맹점명 입력란 변경 시: 중복 체크 상태 초기화 (즉, 수정 후에는 재확인 필요)
            $("#modifyFranchiseName").off("input").on("input", function () {
                isModifyFranchiseNameChecked = false;
            });

            // 중복 체크 버튼 클릭 이벤트
            $("#modifyCheckDuplicate").off("click").on("click", function () {
                var fname = $("#modifyFranchiseName").val().trim();
                if (!fname) {
                    alert("가맹점명을 입력하세요.");
                    return;
                }
                // 정규표현식: 한글, 영어, 숫자만 허용하며 최대 10글자
                var regName = /^[A-Za-z0-9가-힣]{1,10}$/;
                if (!regName.test(fname)) {
                    alert("가맹점명은 한글, 영어, 숫자만 가능하며 최대 10글자까지 입력할 수 있습니다.");
                    return;
                }
                // (실제 AJAX 중복체크 로직 호출 가능)
                // 여기서는 항상 중복 없음으로 가정합니다.
                alert("사용 가능한 가맹점명입니다.");
                isModifyFranchiseNameChecked = true;
            });

            // 점주 드롭박스: 더미 데이터로 채우기 (실제 AJAX 호출 시 수정 가능)
            function loadModifyFranchiseManagers() {
                var dummyManagers = [
                    { id: "FM1", name: "박열정" },
                    { id: "FM2", name: "조아현" },
                    { id: "FM3", name: "백승우" },
                    { id: "FM4", name: "윤가영" }
                ];
                var $select = $("#modifyFranchiseManager");
                $select.empty().append('<option value="">점주 선택</option>');
                $.each(dummyManagers, function (i, mgr) {
                    $select.append(`<option value="${mgr.id}">${mgr.id} | ${mgr.name}</option>`);
                });
            }

            // 모달이 열릴 때마다 점주 목록을 로드
            $("#franchiseEditModal").off("show.bs.modal").on("show.bs.modal", function () {
                loadModifyFranchiseManagers();
                // 만약 rowData에 점주 선택값(memberCode)이 있다면, 선택값 지정
                if (rowData && rowData.mamberCode) {
                    $("#modifyFranchiseManager").val(rowData.mamberCode);
                }
            });

            // 수정 폼 제출 이벤트
            $("#modifyFranchiseForm").off("submit").on("submit", function (e) {
                e.preventDefault();
                var fname = $("#modifyFranchiseName").val().trim();

                // 필수 항목 검증
                if (!fname) {
                    alert("필수 입력 항목이 비어있습니다. 모두 입력해주세요.");
                    return;
                }
                // 가맹점명 정규식 검사
                var regName = /^[A-Za-z0-9가-힣]{1,10}$/;
                if (!regName.test(fname)) {
                    alert("가맹점명은 한글, 영어, 숫자만 가능하며 최대 10글자까지 입력할 수 있습니다.");
                    return;
                }
                // 중복 체크 여부 검사
                if (!isModifyFranchiseNameChecked) {
                    alert("가맹점명 중복체크를 해주세요.");
                    return;
                }

                // 모든 검증 통과 시 수정 성공 처리 (실제 서버 전송 로직 추가 가능)
                alert("가맹점 정보가 성공적으로 수정되었습니다.");
                $("#franchiseEditModal").modal("hide");
                // 폼 리셋 및 중복 체크 상태 초기화
                $(this)[0].reset();
                isModifyFranchiseNameChecked = false;
            });

            $("#franchiseEditModal").modal("show");

        });

        // 삭제 버튼 클릭
        $('#datatable tbody').on('click', '.btn-delete', function(e) {
            e.preventDefault();
            const $row = $(this).closest('tr');
            const rowData = table.row($row).data(); // DataTable 인스턴스 필요

            // 상태 판별 (예시: 코드 기준)
            let dummyResponse;
            switch (rowData.franchiseCode) {
                case "DJF1":
                    dummyResponse = { canDelete: false, reason: "발주가 진행중입니다.", status: "발주진행" };
                    break;
                case "GGF1":
                    dummyResponse = { canDelete: false, reason: "출고가 진행중입니다.", status: "출고진행" };
                    break;
                default:
                    dummyResponse = { canDelete: true, status: "삭제가능" };
            }

            const statusBadge = `<span class="badge bg-secondary">${dummyResponse.status}</span>`;
            const managerInfo = rowData.mamberCode ? `${rowData.mamberCode} | ${rowData.name}` : "담당자없음";

            if (dummyResponse.canDelete) {
                $('#franchiseDeleteContentOk').show();
                $('#franchiseDeleteContentNo').hide();
                $('#deleteFranchiseListOk').html(`
              <li class="list-group-item d-flex justify-content-between align-items-center">
                ${rowData.franchiseName} (${managerInfo}) ${statusBadge}
              </li>
            `);
                $('#confirmDeleteFranchise').show();
            } else {
                $('#franchiseDeleteContentOk').hide();
                $('#franchiseDeleteContentNo').show();
                $('#deleteFranchiseListNo').html(`
              <li class="list-group-item d-flex justify-content-between align-items-center">
                ${rowData.franchiseName} (${managerInfo}) ${statusBadge}
              </li>
            `);
                $('#confirmDeleteFranchise').hide();
            }

            $('#franchiseDeleteModal').modal('show');
        });

        // 삭제 확정 클릭
        $('#confirmDeleteFranchise').on('click', function() {
            if ($(this).is(':hidden')) {
                alert("삭제할 수 없는 가맹점입니다.");
                return;
            }

            alert("가맹점이 성공적으로 삭제되었습니다.");
            $('#franchiseDeleteModal').modal('hide');
            // TODO: table.row($row).remove().draw();
        });

    });
    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>

</script>
</body>
</html>
