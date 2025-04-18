<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="/resources/images/logo/favicon_logo.png" type="image/png" />
    <title>Prokin Donuts</title>

    <!-- ========== All CSS files linkup ========= -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" href="/resources/css/lineicons.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/resources/css/materialdesignicons.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/resources/css/fullcalendar.css" />
    <link rel="stylesheet" href="/resources/css/main.css" />
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
                            <h2>제품관리</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ========== title-wrapper end ========== -->

            <!-- 위 : 카테고리 / 아래 : 제품 -->
            <!-- 카테고리 목록 테이블 시작 -->

            <div class="row">
                <!-- Start col -->
                <div class="col-lg-12">
                    <!-- Start card -->
                    <div class="card-style mb-30">
                        <h6 class="mb-10">카테고리 목록</h6>
                        <p class="text-sm mb-20"></p>

                        <!-- 원하는 필터(중분류, 소분류) 설정 -->
                        <div class="text-sm mb-20" id="myCustomFilters_mainCategoryUp" style="display: none;">

                            <div class="d-flex flex-wrap gap-2">
                                <!-- 중분류 -->
                                <div >
                                    <div class="select-style-1">
                                        <div class="select-position">
                                            <select id="mainCategoryUp">
                                                <option value="">중분류</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- 필터 초기화 -->
                                <div class="mb-20">
                                    <button class="main-btn warning-btn-outline square-btn btn-hover btn-sm btn-xs" id="resetFilterBtn_mainCategoryUp" style="height:auto; min-height:auto;">
                                        필터 초기화
                                    </button>
                                </div>

                                <!-- 오른쪽: 등록/수정/삭제 -->
                                <div class="btu-group-1 ms-auto gap-2 mb-20">
                                    <button class="main-btn warning-btn-outline square-btn btn-hover btn-sm btn-xs" id="btnProductAdd_mainCategoryUp">등록</button>
                                    <button class="main-btn warning-btn-outline square-btn btn-hover btn-sm btn-xs" id="btnProductDelete_mainCategoryUp">삭제</button>
                                </div>
                            </div>

                        </div>

                        <div class="table-wrapper table-responsive p-0">

                            <!-- Start table -->
                            <table id="datatable_mainCategoryUp" class="table striped-table w-100" style="width:100%">

                                <!-- colgroup를 통해 열 폭을 강제 지정 -->
                                <colgroup>
                                    <col style="width: 5%;" />
                                    <col style="width: 25%;" />
                                    <col style="width: 25%" />
                                    <col style="width: 30%;" />
                                    <col style="width: 15%;" />
                                </colgroup>

                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="select-all_mainCategoryUp"></th> <!-- 체크박스 열 -->
                                    <th>카테고리코드</th>
                                    <th>중분류명</th>
                                    <th>소분류명</th>
                                    <th></th>
                                </tr>
                                </thead>

                                <tbody class="category-tbody">
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!--  위 : 카테고리 / 아래 : 제품 -->
            <!-- 제품 목록 테이블 시작 -->

            <div class="row">
                <!-- Start col -->
                <div class="col-lg-12">
                    <!-- Start card -->
                    <div class="card-style mb-30">
                        <h6 class="mb-10">제품 목록</h6>
                        <p class="text-sm mb-20"></p>

                            <!-- 원하는 필터(중분류, 소분류) 설정 -->
                        <div id="myCustomFilters" style="display: none;">

                            <div class="d-flex flex-wrap gap-2">
                                <!-- 중분류 -->
                                <div >
                                    <div class="select-style-1">
                                        <div class="select-position">
                                            <select id="midCategory">
                                                <option value="">중분류</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- 소분류 -->
                                <div >
                                    <div class="select-style-1">
                                        <div class="select-position">
                                            <select id="subCategory">
                                                <option value="">소분류</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <!-- 필터 초기화 -->
                                <div class="mb-20">
                                    <button class="main-btn warning-btn-outline square-btn btn-hover btn-sm btn-xs" id="resetFilterBtn" style="height:auto; min-height:auto;">
                                        필터 초기화
                                    </button>
                                </div>

                                <!-- 오른쪽: 등록/수정/삭제 -->
                                <div class="btu-group-1 ms-auto gap-2 mb-20">
                                    <button class="main-btn warning-btn-outline square-btn btn-hover btn-sm btn-xs" id="btnProductAdd">등록</button>
                                    <button class="main-btn warning-btn-outline square-btn btn-hover btn-sm btn-xs" id="btnProductEdit">수정</button>
                                    <button class="main-btn warning-btn-outline square-btn btn-hover btn-sm btn-xs" id="btnProductDelete">삭제</button>
                                </div>
                            </div>

                        </div>

                        <div class="table-wrapper table-responsive p-0">
                            <!-- Start table -->
                            <table id="datatable" class="table striped-table w-100" style="width:100%">

                                <!-- colgroup를 통해 열 폭을 강제 지정 -->
                                <colgroup>
                                    <col style="width: 5%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 15%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 20%;" />
                                    <col style="width: 15%;" />
                                </colgroup>

                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="select-all"></th> <!-- 체크박스 열 -->
                                    <th>제품코드</th>
                                    <th>중분류</th>
                                    <th>소분류</th>
                                    <th>보관타입</th>
                                    <th>제품명</th>
                                    <th>제공단가</th>
                                </tr>
                                </thead>

                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>


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

<!-- 모달 시작 -->

<!-- 카테고리 등록 모달 -->
<div class="modal fade" id="categoryAddModal" tabindex="-1" aria-labelledby="categoryAddModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h3 class="modal-title" id="categoryAddModalLabel">카테고리 등록</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- 모달 바디 -->
            <div class="modal-body">
                <p class="text-danger fw-normal mb-3">(*)는 필수 입력 항목입니다.</p>

                <form id="registerCategoryForm">

                    <!-- 카테고리 코드 -->
                    <div class="mb-3">
                        <label class="form-label">
                            카테고리코드 (*)
                            <i
                                    class="mdi mdi-help-circle text-primary"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="right"
                                    data-bs-html="true"
                                    data-bs-custom-class="wide-tooltip"
                                    title="중분류(1자) + 소분류(2자) = <b>총 3자리 대문자 코드</b><br>예: 도넛(D) + 로우슈거(LS) → DLS<br><i>※ 중복 시 소분류 약어를 조정해 주세요.</i>"
                                    style="cursor: pointer;">
                            </i>
                        </label>
                        <input
                                type="text"
                                class="form-control"
                                id="registerCategoryId"
                                placeholder="예: DPN"
                                maxlength="3"
                        />
                    </div>

                    <!-- 중분류명 -->
                    <div class="mb-3">
                        <label class="form-label">
                            중분류명 (*)
                        </label>
                        <input
                                type="text"
                                class="form-control"
                                id="registerCategoryMid_subCategoryUp"
                                placeholder="예: 도넛"
                                maxlength="10"
                        />
                    </div>

                    <!-- 소분류명 -->
                    <div class="mb-3">
                        <label class="form-label">
                            소분류명 (*)
                        </label>
                        <input
                                type="text"
                                class="form-control"
                                id="registerCategorySub_subCategoryUp"
                                placeholder="예: 글루텐 프리 도넛"
                                maxlength="20"
                        />
                    </div>

                    <!-- 중복 체크 & 등록 버튼 -->
                    <div class="d-flex justify-content-between">
                        <button
                                type="button"
                                class="main-btn warning-btn-outline btn-hover btn-sm"
                                id="checkCategoryDuplicate">
                            중복 체크
                        </button>
                        <button
                                type="submit"
                                class="main-btn primary-btn btn-hover btn-sm">
                            등록
                        </button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- 카테고리 삭제 모달 -->
