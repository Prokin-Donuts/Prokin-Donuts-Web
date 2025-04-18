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
                            <h2>재고관리</h2>
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
                        <h6 class="mb-10">재고 목록</h6>
                        <p class="text-sm mb-20"></p>

                            <!-- 원하는 필터(중분류, 소분류) 설정 -->
                        <div id="myCustomFilters" style="display: none;">

                            <div class="d-flex flex-wrap gap-2">
                                <!-- 창고 -->
                                <div >
                                    <div class="select-style-1">
                                        <div class="select-position">
                                            <select id="warehouseCategory">
                                                <option value="">창고</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

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
                                <div class="ms-auto gap-2 mb-20">
                                </div>
                            </div>

                        </div>

                        <div class="table-wrapper table-responsive p-0">


                            <!-- Start table -->
                            <table id="datatable" class="table striped-table w-100" style="width:100%">

                                <!-- colgroup를 통해 열 폭을 강제 지정 -->
                                <colgroup>
                                    <col style="width: 20%;" />
                                    <col style="width: 15%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 15%;" />
                                    <col style="width: 20%;" />
                                    <col style="width: 10%;" />
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>재고코드</th>
                                    <th>창고</th>
                                    <th>보관타입</th>
                                    <th>중분류</th>
                                    <th>소분류</th>
                                    <th>제품명</th>
                                    <th>재고수량</th>
                                </tr>
                                </thead>

                                <tbody>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 모달 위치 -->

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
        // 1. 더미 데이터 정의 (창고, 중분류, 소분류)
        const dummyWarehouseCategories = [
            { id: "남양주DT센터", name: "남양주DT센터" },
            { id: "대전DT센터", name: "대전DT센터" },
            { id: "전주DT센터", name: "전주DT센터" },
            { id: "부산서면DT센터", name: "부산서면DT센터" }
        ];
        const dummyMidCategories = [
            { id: "도넛", name: "도넛" },
            { id: "베이글", name: "베이글" },
            { id: "커피", name: "커피" },
            { id: "티", name: "티" },
            { id: "머그컵", name: "머그컵" },
            { id: "텀블러", name: "텀블러" }
        ];
        const dummySubCategories = [
            { id: "프로틴 도넛", name: "프로틴 도넛", midCategory: "도넛" },
            { id: "글루텐 프리 도넛", name: "글루텐 프리 도넛", midCategory: "도넛" },
            { id: "저당 도넛", name: "저당 도넛", midCategory: "도넛" },
            { id: "글루텐프리베이글", name: "글루텐프리베이글", midCategory: "베이글" },
            { id: "디카페인", name: "디카페인", midCategory: "커피" },
            { id: "제로음료", name: "제로음료", midCategory: "티" },
            { id: "프로킨머그컵", name: "프로킨머그컵", midCategory: "머그컵" },
            { id: "프로킨텀블러", name: "프로킨텀블러", midCategory: "텀블러" }
        ];

        // 2. 원본 필터 영역에 창고, 중분류, 소분류 옵션 채우기
        var $warehouseSelect = $('#myCustomFilters #warehouseCategory');
        $.each(dummyWarehouseCategories, function(index, item) {
            $warehouseSelect.append($('<option>', {
                value: item.id,
                text: item.name
            }));
        });

        var $midSelect = $('#myCustomFilters #midCategory');
        $.each(dummyMidCategories, function(index, item) {
            $midSelect.append($('<option>', {
                value: item.id,
                text: item.name
            }));
        });

        var $subSelect = $('#myCustomFilters #subCategory');
        $.each(dummySubCategories, function(index, item) {
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
        });
        $('#myCustomFilters #subCategory').on('change', function() {
            var selectedSub = $(this).val();
            if (selectedSub) {
                var correspondingMid = mapping[selectedSub];
                if (correspondingMid) {
                    $('#myCustomFilters #midCategory').val(correspondingMid);
                }
            }
        });

        // 5. DataTable 초기화 (dom 옵션에 사용자 정의 영역 포함)
        var table = $('#datatable').DataTable({
            autoWidth: false,
            columnDefs: [
                { width: '95px', targets: -1 },  // Actions 열 너비
                { targets: [0, 1, 2, 3, 4, 5, 6], className: 'text-center' } // JS 속성으로 가운데 정렬
            ],
            ajax: function(data, callback, settings) {
                const dummyData = [
                    {
                        "inventoryCode": "GG1-BGL1-20250612",
                        "warehouseName": "남양주DT센터",
                        "productName": "글루텐프리베이글",
                        "quantity": 589,
                        "storedType": "냉동",
                        "categoryMid": "베이글",
                        "categorySub": "글루텐프리베이글"
                    },
                    {
                        "inventoryCode": "GG1-CDC1-20250523",
                        "warehouseName": "남양주DT센터",
                        "productName": "디카페인커피",
                        "quantity": 902,
                        "storedType": "상온",
                        "categoryMid": "커피",
                        "categorySub": "디카페인"
                    },
                    {
                        "inventoryCode": "GG1-DGL1-20250626",
                        "warehouseName": "남양주DT센터",
                        "productName": "글루텐프리초코도넛",
                        "quantity": 169,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DGL2-20250504",
                        "warehouseName": "남양주DT센터",
                        "productName": "글루텐프리딸기도넛",
                        "quantity": 284,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DGL2-20250605",
                        "warehouseName": "남양주DT센터",
                        "productName": "글루텐프리딸기도넛",
                        "quantity": 299,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DGL4-20250617",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동동글루텐프리초코도넛",
                        "quantity": 134,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DGL4-20250818",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동동글루텐프리초코도넛",
                        "quantity": 780,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DGL5-20250815",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동글루텐프리딸기도넛",
                        "quantity": 116,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DGL6-20250928",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동글루텐프리글레이즈드도넛",
                        "quantity": 797,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DLW1-20250822",
                        "warehouseName": "남양주DT센터",
                        "productName": "저당초코도넛",
                        "quantity": 199,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DLW2-20250629",
                        "warehouseName": "남양주DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 266,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DLW2-20250821",
                        "warehouseName": "남양주DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 528,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DLW4-20250721",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동저당초코도넛",
                        "quantity": 608,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DPN1-20250521",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로틴초코도넛",
                        "quantity": 959,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DPN2-20250905",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로틴딸기도넛",
                        "quantity": 780,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DPN2-20250907",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로틴딸기도넛",
                        "quantity": 133,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DPN3-20250624",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로틴글레이즈드도넛",
                        "quantity": 406,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DPN6-20250528",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동프로틴글레이즈드도넛",
                        "quantity": 305,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DPN6-20250912",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동프로틴글레이즈드도넛",
                        "quantity": 977,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "GG1-DPN6-20250919",
                        "warehouseName": "남양주DT센터",
                        "productName": "냉동프로틴글레이즈드도넛",
                        "quantity": 429,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "GG1-MPK1-20250505",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로킨머그컵",
                        "quantity": 623,
                        "storedType": "상온",
                        "categoryMid": "머그컵",
                        "categorySub": "프로킨머그컵"
                    },
                    {
                        "inventoryCode": "GG1-MPK1-20250725",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로킨머그컵",
                        "quantity": 717,
                        "storedType": "상온",
                        "categoryMid": "머그컵",
                        "categorySub": "프로킨머그컵"
                    },
                    {
                        "inventoryCode": "GG1-TPK1-20250616",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로킨텀블러",
                        "quantity": 955,
                        "storedType": "상온",
                        "categoryMid": "텀블러",
                        "categorySub": "프로킨텀블러"
                    },
                    {
                        "inventoryCode": "GG1-TPK1-20250617",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로킨텀블러",
                        "quantity": 595,
                        "storedType": "상온",
                        "categoryMid": "텀블러",
                        "categorySub": "프로킨텀블러"
                    },
                    {
                        "inventoryCode": "GG1-TPK1-20250716",
                        "warehouseName": "남양주DT센터",
                        "productName": "프로킨텀블러",
                        "quantity": 820,
                        "storedType": "상온",
                        "categoryMid": "텀블러",
                        "categorySub": "프로킨텀블러"
                    },
                    {
                        "inventoryCode": "DJ1-BGL1-20250903",
                        "warehouseName": "대전DT센터",
                        "productName": "글루텐프리베이글",
                        "quantity": 678,
                        "storedType": "냉동",
                        "categoryMid": "베이글",
                        "categorySub": "글루텐프리베이글"
                    },
                    {
                        "inventoryCode": "DJ1-DGL1-20250815",
                        "warehouseName": "대전DT센터",
                        "productName": "글루텐프리초코도넛",
                        "quantity": 815,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DGL4-20250613",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동동글루텐프리초코도넛",
                        "quantity": 514,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DGL6-20250909",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동글루텐프리글레이즈드도넛",
                        "quantity": 593,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW1-20250623",
                        "warehouseName": "대전DT센터",
                        "productName": "저당초코도넛",
                        "quantity": 559,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW2-20250719",
                        "warehouseName": "대전DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 453,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-BGL1-20250903",
                        "warehouseName": "대전DT센터",
                        "productName": "글루텐프리베이글",
                        "quantity": 678,
                        "storedType": "냉동",
                        "categoryMid": "베이글",
                        "categorySub": "글루텐프리베이글"
                    },
                    {
                        "inventoryCode": "DJ1-DGL1-20250815",
                        "warehouseName": "대전DT센터",
                        "productName": "글루텐프리초코도넛",
                        "quantity": 815,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DGL4-20250613",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동동글루텐프리초코도넛",
                        "quantity": 514,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DGL6-20250909",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동글루텐프리글레이즈드도넛",
                        "quantity": 593,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW1-20250623",
                        "warehouseName": "대전DT센터",
                        "productName": "저당초코도넛",
                        "quantity": 559,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW2-20250719",
                        "warehouseName": "대전DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 453,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW2-20250727",
                        "warehouseName": "대전DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 639,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW3-20250702",
                        "warehouseName": "대전DT센터",
                        "productName": "저당글레이즈드도넛",
                        "quantity": 604,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW4-20250521",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동저당초코도넛",
                        "quantity": 177,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW5-20250815",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동저당딸기도넛",
                        "quantity": 693,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW5-20250905",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동저당딸기도넛",
                        "quantity": 716,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW6-20250620",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동저당글레이즈드도넛",
                        "quantity": 213,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DLW6-20250711",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동저당글레이즈드도넛",
                        "quantity": 820,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DPN3-20250912",
                        "warehouseName": "대전DT센터",
                        "productName": "프로틴글레이즈드도넛",
                        "quantity": 960,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DPN3-20250828",
                        "warehouseName": "대전DT센터",
                        "productName": "프로틴글레이즈드도넛",
                        "quantity": 304,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DPN4-20250912",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동프로틴초코도넛",
                        "quantity": 122,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DPN5-20250830",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동프로틴딸기도넛",
                        "quantity": 618,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-DPN5-20250804",
                        "warehouseName": "대전DT센터",
                        "productName": "냉동프로틴딸기도넛",
                        "quantity": 457,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "DJ1-TZR1-20250821",
                        "warehouseName": "대전DT센터",
                        "productName": "제로아이스티",
                        "quantity": 782,
                        "storedType": "상온",
                        "categoryMid": "티",
                        "categorySub": "제로음료"
                    },
                    {
                        "inventoryCode": "DJ1-TZR1-20250528",
                        "warehouseName": "대전DT센터",
                        "productName": "제로아이스티",
                        "quantity": 652,
                        "storedType": "상온",
                        "categoryMid": "티",
                        "categorySub": "제로음료"
                    },
                    {
                        "inventoryCode": "DJ1-TZR1-20250818",
                        "warehouseName": "대전DT센터",
                        "productName": "제로아이스티",
                        "quantity": 603,
                        "storedType": "상온",
                        "categoryMid": "티",
                        "categorySub": "제로음료"
                    },{
                        "inventoryCode": "JB1-BGL1-20250902",
                        "warehouseName": "전주DT센터",
                        "productName": "글루텐프리베이글",
                        "quantity": 728,
                        "storedType": "냉동",
                        "categoryMid": "베이글",
                        "categorySub": "글루텐프리베이글"
                    },
                    {
                        "inventoryCode": "JB1-DGL1-20250528",
                        "warehouseName": "전주DT센터",
                        "productName": "글루텐프리초코도넛",
                        "quantity": 696,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DGL1-20250823",
                        "warehouseName": "전주DT센터",
                        "productName": "글루텐프리초코도넛",
                        "quantity": 345,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DGL2-20250719",
                        "warehouseName": "전주DT센터",
                        "productName": "글루텐프리딸기도넛",
                        "quantity": 909,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DGL3-20250911",
                        "warehouseName": "전주DT센터",
                        "productName": "글루텐프리글레이즈드도넛",
                        "quantity": 813,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DGL4-20250509",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동동글루텐프리초코도넛",
                        "quantity": 282,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DGL5-20250628",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동글루텐프리딸기도넛",
                        "quantity": 662,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DGL6-20250509",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동글루텐프리글레이즈드도넛",
                        "quantity": 360,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DGL6-20250530",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동글루텐프리글레이즈드도넛",
                        "quantity": 499,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW1-20250826",
                        "warehouseName": "전주DT센터",
                        "productName": "저당초코도넛",
                        "quantity": 701,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW2-20250918",
                        "warehouseName": "전주DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 498,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW2-20250907",
                        "warehouseName": "전주DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 126,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW2-20250516",
                        "warehouseName": "전주DT센터",
                        "productName": "저당딸기도넛",
                        "quantity": 630,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW3-20250609",
                        "warehouseName": "전주DT센터",
                        "productName": "저당글레이즈드도넛",
                        "quantity": 707,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW3-20250828",
                        "warehouseName": "전주DT센터",
                        "productName": "저당글레이즈드도넛",
                        "quantity": 677,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW3-20250720",
                        "warehouseName": "전주DT센터",
                        "productName": "저당글레이즈드도넛",
                        "quantity": 472,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW5-20250521",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동저당딸기도넛",
                        "quantity": 821,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW5-20250829",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동저당딸기도넛",
                        "quantity": 856,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DLW6-20250628",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동저당글레이즈드도넛",
                        "quantity": 550,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN1-20250704",
                        "warehouseName": "전주DT센터",
                        "productName": "프로틴초코도넛",
                        "quantity": 898,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN1-20250510",
                        "warehouseName": "전주DT센터",
                        "productName": "프로틴초코도넛",
                        "quantity": 634,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN1-20250523",
                        "warehouseName": "전주DT센터",
                        "productName": "프로틴초코도넛",
                        "quantity": 447,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN2-20250916",
                        "warehouseName": "전주DT센터",
                        "productName": "프로틴딸기도넛",
                        "quantity": 355,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN2-20250604",
                        "warehouseName": "전주DT센터",
                        "productName": "프로틴딸기도넛",
                        "quantity": 190,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN3-20250826",
                        "warehouseName": "전주DT센터",
                        "productName": "프로틴글레이즈드도넛",
                        "quantity": 969,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN5-20250803",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동프로틴딸기도넛",
                        "quantity": 530,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN6-20250928",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동프로틴글레이즈드도넛",
                        "quantity": 892,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "JB1-DPN6-20250708",
                        "warehouseName": "전주DT센터",
                        "productName": "냉동프로틴글레이즈드도넛",
                        "quantity": 482,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },{
                        "inventoryCode": "BS1-BGL1-20250711",
                        "warehouseName": "부산서면DT센터",
                        "productName": "글루텐프리베이글",
                        "quantity": 350,
                        "storedType": "냉동",
                        "categoryMid": "베이글",
                        "categorySub": "글루텐프리베이글"
                    },
                    {
                        "inventoryCode": "BS1-CDC1-20250624",
                        "warehouseName": "부산서면DT센터",
                        "productName": "디카페인커피",
                        "quantity": 271,
                        "storedType": "상온",
                        "categoryMid": "커피",
                        "categorySub": "디카페인"
                    },
                    {
                        "inventoryCode": "BS1-CDC1-20250727",
                        "warehouseName": "부산서면DT센터",
                        "productName": "디카페인커피",
                        "quantity": 843,
                        "storedType": "상온",
                        "categoryMid": "커피",
                        "categorySub": "디카페인"
                    },
                    {
                        "inventoryCode": "BS1-DGL1-20250715",
                        "warehouseName": "부산서면DT센터",
                        "productName": "글루텐프리초코도넛",
                        "quantity": 294,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DGL2-20250901",
                        "warehouseName": "부산서면DT센터",
                        "productName": "글루텐프리딸기도넛",
                        "quantity": 810,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DGL5-20250731",
                        "warehouseName": "부산서면DT센터",
                        "productName": "냉동글루텐프리딸기도넛",
                        "quantity": 663,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "글루텐 프리 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DLW3-20250822",
                        "warehouseName": "부산서면DT센터",
                        "productName": "저당글레이즈드도넛",
                        "quantity": 107,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "저당 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DPN3-20250507",
                        "warehouseName": "부산서면DT센터",
                        "productName": "프로틴글레이즈드도넛",
                        "quantity": 800,
                        "storedType": "냉장",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DPN4-20250904",
                        "warehouseName": "부산서면DT센터",
                        "productName": "냉동프로틴초코도넛",
                        "quantity": 501,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DPN5-20250606",
                        "warehouseName": "부산서면DT센터",
                        "productName": "냉동프로틴딸기도넛",
                        "quantity": 881,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DPN5-20250725",
                        "warehouseName": "부산서면DT센터",
                        "productName": "냉동프로틴딸기도넛",
                        "quantity": 189,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DPN5-20250817",
                        "warehouseName": "부산서면DT센터",
                        "productName": "냉동프로틴딸기도넛",
                        "quantity": 166,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DPN6-20250830",
                        "warehouseName": "부산서면DT센터",
                        "productName": "냉동프로틴글레이즈드도넛",
                        "quantity": 910,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "BS1-DPN6-20250624",
                        "warehouseName": "부산서면DT센터",
                        "productName": "냉동프로틴글레이즈드도넛",
                        "quantity": 393,
                        "storedType": "냉동",
                        "categoryMid": "도넛",
                        "categorySub": "프로틴 도넛"
                    },
                    {
                        "inventoryCode": "BS1-MPK1-20250626",
                        "warehouseName": "부산서면DT센터",
                        "productName": "프로킨머그컵",
                        "quantity": 318,
                        "storedType": "상온",
                        "categoryMid": "머그컵",
                        "categorySub": "프로킨머그컵"
                    },
                    {
                        "inventoryCode": "BS1-MPK1-20250817",
                        "warehouseName": "부산서면DT센터",
                        "productName": "프로킨머그컵",
                        "quantity": 238,
                        "storedType": "상온",
                        "categoryMid": "머그컵",
                        "categorySub": "프로킨머그컵"
                    },
                    {
                        "inventoryCode": "BS1-TZR1-20251005",
                        "warehouseName": "부산서면DT센터",
                        "productName": "제로아이스티",
                        "quantity": 180,
                        "storedType": "상온",
                        "categoryMid": "티",
                        "categorySub": "제로음료"
                    },
                    {
                        "inventoryCode": "BS1-TZR1-20250915",
                        "warehouseName": "부산서면DT센터",
                        "productName": "제로아이스티",
                        "quantity": 991,
                        "storedType": "상온",
                        "categoryMid": "티",
                        "categorySub": "제로음료"
                    },
                    {
                        "inventoryCode": "BS1-TZR1-20250903",
                        "warehouseName": "부산서면DT센터",
                        "productName": "제로아이스티",
                        "quantity": 901,
                        "storedType": "상온",
                        "categoryMid": "티",
                        "categorySub": "제로음료"
                    }
                ];
                Promise.resolve().then(() => {
                    callback({ data: dummyData });
                });
            },
            columns: [
                { data: 'inventoryCode', title: '재고코드' },
                { data: 'warehouseName', title: '창고' },
                { data: 'storedType', title: '보관타입' },
                { data: 'categoryMid', title: '중분류' },
                { data: 'categorySub', title: '소분류' },
                { data: 'productName', title: '제품명' },
                { data: 'quantity', title: '재고수량' }
            ],
            paging: true,
            pageLength: 10,
            lengthMenu: [[10, 20, 30, -1], ['10개', '20개', '30개', '전체']],
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
        $clone.find('#warehouseCategory').attr('id', 'warehouseCategory_clone');
        $clone.find('#midCategory').attr('id', 'midCategory_clone');
        $clone.find('#subCategory').attr('id', 'subCategory_clone');

        $('div.myFilterArea').html($clone.html());

        // select 태그 감싸는 구조 적용
        $('.dataTables_length select').each(function() {
            const $select = $(this);
            if (!$select.parent().hasClass('select-position')) {
                $select.wrap('<div class="col-lg-2"><div class="select-style-1"><div class="select-position"></div></div></div>');
            }
        });

        // (1) 창고 필터가 바뀔 때 테이블 다시 draw
        $('body').on('change', '#warehouseCategory_clone', function() {
            table.draw();
        });

        // (2) 중분류 필터가 바뀔 때 소분류를 초기화하고 테이블 다시 draw
        $('body').on('change', '#midCategory_clone', function() {
            $('#subCategory_clone').val('');  // 소분류 리셋
            table.draw();
        });

        // (3) 소분류 필터가 바뀔 때, 소분류 -> 중분류 자동 보정
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

        // (4) 필터 초기화 버튼
        $('body').on('click', '#resetFilterBtn', function () {
            $('#warehouseCategory_clone').val('');
            $('#midCategory_clone').val('');
            $('#subCategory_clone').val('');
            table.draw();
        });

        // 7. 필터 이벤트: 드롭다운 변경 시 테이블 필터링
        $('#warehouseCategory, #midCategory, #subCategory, #productNameInput').on('change keyup', function() {
            table.draw();
        });

        // 7-1. 필터링 함수도 변경된 ID값을 기준으로 수정
        $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
            const selectedWarehouse = $('#warehouseCategory_clone').val();
            const selectedMid = $('#midCategory_clone').val();
            const selectedSub = $('#subCategory_clone').val();

            const warehouseName = data[1];  // "창고" 칼럼
            const categoryMid = data[3];   // "중분류" 칼럼
            const categorySub = data[4];   // "소분류" 칼럼

            // 1) 창고 필터
            if (selectedWarehouse && selectedWarehouse !== warehouseName) {
                return false;
            }
            // 2) 중분류 필터
            if (selectedMid && selectedMid !== categoryMid) {
                return false;
            }
            // 3) 소분류 필터
            if (selectedSub && selectedSub !== categorySub) {
                return false;
            }

            // 조건 만족 시 표시
            return true;
        });

    });

    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>
</script>
</body>
</html>