<div class="modal fade" id="productDeleteModal_mainCategoryUp" tabindex="-1" aria-labelledby="productDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="productDeleteModalLabel_mainCategoryUp">카테고리 삭제</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <h5>선택한 카테고리를 정말 삭제하시겠습니까?</h5><br>
                <ul id="deleteProductList_mainCategoryUp" class="list-group mb-3">
                    <!-- 선택된 제품명 목록 삽입 -->
                </ul>
                <div class="d-flex justify-content-end gap-2">
                    <button type="button" class="main-btn primary-btn btn-hover text-center" id="confirmDelete_mainCategoryUp">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 제품 등록 모달 -->
<div class="modal fade" id="productAddModal" tabindex="-1" aria-labelledby="productAddModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

            <!-- 모달 헤더 -->
            <div class="modal-header">
                <h5 class="modal-title" id="productAddModalLabel">제품 등록</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <!-- 모달 바디 -->
            <div class="modal-body">
                <p class="text-danger fw-normal mb-3">(*)는 필수 입력 항목입니다.</p>
                <form id="registerProductForm">

                    <!-- 1. 중분류 드롭박스 -->
                    <div class="mb-3">
                        <label for="registerCategoryMid" class="form-label">중분류 (*)</label>
                        <select class="form-select" id="registerCategoryMid" required>
                            <option value="">중분류 선택</option>
                            <!-- JavaScript에서 동적으로 옵션 추가 -->
                        </select>
                    </div>

                    <!-- 2. 소분류 드롭박스 -->
                    <div class="mb-3">
                        <label for="registerCategorySub" class="form-label">소분류 (*)</label>
                        <select class="form-select" id="registerCategorySub" disabled>
                            <option value="">소분류 선택</option>
                            <!-- JavaScript에서 동적으로 옵션 추가 -->
                        </select>
                    </div>

                    <!-- 3. 제품명 입력 + 중복 확인 버튼 -->
                    <div class="mb-3">
                        <label for="registerProductName" class="form-label">제품명 (*)
                            <i
                                    class="mdi mdi-help-circle text-primary"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="right"
                                    data-bs-html="true"
                                    data-bs-custom-class="wide-tooltip"
                                    title="냉장 또는 냉동 보관 제품의 경우,<br>제품명 앞에 보관타입을 명시해 주세요.<br>예: 냉동초코프로틴도넛"
                                    style="cursor: pointer;">
                            </i></label>
                        <div class="d-flex gap-2">
                            <input type="text" class="form-control" id="registerProductName" placeholder="예: 프로틴초코" maxlength="10" required>

                            <button type="button" class="main-btn primary-btn btn-hover btn-smaller" id="checkProductNameDuplicate">중복 확인</button>
                        </div>
                    </div>

                    <!-- 4. 제공단가 입력 + 단위 표시 -->
                    <div class="mb-3">
                        <label for="registerProductPrice" class="form-label">제공단가 (*)</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="registerProductPrice" placeholder="예: 5000" required>
                            <span class="input-group-text">원</span>
                        </div>
                    </div>

                    <!-- 5. 보관타입 드롭박스 -->
                    <div class="mb-3">
                        <label for="registerStoredType" class="form-label">보관타입 (*)</label>
                        <select class="form-select" id="registerStoredType" required>
                            <option value="">선택하세요</option>
                            <option value="냉장">냉장</option>
                            <option value="냉동">냉동</option>
                            <option value="상온">상온</option>
                        </select>
                    </div>

                    <!-- 제출 버튼 -->
                    <div class="d-flex justify-content-end">
                        <button type="submit" class="main-btn primary-btn btn-hover text-center">등록</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>

<!-- 제품 수정 모달 -->
<div class="modal fade" id="productEditModal" tabindex="-1" aria-labelledby="productEditModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">제품 수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <p class="text-danger mb-2">(*)는 필수 입력 항목입니다.</p>
                <table class="table text-center align-middle" id="editProductTable">
                    <thead>
                    <tr>
                        <th>제품코드</th>
                        <th>중분류*</th>
                        <th>소분류*</th>
                        <th>제품명*
                            <i
                                    class="mdi mdi-help-circle text-primary wide-tooltip tooltip-inner"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="right"
                                    data-bs-html="true"
                                    title="냉장 또는 냉동 보관 제품의 경우,<br>제품명 앞에 보관타입을 명시해 주세요.<br>예: 냉동초코프로틴도넛"
                                    style="cursor: pointer; margin-left: 5px;">
                            </i>
                        </th>
                        <th>제공단가*</th>
                        <th>보관타입*</th>
                        <th>중복확인</th>
                    </tr>
                    </thead>
                    <tbody>
                    </tbody>
                </table>

                <div class="d-flex justify-content-end">
                    <button type="button" class="main-btn primary-btn btn-hover text-center" id="btnProductEditSubmit">수정</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 제품 삭제 모달 -->
<div class="modal fade" id="productDeleteModal" tabindex="-1" aria-labelledby="productDeleteModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title" id="productDeleteModalLabel">제품 삭제</h3>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- 안내 메시지 -->
                <h5>선택한 제품을 정말 삭제하시겠습니까?</h5><br>
                <!-- 선택된 제품 목록 (상태 배지는 모두 회색 bg-secondary로 표시) -->
                <ul id="deleteProductList" class="list-group mb-3">
                    <!-- 동적으로 목록 항목이 추가됩니다 -->
                </ul>
                <!-- 삭제 확인 버튼 (취소 버튼은 없음) -->
                <div class="d-flex justify-content-end">
                    <button type="button" class="main-btn primary-btn btn-hover text-center" id="confirmDelete">삭제</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 모달 끝 -->

<!-- ========= All Javascript files linkup ======== -->
<script src="/resources/js/Chart.min.js"></script>
<script src="/resources/js/dynamic-pie-chart.js"></script>
<script src="/resources/js/moment.min.js"></script>
<script src="/resources/js/fullcalendar.js"></script>
<script src="/resources/js/jvectormap.min.js"></script>
<script src="/resources/js/world-merc.js"></script>
<script src="/resources/js/polyfill.js"></script>
<script src="/resources/js/main.js"></script>
<!-- datatable을 위해 필요함 -->
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="/resources/js/bootstrap.bundle.min.js"></script>

<script>
    // Bootstrap 5 Tooltip 활성화 (모달 내부)
    document.addEventListener('DOMContentLoaded', function () {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });
</script>

<!-- 카테고리 설정 시작 -->
<script>
    $(document).ready(function() {
        // 1. 더미 데이터 정의 (중분류)
        const dummyMainCategoriesUp = [
            { id: "도넛", name: "도넛" },
            { id: "베이글", name: "베이글" },
            { id: "커피", name: "커피" },
            { id: "티", name: "티" },
            { id: "머그컵", name: "머그컵" },
            { id: "텀블러", name: "텀블러" }
        ];

        // 2. 원본 필터 영역에 중분류 옵션 채우기
        var $midSelect = $('#myCustomFilters_mainCategoryUp #mainCategoryUp');
        $.each(dummyMainCategoriesUp, function(index, item) {
            $midSelect.append($('<option>', {
                value: item.id,
                text: item.name
            }));
        });

        // DataTable 초기화 시 dom 옵션에서 필터 영역을 위한 container를 별도로 지정
        var categoryTable = $('#datatable_mainCategoryUp').DataTable({
            autoWidth: false,
            order: [[1, 'asc']],
            columnDefs: [
                { width: '95px', targets: -1 },
                { targets: [1, 2, 3], className: 'text-center' }
            ],
            ajax: function(data, callback, settings) {
                console.log('ajax called', settings.nTable.id); // 로그 추가해서 확인
                // settings.nTable.id 검사를 통해 해당 테이블에만 적용
                if (settings.nTable.id !== 'datatable_mainCategoryUp') return true;
                const dummyMainCategorieData = [
                    { "categoryId": "DPN", "categoryMid": "도넛", "categorySub": "프로틴도넛" },
                    { "categoryId": "DGL", "categoryMid": "도넛", "categorySub": "글루텐프리도넛" },
                    { "categoryId": "DLW", "categoryMid": "도넛", "categorySub": "저당도넛" },
                    { "categoryId": "BGL", "categoryMid": "베이글", "categorySub": "글루텐프리베이글" },
                    { "categoryId": "CDC", "categoryMid": "커피", "categorySub": "디카페인" },
                    { "categoryId": "TZR", "categoryMid": "티", "categorySub": "제로음료" },
                    { "categoryId": "MPK", "categoryMid": "머그컵", "categorySub": "프로킨머그컵" },
                    { "categoryId": "TPK", "categoryMid": "텀블러", "categorySub": "프로킨텀블러" }
                ];
                Promise.resolve().then(() => {
                    callback({ data: dummyMainCategorieData });
                });
            },
            columns: [
                { // 체크박스
                    data: null,
                    orderable: false,
                    searchable: false,
                    render: function(data, type, row, meta) {
                        return '<input type="checkbox" class="row-checkbox">';
                    }
                },
                { data: 'categoryId', title: '제품코드' },
                { data: 'categoryMid', title: '중분류명' },
                { data: 'categorySub', title: '소분류명' },
                { defaultContent: "", title: "" }
            ],
            paging: true,
            pageLength: 5,
            lengthMenu: [[5, 10, 20, -1], ['5개', '10개', '20개', '전체']],
            searching: true,
            ordering: true,
            info: true,
            lengthChange: true,
            // dom 옵션에서 필터 영역을 위한 container 추가 (고유 클래스 사용)
            dom: '<"top"l<"myCustomFilters_mainCategoryUp_area">fr>t<"bottom"ip>',
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
                // 헤더 체크박스 정렬 아이콘 제거
                $('#datatable_mainCategoryUp thead th').eq(0).removeClass('sorting sorting_asc sorting_desc');
                $('#datatable_mainCategoryUp thead th').eq(4).removeClass('sorting sorting_asc sorting_desc');
                fixLengthDropdownStyle_category();

                // 필터 이벤트는 복제한 요소에 바인딩
                // (이벤트는 아래 부분에서 복제한 후 다시 바인딩할 예정)
            },
            drawCallback: function(settings) {
                $('#datatable_mainCategoryUp thead th').eq(0).removeClass('sorting sorting_asc sorting_desc');
                $('#datatable_mainCategoryUp thead th').eq(4).removeClass('sorting sorting_asc sorting_desc');
            }
        });

        // 전역 필터 함수 (해당 테이블에만 적용)
        $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
            if (settings.nTable.id !== 'datatable_mainCategoryUp') return true;
            const selectedMid = $('#mainCategoryUp_clone').val();
            // 컬럼 순서는 0: checkbox, 1: 제품코드, 2: 중분류명, 3: 소분류명
            const categoryMid = data[2];
            if (selectedMid && selectedMid !== categoryMid) {
                return false;
            }
            return true;
        });

        // 필터 영역 복제 및 재설정
        var $origFilter = $('#myCustomFilters_mainCategoryUp'); // 원본: display:none
        var $cloneFilter = $origFilter.clone(true);

        // 보이도록 display 제거
        $cloneFilter.css("display", "block");

        // 복제한 필터 내에서 ID 변경 (중분류 드롭다운, 버튼 등)
        $cloneFilter.find('#mainCategoryUp').attr('id', 'mainCategoryUp_clone');
        $cloneFilter.find('#resetFilterBtn_mainCategoryUp').attr('id', 'resetFilterBtn_mainCategoryUp_clone');
        $cloneFilter.find('#btnProductAdd_mainCategoryUp').attr('id', 'btnProductAdd_mainCategoryUp_clone');
        $cloneFilter.find('#btnProductDelete_mainCategoryUp').attr('id', 'btnProductDelete_mainCategoryUp_clone');

        // 삽입할 container가 dom 옵션에 지정되었으므로,
        // 해당 container가 document에 없다면 동적으로 생성
        if ($('.myCustomFilters_mainCategoryUp_area').length == 0) {
            $('<div class="myCustomFilters_mainCategoryUp_area"></div>').insertBefore('#datatable_mainCategoryUp');
        }
        $('.myCustomFilters_mainCategoryUp_area').html($cloneFilter.html());

        // 필터 이벤트 바인딩 (복제된 요소 기준)
        $('#mainCategoryUp_clone').on('change', function() {
            categoryTable.column(2).search(this.value).draw();
        });

        $('#resetFilterBtn_mainCategoryUp_clone').on('click', function() {
            $('#mainCategoryUp_clone').val('');
            categoryTable.column(2).search('').draw();
        });

        categoryTable.on('draw', function () {
            $('#datatable_mainCategoryUp_wrapper .dataTables_paginate .paginate_button').removeClass().addClass('main-btn deactive-btn-outline square-btn btn-hover mt-1 pt-2 pb-2 pl-15 pr-15');
        });

        // 버튼 이벤트
        // 중복 체크 상태 전역 변수
        let isCategoryDuplicateChecked = false;

        // 카테고리 등록 버튼 클릭 시
        // 중복 체크 버튼 이벤트 (한 번만 바인딩)
        $('#checkCategoryDuplicate').on('click', function () {
            const id = $('#registerCategoryForm #registerCategoryId').val().trim();
            const mid = $('#registerCategoryForm #registerCategoryMid_subCategoryUp').val().trim();
            const sub = $('#registerCategoryForm #registerCategorySub_subCategoryUp').val().trim();

            // 정규식 유효성 검사
            const regId = /^[A-Z]{3}$/;
            const regMidSub = /^[A-Za-z0-9가-힣 ]{1,20}$/;

            if (!id || !mid || !sub) {
                alert('모든 항목을 입력해주세요.');
                return;
            }
            if (!regId.test(id)) {
                alert('카테고리 코드는 알파벳 대문자 3자리여야 합니다.');
                return;
            }
            if (!regMidSub.test(mid)) {
                alert('중분류명은 한글, 영문, 숫자, 공백 포함 최대 10자입니다.');
                return;
            }
            if (!regMidSub.test(sub)) {
                alert('소분류명은 한글, 영문, 숫자, 공백 포함 최대 10자입니다.');
                return;
            }

            // 더미 데이터 (기존에 등록된 카테고리들)
            const dummyExistingIds = ['DPN', 'DGL', 'DLW', 'BGL', 'CDC', 'TZR', 'MPK', 'TPK'];
            const dummyExistingPairs = [
                { mid: '도넛', sub: '프로틴도넛' },
                { mid: '도넛', sub: '글루텐프리도넛' },
                { mid: '도넛', sub: '저당도넛' },
                { mid: '베이글', sub: '글루텐프리베이글' },
                { mid: '커피', sub: '디카페인' },
                { mid: '티', sub: '제로음료' },
                { mid: '머그컵', sub: '프로킨머그컵' },
                { mid: '텀블러', sub: '프로킨텀블러' }
            ];

            if (!id || !mid || !sub) {
                alert('모든 항목을 입력해주세요.');
                return;
            }

            // 1. ID 중복 체크
            if (dummyExistingIds.includes(id)) {
                alert('이미 존재하는 카테고리 코드입니다.');
                isCategoryDuplicateChecked = false;
                return;
            }

            // 2. (중분류, 소분류) 조합 중복 체크
            const isPairDuplicate = dummyExistingPairs.some(pair => pair.mid == mid && pair.sub == sub);
            if (isPairDuplicate) {
                alert(`이미 등록된 중분류/소분류 조합입니다.\n[${mid} - ${sub}]`);
                isCategoryDuplicateChecked = false;
                return;
            }

            // 통과
            alert('사용 가능한 카테고리입니다.');
            isCategoryDuplicateChecked = true;
        });

        // 입력 값 변경되면 중복 체크 상태 초기화
        $('#registerCategoryId, #registerCategoryMid_subCategoryUp, #registerCategorySub_subCategoryUp').on('input', function () {
            isCategoryDuplicateChecked = false;
        });

        // 모달 열기 버튼
        $('body').on('click', '#btnProductAdd_mainCategoryUp_clone', function () {
            $('#categoryAddModal').modal('show');
        });

        // 등록 폼 제출 이벤트 (한 번만 바인딩)
        $('#registerCategoryForm').on('submit', function (e) {
            e.preventDefault();

            const id = $('#registerCategoryForm #registerCategoryId').val().trim();
            const mid = $('#registerCategoryForm #registerCategoryMid_subCategoryUp').val().trim();
            const sub = $('#registerCategoryForm #registerCategorySub_subCategoryUp').val().trim();

            if (!id || !mid || !sub) {
                alert('모든 항목을 입력해주세요.');
                return;
            }

            if (!isCategoryDuplicateChecked) {
                alert('중복 체크를 먼저 진행해주세요.');
                return;
            }

            // 등록 성공 처리 (AJAX로 대체 가능)
            alert('카테고리가 성공적으로 등록되었습니다.');

            this.reset(); // 폼 초기화
            isCategoryDuplicateChecked = false;
            $('#categoryAddModal').modal('hide');
        });

        // 삭제 버튼 클릭 시
        $('body').on('click', '#btnProductDelete_mainCategoryUp_clone', function () {
            var selectedData = [];
            categoryTable.rows({ page: 'current' }).nodes().each(function(row) {
                if ($(row).find('.row-checkbox').prop('checked')) {
                    selectedData.push(categoryTable.row(row).data());
                }
            });
            if (selectedData.length == 0) {
                alert('삭제할 항목을 선택하세요.');
                return;
            }

            // 상태 매핑
            const statusMap = {
                DPN: { text: '재고있음',   canDelete: false },
                DGL: { text: '입고진행',   canDelete: false },
                DLW: { text: '삭제가능',   canDelete: true },
                BGL: { text: '출고진행',   canDelete: false },
                CDC: { text: '제품있음',   canDelete: false },
                TZR: { text: '발주진행',   canDelete: false  },
                MPK: { text: '삭제가능',   canDelete: true  },
                TPK: { text: '삭제가능',   canDelete: true  }
            };

            var $deleteList = $('#deleteProductList_mainCategoryUp');
            $deleteList.empty();

            // "모두 삭제 가능"인지 판별
            let allDeletable = true;

            selectedData.forEach(function(item) {
                // categoryId -> 상태 가져오기
                const catId = item.categoryId;
                const statusObj = statusMap[catId] || { text: '삭제가능', canDelete: true };

                // 배지 색상: 삭제 가능(초록), 불가능(빨강)
                const badgeColor = statusObj.canDelete ? 'bg-success' : 'bg-danger';
                const statusBadge = `<span class="badge bg-secondary">${statusObj.text}</span>`;

                // 하나라도 false 있으면 전체 삭제 불가로 간주
                if (!statusObj.canDelete) {
                    allDeletable = false;
                }

                // 리스트 표시
                $deleteList.append(`
              <li class="list-group-item d-flex justify-content-between align-items-center">
                ${item.categoryMid} - ${item.categorySub}
                ${statusBadge}
              </li>
            `);
            });

            // 안내문 & 버튼 문구 설정
            if (allDeletable) {
                // 1) 전부다 삭제 가능
                // 안내문
                $('#productDeleteModal_mainCategoryUp .modal-body > h5')
                    .text('선택한 카테고리를 정말 삭제하시겠습니까?');
                // 버튼
                $('#confirmDelete_mainCategoryUp').text('삭제');
            } else {
                // 2) 전부 혹은 일부 불가능
                // 안내문
                $('#productDeleteModal_mainCategoryUp .modal-body > h5')
                    .text('선택한 카테고리 중 삭제할 수 없는 항목이 포함되어 있습니다.');
                // 버튼
                $('#confirmDelete_mainCategoryUp').text('삭제가능 품목만 삭제');
            }

            // 모달 표시
            $('#productDeleteModal_mainCategoryUp').modal('show');
        });

        // 모달 내부의 삭제버튼 클릭 시
        $('#confirmDelete_mainCategoryUp').on('click', function() {
            const btnText = $(this).text();

            if (btnText == '삭제가능 품목만 삭제') {
                // (예시) 삭제 가능한 항목만 필터링해서 AJAX로 보낸다
                // 이 로직을 구현해주면 "삭제가능"한 카테고리만 삭제 처리
                alert('삭제 가능한 카테고리만 삭제했습니다!');
            } else {
                // (예시) 전체 삭제
                alert('모두 삭제되었습니다!');
            }

            $('#productDeleteModal_mainCategoryUp').modal('hide');
            // 필요 시: DataTable 업데이트 로직
        });

        // DataTable length dropdown custom 스타일 함수 (카테고리용)
        function fixLengthDropdownStyle_category() {
            const $length = $('#datatable_mainCategoryUp_wrapper .dataTables_length');
            const $select = $length.find('select');
            const selectedValue = $select.val();
            const $filter = $('#datatable_mainCategoryUp_wrapper .dataTables_filter');
            const $input = $filter.find('input');

            // 기존 label 텍스트 제거
            $length.find('label').contents().filter(function () {
                return this.nodeType == 3;
            }).remove();

            const $newWrapper = $(`
            <div class="select-style-1">
              <div class="select-position"></div>
            </div>
          `);
            const $newInput = $('<div class="input-style-1"></div>');

            $select.detach();
            $newWrapper.find('.select-position').append($select);
            $length.empty().append($newWrapper);

            $input.detach();
            $input.attr('placeholder', 'Search...');
            $newInput.append($input);
            $filter.empty().append($newInput);

            $select.val(selectedValue);
        }

        // 'Select All' 체크박스 이벤트
        $('#select-all_mainCategoryUp').on('click', function() {
            const rows = categoryTable.rows({ page: 'current' }).nodes();
            $('input.row-checkbox', rows).prop('checked', this.checked);
        });
        $('#datatable_mainCategoryUp tbody').on('change', 'input.row-checkbox', function() {
            if (!this.checked) {
                const el = $('#select-all_mainCategoryUp').get(0);
                if (el && el.checked) {
                    el.checked = false;
                }
            }
        });
        categoryTable.on('draw', function() {
            $('#select-all_mainCategoryUp').prop('checked', false);
        });
    });

</script>

<!-- 위 : 카테고리 / 아래 : 제품 -->


<script>
    $(document).ready(function() {
        // 1. 더미 데이터 정의 (중분류, 소분류)
        const dummyMidCategories = [
            {id: "도넛", name: "도넛"},
            {id: "베이글", name: "베이글"},
            {id: "커피", name: "커피"},
            {id: "티", name: "티"},
            {id: "머그컵", name: "머그컵"},
            {id: "텀블러", name: "텀블러"}
        ];
        const dummySubCategories = [
            {id: "프로틴 도넛", name: "프로틴 도넛", midCategory: "도넛"},
            {id: "글루텐 프리 도넛", name: "글루텐 프리 도넛", midCategory: "도넛"},
            {id: "저당 도넛", name: "저당 도넛", midCategory: "도넛"},
            {id: "글루텐프리베이글", name: "글루텐프리베이글", midCategory: "베이글"},
            {id: "디카페인", name: "디카페인", midCategory: "커피"},
            {id: "제로음료", name: "제로음료", midCategory: "티"},
            {id: "프로킨머그컵", name: "프로킨머그컵", midCategory: "머그컵"},
            {id: "프로킨텀블러", name: "프로킨텀블러", midCategory: "텀블러"}
        ];

        // 2. 원본 필터 영역에 중분류, 소분류 옵션 채우기
        var $midSelect = $('#myCustomFilters #midCategory');
        $.each(dummyMidCategories, function (index, item) {
            $midSelect.append($('<option>', {
                value: item.id,
                text: item.name
            }));
        });
        var $subSelect = $('#myCustomFilters #subCategory');
        $.each(dummySubCategories, function (index, item) {
            $subSelect.append($('<option>', {
                value: item.id,
                text: item.name
            }));
        });

        // 3. 소분류 -> 중분류 매핑 객체
        const mapping = {
            "프로틴 도넛": "도넛",
            "글루텐 프리 도넛": "도넛",
            "저당 도넛": "도넛",
            "글루텐프리베이글": "베이글",
            "디카페인": "커피",
            "제로음료": "티",
            "프로킨머그컵": "머그컵",
            "프로킨텀블러": "텀블러"
        };

        // 4. 이벤트 바인딩: 중분류 선택 시 소분류 리셋, 소분류 선택 시 자동 중분류 선택
        $('#myCustomFilters #midCategory').on('change', function() {
            $('#myCustomFilters #subCategory').val('');

            var selectedSub = $(this).val();
            if (selectedSub) {
                var correspondingMid = mapping[selectedSub];
                if (correspondingMid) {
                    $('#myCustomFilters #midCategory').val(correspondingMid);
                }
            }
        });

        // 전역 변수: 제품 삭제 모달에서 선택된 제품 데이터를 저장
        let currentSelectedProducts = [];

        // 5. DataTable 초기화 (dom 옵션에 사용자 정의 영역 포함)
        var table = $('#datatable').DataTable({
            autoWidth: false,
            order: [[1, 'asc']],
            columnDefs: [
                { width: '95px', targets: -1 },  // Actions 열 너비
                { targets: [1, 2, 3, 4, 5, 6], className: 'text-center' } // JS 속성으로 가운데 정렬
            ],
            ajax: function(data, callback, settings) {
                console.log('ajax called', settings.nTable.id); // 로그 추가해서 확인
                if (settings.nTable.id !== 'datatable') return true;
                // 전역 더미 데이터 (제품 목록)
                const dummyData = [
                    { productId: "DPN1", categoryMid: "도넛", categorySub: "프로틴 도넛", StoredType: "냉장", productName: "프로틴초코도넛", productPrice: "5,000원", status: "재고있음" },
                    { productId: "DPN2", categoryMid: "도넛", categorySub: "프로틴 도넛", StoredType: "냉장", productName: "프로틴딸기도넛", productPrice: "5,000원", status: "삭제가능" },
                    { productId: "DPN3", categoryMid: "도넛", categorySub: "프로틴 도넛", StoredType: "냉장", productName: "프로틴글레이즈드도넛", productPrice: "5,000원", status: "입고진행" },
                    { productId: "DPN4", categoryMid: "도넛", categorySub: "프로틴 도넛", StoredType: "냉동", productName: "냉동프로틴초코도넛", productPrice: "4,000원", status: "발주진행" },
                    { productId: "DPN5", categoryMid: "도넛", categorySub: "프로틴 도넛", StoredType: "냉동", productName: "냉동프로틴딸기도넛", productPrice: "4,000원", status: "재고있음" },
                    { productId: "DPN6", categoryMid: "도넛", categorySub: "프로틴 도넛", StoredType: "냉동", productName: "냉동프로틴글레이즈드도넛", productPrice: "4,000원", status: "재고있음" },
                    { productId: "DGL1", categoryMid: "도넛", categorySub: "글루텐 프리 도넛", StoredType: "냉장", productName: "글루텐프리초코도넛", productPrice: "5,000원", status: "재고있음" },
                    { productId: "DGL2", categoryMid: "도넛", categorySub: "글루텐 프리 도넛", StoredType: "냉장", productName: "글루텐프리딸기도넛", productPrice: "5,000원", status: "출고진행" },
                    { productId: "DGL3", categoryMid: "도넛", categorySub: "글루텐 프리 도넛", StoredType: "냉장", productName: "글루텐프리글레이즈드도넛", productPrice: "5,000원", status: "출고진행" },
                    { productId: "DGL4", categoryMid: "도넛", categorySub: "글루텐 프리 도넛", StoredType: "냉동", productName: "냉동동글루텐프리초코도넛", productPrice: "4,000원", status: "출고진행" },
                    { productId: "DGL5", categoryMid: "도넛", categorySub: "글루텐 프리 도넛", StoredType: "냉동", productName: "냉동글루텐프리딸기도넛", productPrice: "4,000원", status: "재고있음" },
                    { productId: "DGL6", categoryMid: "도넛", categorySub: "글루텐 프리 도넛", StoredType: "냉동", productName: "냉동글루텐프리글레이즈드도넛", productPrice: "4,000원", status: "재고있음" },
                    { productId: "DLW1", categoryMid: "도넛", categorySub: "저당 도넛", StoredType: "냉장", productName: "저당초코도넛", productPrice: "5,000원", status: "삭제가능" },
                    { productId: "DLW2", categoryMid: "도넛", categorySub: "저당 도넛", StoredType: "냉장", productName: "저당딸기도넛", productPrice: "5,000원", status: "삭제가능" },
                    { productId: "DLW3", categoryMid: "도넛", categorySub: "저당 도넛", StoredType: "냉장", productName: "저당글레이즈드도넛", productPrice: "5,000원", status: "삭제가능" },
                    { productId: "DLW4", categoryMid: "도넛", categorySub: "저당 도넛", StoredType: "냉동", productName: "냉동저당초코도넛", productPrice: "4,000원", status: "삭제가능" },
                    { productId: "DLW5", categoryMid: "도넛", categorySub: "저당 도넛", StoredType: "냉동", productName: "냉동저당딸기도넛", productPrice: "4,000원", status: "삭제가능" },
                    { productId: "DLW6", categoryMid: "도넛", categorySub: "저당 도넛", StoredType: "냉동", productName: "냉동저당글레이즈드도넛", productPrice: "4,000원", status: "재고있음" },
                    { productId: "BGL1", categoryMid: "베이글", categorySub: "글루텐프리베이글", StoredType: "냉동", productName: "글루텐프리베이글", productPrice: "5,000원", status: "입고진행" },
                    { productId: "CDC1", categoryMid: "커피", categorySub: "디카페인", StoredType: "상온", productName: "디카페인커피", productPrice: "5,000원", status: "출고진행" },
                    { productId: "TZR1", categoryMid: "티", categorySub: "제로음료", StoredType: "상온", productName: "제로아이스티", productPrice: "4,000원", status: "재고있음" },
                    { productId: "MPK1", categoryMid: "머그컵", categorySub: "프로킨머그컵", StoredType: "상온", productName: "프로킨머그컵", productPrice: "8,000원", status: "입고진행" },
                    { productId: "TPK1", categoryMid: "텀블러", categorySub: "프로킨텀블러", StoredType: "상온", productName: "프로킨텀블러", productPrice: "100,000원", status: "입고진행" }
                ];
                Promise.resolve().then(() => {
                    callback({ data: dummyData });
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
                { data: 'productId', title: '제품코드' },
                { data: 'categoryMid', title: '중분류' },
                { data: 'categorySub', title: '소분류' },
                { data: 'StoredType', title: '보관타입' },
                { data: 'productName', title: '제품명' },
                { data: 'productPrice', title: '제품단가' }
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
                if (settings.nTable.id !== 'datatable') return true;
                $('#datatable_wrapper thead th').eq(0).removeClass('sorting sorting_asc sorting_desc');
                fixLengthDropdownStyle();
                // 이후 중분류, 소분류 이벤트도 이 영역 내의 요소에 바인딩
            },
            // 새로고침 후 체크박스에서 정렬 화살표 지우기 (유지)
            drawCallback: function(settings) {
                if (settings.nTable.id !== 'datatable') return true;
                $('#datatable_wrapper thead th').eq(0).removeClass('sorting sorting_asc sorting_desc');
            }
        });

        function fixLengthDropdownStyle() {
            const $length = $('#datatable_wrapper .dataTables_length');
            const $select = $length.find('select');
            const selectedValue = $select.val();

            const $filter = $('#datatable_filter')
            const $input = $filter.find('input');

            // 기존 label 텍스트 제거 (ex. "표시 개수")
            $length.find('label').contents().filter(function () {
                return this.nodeType == 3; // 텍스트 노드
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
            $('#datatable_wrapper .dataTables_paginate .paginate_button').removeClass().addClass('main-btn deactive-btn-outline square-btn btn-hover mt-1 pt-2 pb-2 pl-15 pr-15');
        });

        // 6. 사용자 정의 필터 영역에 원본 필터를 복제하여 주입
        var $clone = $('#myCustomFilters').clone(true);
        // 복제 후 삽입 시, ID 제거 필수!
        $clone.find('#midCategory').attr('id', 'midCategory_clone');
        $clone.find('#subCategory').attr('id', 'subCategory_clone');

        $clone.find('#btnProductAdd').attr('id', 'btnProductAdd_clone');
        $clone.find('#btnProductEdit').attr('id', 'btnProductEdit_clone');
        $clone.find('#btnProductDelete').attr('id', 'btnProductDelete_clone');
        $clone.find('#btnProductAdd, #btnProductEdit, #btnProductDelete').remove();
        $('div.myFilterArea').html($clone.html());

        // select 태그 감싸는 구조 적용
        $('.dataTables_length select').each(function() {
            const $select = $(this);
            if (!$select.parent().hasClass('select-position')) {
                $select.wrap('<div class="col-lg-2"><div class="select-style-1"><div class="select-position"></div></div></div>');
            }
        });

        // 6-1. 이벤트 위임 방식으로 변경된 ID에 새롭게 바인딩 (body를 통해 실제 필터에 작동하게!)
        $('body').on('change', '#midCategory_clone', function() {
            $('#subCategory_clone').val('');
            table.draw();
        });

        $('body').on('change', '#subCategory_clone', function() {
            const selectedSub = $(this).val();
            if (selectedSub) {
                const correspondingMid = mapping[selectedSub];
                if (correspondingMid) {
                    $('#midCategory_clone').val(correspondingMid);
                }
            }
            table.draw();
        });

        $('body').on('click', '#resetFilterBtn', function () {
            $('#midCategory_clone').val('');
            $('#subCategory_clone').val('');
            table.draw();
        });

        // 7. 필터 이벤트: 드롭다운 변경 시 테이블 필터링
        $('#midCategory, #subCategory, #productNameInput').on('change keyup', function() {
            table.draw();
        });

        // 7-1. 필터링 함수도 변경된 ID값을 기준으로 수정
        $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
            if (settings.nTable.id !== 'datatable') return true;
            const selectedMid = $('#midCategory_clone').val();
            const selectedSub = $('#subCategory_clone').val();
            const categoryMid = data[2];
            const categorySub = data[3];

            if ((selectedMid && selectedMid !== categoryMid) ||
                (selectedSub && selectedSub !== categorySub)) {
                return false;
            }

            return true;
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

        // 드롭다운 채우기 함수
        function populateMidCategories() {
            const $midSelect = $('#registerCategoryMid');
            $midSelect.empty().append('<option value="">중분류 선택</option>');
            dummyMidCategories.forEach(function(item) {
                $midSelect.append('<option value="' + item.id + '">' + item.name + '</option>');
            });
        }
        function populateSubCategories(selectedMid) {
            const $subSelect = $('#registerCategorySub');

            if (!selectedMid) {
                $subSelect.prop('disabled', true)
                    .empty()
                    .append('<option value="">소분류 선택</option>');
                return;
            }

            $subSelect.prop('disabled', false)
                .empty()
                .append('<option value="">소분류 선택</option>');

            dummySubCategories.forEach(function (item) {
                if (item.midCategory == selectedMid) {
                    $subSelect.append('<option value="' + item.id + '">' + item.name + '</option>');
                }
            });
        }

        // 유효성 검사 함수
        function validateProductInputs() {
            const mid = $('#registerCategoryMid').val().trim();
            const sub = $('#registerCategorySub').val().trim();
            const productName = $('#registerProductName').val().trim();
            const productPrice = $('#registerProductPrice').val().trim();
            const storedType = $('#registerStoredType').val();

            if (!mid || !sub || !productName || !productPrice || !storedType) {
                return "모든 항목은 필수 입력입니다.";
            }
            const nameRegex = /^[A-Za-z가-힣]{1,10}$/;
            if (!nameRegex.test(productName)) {
                return "제품명은 한글과 영문만 가능하며 최대 10자까지 입력 가능합니다.";
            }
            if (isNaN(productPrice)) {
                return "제공단가는 숫자만 입력 가능합니다.";
            }
            return null;
        }

        var isProductNameDuplicateChecked = false;

        // 입력값 변경 시 중복 체크 플래그 초기화
        $('#registerCategoryMid, #registerCategorySub, #registerProductName').on('input change', function() {
            isProductNameDuplicateChecked = false;
        });

        // 모달이 열릴 때마다 드롭다운 초기화
        $('#productAddModal').on('shown.bs.modal', function() {
            populateMidCategories();
            $('#registerCategorySub').empty().append('<option value="">소분류 선택</option>');
            isProductNameDuplicateChecked = false;
        });

        // 중분류 선택 시 소분류 업데이트
        $(document).on('change', '#registerCategoryMid', function() {
            var selectedMid = $(this).val();
            populateSubCategories(selectedMid);
        });

        // 제품 중복 확인 버튼 이벤트
        $('#checkProductNameDuplicate').on('click', function() {
            const errorMsg = validateProductInputs();
            if (errorMsg) {
                alert(errorMsg);
                return;
            }
            // 예시: 더미 등록된 제품 배열
            const registeredProducts = [
                { mid: "도넛", sub: "프로틴도넛", productName: "프로틴초코" },
                { mid: "도넛", sub: "글루텐프리도넛", productName: "클래식" }
            ];
            const mid = $('#registerCategoryMid').val().trim();
            const sub = $('#registerCategorySub').val().trim();
            const productName = $('#registerProductName').val().trim();

            const isDuplicate = registeredProducts.some(function(prod) {
                return prod.mid == mid && prod.sub == sub && prod.productName == productName;
            });

            if (isDuplicate) {
                alert("이미 등록된 제품입니다.");
                isProductNameDuplicateChecked = false;
            } else {
                alert("사용 가능한 제품명입니다.");
                isProductNameDuplicateChecked = true;
            }
        });

        // 제품 등록 폼 제출 이벤트
        $('#registerProductForm').on('submit', function(e) {
            e.preventDefault();
            const errorMsg = validateProductInputs();
            if (errorMsg) {
                alert(errorMsg);
                return;
            }
            if (!isProductNameDuplicateChecked) {
                alert("제품명 중복 확인을 먼저 진행해주세요.");
                return;
            }
            alert("제품이 등록되었습니다.");
            this.reset();
            isProductNameDuplicateChecked = false;
            $('#productAddModal').modal('hide');
        });

        // 모달 열기 버튼 이벤트 (단순히 모달을 여는 역할만)
        $(document).on('click', '#btnProductAdd_clone', function() {
            $('#productAddModal').modal('show');
        });

        // 제품 수정 모달 클릭 시
        const dummySubCategoriesByMid = {};
        dummySubCategories.forEach(item => {
            if (!dummySubCategoriesByMid[item.midCategory]) {
                dummySubCategoriesByMid[item.midCategory] = [];
            }
            dummySubCategoriesByMid[item.midCategory].push(item.name);
        });

        function validateEditRow($row) {
            const mid = $row.find('.mid-select').val();
            const sub = $row.find('.sub-select').val();
            const name = $row.find('.name-input').val().trim();
            const price = $row.find('.price-input').val().trim();
            const stored = $row.find('.stored-select').val();
            const isChecked = $row.data('duplicateChecked') == true;

            if (!mid || !sub || !name || !price || !stored) {
                return '모든 항목은 필수 입력입니다.';
            }
            const nameRegex = /^[A-Za-z가-힣]{1,15}$/;
            if (!nameRegex.test(name)) {
                return '제품명은 한글과 영문만 가능하며 최대 15자까지 입력 가능합니다.';
            }
            if (isNaN(price)) {
                return '제공단가는 숫자만 입력 가능합니다.';
            }
            if (!isChecked) {
                return '중복 확인을 먼저 해주세요.';
            }
            return null;
        }

        function createEditRow(rowData) {
            const options = function(arr, selected) {
                return arr.map(function(v) {
                    var val = (typeof v === 'string') ? v : (v.id || '');
                    var text = (typeof v === 'string') ? v : (v.name || '');
                    var selectedAttr = (val.trim() === (selected || '').trim()) ? ' selected' : '';
                    return '<option value="' + val + '"' + selectedAttr + '>' + text + '</option>';
                }).join('');
            };

            var mids = Object.keys(dummySubCategoriesByMid);
            var subs = dummySubCategoriesByMid[rowData.categoryMid] || [];

            return (
                '<tr data-duplicate-checked="false">' +
                '<td><span class="form-control form-control-sm text-muted bg-light">' + rowData.productId + '</span></td>' +
                '<td>' +
                '<select class="form-select form-select-sm required-field mid-select">' +
                '<option value="">중분류 선택</option>' +
                options(mids, rowData.categoryMid) +
                '</select>' +
                '</td>' +
                '<td>' +
                '<select class="form-select form-select-sm required-field sub-select">' +
                '<option value="">소분류 선택</option>' +
                options(subs, rowData.categorySub) +
                '</select>' +
                '</td>' +
                '<td><input type="text" class="form-control form-control-sm required-field name-input" maxlength="10" value="' + (rowData.productName || '') + '"></td>' +
                '<td><input type="text" class="form-control form-control-sm required-field price-input" value="' + (rowData.productPrice || '') + '"></td>' +
                '<td>' +
                '<select class="form-select form-select-sm required-field stored-select">' +
                '<option value="">선택</option>' +
                '<option value="냉장"' + (rowData.StoredType == '냉장' ? ' selected' : '') + '>냉장</option>' +
                '<option value="냉동"' + (rowData.StoredType == '냉동' ? ' selected' : '') + '>냉동</option>' +
                '<option value="상온"' + (rowData.StoredType == '상온' ? ' selected' : '') + '>상온</option>' +
                '</select>' +
                '</td>' +
                '<td><button type="button" class="main-btn primary-btn btn-hover btn-smaller btnCheckDuplicate">중복확인</button></td>' +
                '</tr>'
            );
        }

        $(document).on('click', '#btnProductEdit_clone', function () {
            const $checked = $('#datatable tbody input.row-checkbox:checked');
            if ($checked.length == 0) {
                alert('수정할 제품을 선택해주세요.');
                return;
            }

            const table = $('#datatable').DataTable();
            const $tbody = $('#editProductTable tbody');
            $tbody.empty();

            $checked.each(function () {
                const $row = $(this).closest('tr');
                const rowData = table.row($row).data();
                if (rowData) {
                    $tbody.append(createEditRow(rowData));
                }
            });

            $('#productEditModal').modal('show');
        });

        $(document).on('change', '.mid-select', function () {
            const selectedMid = $(this).val();
            const $tr = $(this).closest('tr');
            const $subSelect = $tr.find('.sub-select');
            const subs = dummySubCategoriesByMid[selectedMid] || [];

            if (selectedMid == '') {
                $subSelect.prop('disabled', true);
            } else {
                $subSelect.prop('disabled', false);
            }

            $subSelect.empty().append('<option value="">소분류 선택</option>');
            subs.forEach(sub => {
                $subSelect.append(`<option value="${sub}">${sub}</option>`);
            });
        });

        $(document).on('click', '.btnCheckDuplicate', function () {
            const $tr = $(this).closest('tr');
            const error = validateEditRow($tr);
            if (error && error !== '중복 확인을 먼저 해주세요.') {
                alert(error);
                return;
            }
            alert('사용 가능한 제품명입니다.');
            $tr.data('duplicateChecked', true);
        });

        $(document).on('click', '#btnProductEditSubmit', function () {
            const $rows = $('#editProductTable tbody tr');

            for (let i = 0; i < $rows.length; i++) {
                const $row = $($rows[i]);
                const error = validateEditRow($row);
                if (error) {
                    const productName = $row.find('.name-input').val().trim() || `(행 ${i + 1})`;

                    // 중복 확인 안 한 경우에만 구체적인 피드백
                    if (error == '중복 확인을 먼저 해주세요.') {
                        alert(`"${productName}" 제품의 중복 확인을 먼저 해주세요.`);
                    } else {
                        alert(`"${productName}" 항목 오류: ${error}`);
                    }
                    return;
                }
            }

            alert('제품이 성공적으로 수정되었습니다.');
            $('#productEditModal').modal('hide');
        });

        // 제품 삭제 모달 열기 이벤트
        $('#btnProductDelete_clone').click(function() {

            // 체크박스가 선택된 행만 가져오기
            var selectedData = [];
            table.rows({ page: 'current' }).nodes().each(function(row) {
                if ($(row).find('.row-checkbox').prop('checked')) {
                    selectedData.push(table.row(row).data());
                }
            });

            if (selectedData.length == 0) {
                alert('삭제할 제품을 선택하세요.');
                return;
            }

            // 전역 변수에 선택된 데이터 할당
            currentSelectedProducts = selectedData;

            // 제품 상태 매핑 (모든 배지는 회색)
            const productStatusMap = {
                "재고있음": { text: "재고있음", canDelete: false },
                "입고진행": { text: "입고진행", canDelete: false },
                "발주진행": { text: "발주진행", canDelete: false },
                "출고진행": { text: "출고진행", canDelete: false },
                "삭제가능": { text: "삭제가능", canDelete: true }
            };

            // 삭제 목록 초기화
            $('#deleteProductList').empty();

            let allDeletable = true;
            currentSelectedProducts.forEach(function(item) {
                const prodStatus = item.status || "삭제가능";
                const statusObj = productStatusMap[prodStatus] || { text: prodStatus, canDelete: true };
                const statusBadge = `<span class="badge bg-secondary">${statusObj.text}</span>`;

                if (!statusObj.canDelete) {
                    allDeletable = false;
                }

                $('#deleteProductList').append(`
              <li class="list-group-item d-flex justify-content-between align-items-center">
                ${item.productName}
                ${item.productId}
                ${statusBadge}
              </li>
            `);
            });

            // 안내문 및 삭제 버튼 텍스트를 설정 (모달 내부 안내문은 <p> 태그로 감싸져 있어야 함)
            if (allDeletable) {
                $('#productDeleteModal .modal-body > h5').text('선택한 제품을 정말 삭제하시겠습니까?');
                $('#confirmDelete').text('삭제');
            } else {
                $('#productDeleteModal .modal-body > h5').text('선택한 제품 중 삭제할 수 없는 항목이 포함되어 있습니다.');
                $('#confirmDelete').text('삭제가능 품목만 삭제');
            }

            $('#productDeleteModal').modal('show');
        });

        // 제품 삭제 모달의 삭제 버튼 클릭 이벤트 (중복 바인딩 방지를 위해 off() 후 on() 사용)
        $('#confirmDelete').off('click').on('click', function() {
            const btnText = $(this).text();
            if (btnText == '삭제가능 품목만 삭제') {
                alert('삭제 가능한 제품만 삭제했습니다!');
            } else {
                alert('선택한 제품을 모두 삭제했습니다!');
            }

            $('#productDeleteModal').modal('hide');
            // 필요 시 DataTable 업데이트 등의 추가 처리
        });



    });
</script>

<!-- 마이페이지 -->
<script>
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>
</script>

</body>
</html>
