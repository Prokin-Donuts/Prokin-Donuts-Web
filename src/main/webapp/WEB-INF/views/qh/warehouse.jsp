

<!-- ======== common-header start =========== -->
<%@ include file="/WEB-INF/views/includes/common/Header.jsp" %>
<!-- ======== common-header end =========== -->

<!-- ======== sidebar-nav start =========== -->

<%@include file="/WEB-INF/views/includes/sidebar/qhSidebar.jsp"%>
<!-- ======== sidebar-nav end =========== -->

<!-- ======== main-wrapper start =========== -->
<main class="main-wrapper">
    <!-- ========== header start ========== -->
    <%@include file="/WEB-INF/views/includes/header/LoginMemberHeader.jsp"%>
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
                    <div class="card-style mb-30 map-wrapper" style="height: max(600px, calc(100vh - 100px)); display: flex; flex-direction: column;">
                        <h6 class="mb-10" style="">창고 위치</h6>
                        <div style="flex: 1; overflow: hidden;">
                            <div id="map" style="width: 100%; height: 100%;"></div>
                        </div>
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
                                    <button class="main-btn warning-btn-outline btn-hover btn-sm btn-xs" id="btnWarehouseAdd">창고 등록</button>
                                </div>
                            </div>

                        </div>

                        <div class="table-wrapper table-responsive p-0">


                            <!-- Start table -->
                            <table id="datatable" class="table striped-table w-100" style="width:100%">

                                <!-- colgroup를 통해 열 폭을 강제 지정 -->
                                <colgroup>
                                    <col style="width: 12%;" />
                                    <col style="width: 20%;" />
                                    <col style="width: 24%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 10%;" />
                                    <col style="width: 12%;" />
                                    <col style="width: 12%;" />
                                </colgroup>

                                <thead>
                                <tr>
                                    <th>창고코드</th>
                                    <th>창고명</th>
                                    <th>소재지</th>
                                    <th>수용한도</th>
                                    <th>담당자</th>
                                    <th>이메일</th>
                                    <th>수정 | 취소</th> <!-- 수정/삭제 열 -->
                                    <th style="display: none;"></th>
                                    <th style="display: none;"></th>
                                </tr>
                                </thead>

                                <tbody>
                                <c:forEach var="w" items="${warehouseList}">
                                    <tr
                                            data-warehouse-code="${w.warehouseCode}"
                                            data-warehouse-name="${w.warehouseName}"
                                            data-warehouse-addr="${w.address}"
                                            data-status="${w.status}"
                                            data-member-code="${w.memberCode}"
                                            data-member-name="${w.memberName}">
                                        <td>${w.warehouseCode}</td>
                                        <td>${w.warehouseName}</td>
                                        <td>${w.address}</td>
                                        <td><fmt:formatNumber value="${w.capacityLimit}" type="number" groupingUsed="true"/> ㎡</td>
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
                                        <td>
                                            <div class="btn-group-2">
                                                <button class="btn btn-edit text-primary-2" data-code="${w.warehouseCode}">
                                                    <i class="lni lni-pencil"></i>
                                                </button>
                                                <button class="btn btn-delete text-danger" data-code="${w.warehouseCode}">
                                                    <i class="lni lni-trash-can"></i>
                                                </button>
                                            </div>
                                        </td>
                                        <td style="display: none;">${w.status}</td>
                                        <td style="display: none;">${w.memberCode}</td>
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
                                                class="form-control number-comma"
                                                id="capacity"
                                                name="capacityLimit"
                                                placeholder="한도를 입력하세요"
                                        />
                                        <span class="input-group-text">㎡</span>
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
                                        <c:forEach var="m" items="${unassignedWMs}">
                                            <option value="${m.memberCode}">${m.memberCode} | ${m.name}</option>
                                        </c:forEach>
                                        <option value="null">담당자 없음</option>
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

    <!-- ========== common-footer start =========== -->
    <%@ include file="/WEB-INF/views/includes/common/Footer.jsp" %>
    <!-- ========== common-footer end =========== -->
</main>
<!-- ======== main-wrapper end =========== -->

<!-- ========== Javascript start =========== -->
<%@ include file="/WEB-INF/views/includes/common/Javascript.jsp" %>
<!-- ========== Javascript end =========== -->

<!-- 다음 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- Kakao Maps SDK -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2a5f2e41113ad6da9ca9746f7bcb47f6&libraries=services"></script>
<script>
    document.addEventListener('DOMContentLoaded', async function() {
        var map = new kakao.maps.Map(document.getElementById('map'), {
            center: new kakao.maps.LatLng(36.5, 127.5),
            level: 7
        });
        var geocoder = new kakao.maps.services.Geocoder();
        var rows = Array.prototype.slice.call(document.querySelectorAll('#datatable tbody tr'));
        var bounds = new kakao.maps.LatLngBounds();

        // 화면 어디 클릭해도 강조 해제 (단, 테이블 tr 클릭은 제외)
        document.body.addEventListener('click', function(e) {
            if (!e.target.closest('tr')) {
                rows.forEach(function(r) { r.classList.remove('highlighted'); });
            }
        });

        // 행 강조 + 지도 확대·이동 함수
        window.highlightWarehouse = function(warehouseName) {
            rows.forEach(function(r) { r.classList.remove('highlighted'); });
            var match = rows.find(function(r) {
                return r.dataset.warehouseName === warehouseName;
            });
            if (!match) return;
            match.classList.add('highlighted');
            match.scrollIntoView({ behavior: 'smooth', block: 'center' });
            var lat = match.dataset.lat, lng = match.dataset.lng;
            if (lat && lng) {
                var pos = new kakao.maps.LatLng(lat, lng);
                map.setLevel(3);
                setTimeout(function() { map.panTo(pos); }, 100);
            }
        };

        // 지도 클릭 → 우편번호 팝업·모달 (기존 기능)
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            geocoder.coord2Address(
                mouseEvent.latLng.getLng(),
                mouseEvent.latLng.getLat(),
                function(result, status) {
                    if (status !== kakao.maps.services.Status.OK) return;
                    var roadAddr = result[0].road_address
                        ? result[0].road_address.address_name
                        : result[0].address.address_name;
                    new daum.Postcode({
                        autoClose: true,
                        oncomplete: function(data) {
                            $('#zonecode_disp').val(data.zonecode);
                            $('#zonecode_hidden').val(data.zonecode);
                            $('#roadAddress_disp').val(data.roadAddress);
                            $('#roadAddress_hidden').val(data.roadAddress);
                            $('#warehouseAddModal').modal('show');
                            $('#detailAddress_disp').val('').focus();
                        }
                    }).open({ q: roadAddr });
                }
            );
        });

        // 각 행마다 → 마커·클릭박스·라벨·bounds
        await Promise.all(rows.map(function(row) {
            return new Promise(function(resolve) {
                var addr = row.dataset.warehouseAddr;
                var name = row.dataset.warehouseName;
                geocoder.addressSearch(addr, function(res, status) {
                    if (status === kakao.maps.services.Status.OK) {
                        var lat = res[0].y, lng = res[0].x;
                        var pos = new kakao.maps.LatLng(lat, lng);

                        // 1) 기본 마커
                        var marker = new kakao.maps.Marker({
                            map: map,
                            position: pos,
                            clickable: true
                        });

                        // 2) 마커 클릭 → 행 하이라이트
                        kakao.maps.event.addListener(marker, 'click', function() {
                            // 기존 초기화
                            rows.forEach(function(r) { r.classList.remove('highlighted'); });
                            // 이 row만 하이라이트
                            row.classList.add('highlighted');
                            row.scrollIntoView({ behavior: 'smooth', block: 'center' });
                            // 지도 확대·이동
                            map.setLevel(3);
                            setTimeout(function() { map.panTo(pos); }, 100);
                        });

                        // 3) 클릭박스 오버레이 (60×60) → highlightWarehouse 호출
                        var clickBoxHtml = ''
                            + '<div style="'
                            +   'width:60px;height:60px;'
                            +   'background:transparent;'
                            +   'position:absolute;'
                            +   'transform:translate(-50%,-100%);'
                            +   'cursor:pointer;'
                            +   'z-index:10;'
                            + '" '
                            + 'onclick="event.stopPropagation(); highlightWarehouse(\''
                            +   name
                            + '\');"></div>';

                        new kakao.maps.CustomOverlay({
                            map: map,
                            position: pos,
                            content: clickBoxHtml,
                            yAnchor: 1,
                            clickable: true
                        });

                        // 4) 라벨 오버레이 (pointer-events:none)
                        var labelHtml = ''
                            + '<div style="'
                            +   'pointer-events:none;'
                            +   'display:inline-block;'
                            +   'padding:4px 8px;'
                            +   'font-size:12px;'
                            +   'white-space:nowrap;'
                            +   'text-align:center;'
                            +   'background:rgba(255,255,255,0.9);'
                            +   'border:1px solid rgba(0,0,0,0.2);'
                            +   'border-radius:4px;'
                            +   'box-shadow:0 1px 4px rgba(0,0,0,0.2);'
                            +   'transform:translateY(-35px);'
                            + '">'
                            +   name
                            + '</div>';

                        new kakao.maps.CustomOverlay({
                            map: map,
                            position: pos,
                            content: labelHtml,
                            yAnchor: 1,
                            clickable: false
                        });

                        // 5) 좌표 저장 & bounds 확장
                        row.dataset.lat = lat;
                        row.dataset.lng = lng;
                        bounds.extend(pos);
                    }
                    resolve();
                });
            });
        }));

        // 초기 화면: 모든 마커 보이기
        map.setBounds(bounds);

        // 테이블 행 클릭 → 강조/이동
        rows.forEach(function(row) {
            row.addEventListener('click', function(e) {
                // 버튼 클릭 시에는 행 클릭 무시
                if (e.target.closest('.btn-edit') || e.target.closest('.btn-delete')) return;

                e.stopPropagation();
                highlightWarehouse(row.dataset.warehouseName);
            });
        });

        // 확대/축소 컨트롤 (기존)
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
    });
</script>

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
            { "id": "SJ", "name": "세종특별자치시" },
            { "id": "ETC", "name": "기타" }
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
                { targets: [0, 1, 2, 3, 4, 5, 6, 8], className: 'text-center' } // JS 속성으로 가운데 정렬

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

                const api = this.api();

                setTimeout(() => {
                    api.draw(false);
                }, 0);
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

        // 폼 초기화 함수
        function resetRegisterForm() {
            // HTMLFormElement.reset() 으로 기본 input 값(placeholder 외) 모두 초기화
            $('#warehouseRegisterForm')[0].reset();

            // hidden 필드, 플래그, 버튼 상태도 명시적으로 초기화
            $('#zonecode_disp, #roadAddress_disp, #detailAddress_disp').val('');
            $('#zonecode_hidden, #roadAddress_hidden, #detailAddress_hidden, input[name="address"]').val('');
            isWarehouseNameChecked = false;

            $('#search-btn').prop('disabled', false).removeClass('disabled');
        }

        // 모달이 완전히 닫혔을 때
        $('#warehouseAddModal').on('hidden.bs.modal', function() {
            resetRegisterForm();
        });

        // 1. 등록 모달 열기
        $("#btnWarehouseAdd_clone").on("click", function () {
            resetRegisterForm();
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
            const capacity = $("#capacity").val().replace(/,/g, '').trim();
            const regName = /^[A-Za-z0-9가-힣]{1,10}$/;
            const regCap = /^[0-9]+$/;
            // 상세주소: 한글, 영어, 숫자, 띄어쓰기, 특수문자 허용
            const regDetail = /^[\uAC00-\uD7A3A-Za-z0-9\s~`!@#$%^&*()\-_=+\[\]{};:'",.<>\/?\\|]*$/;

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

            if (!regDetail.test(detailAddress)) {
                alert("상세주소는 한글, 영어, 숫자, 띄어쓰기 및 특수문자만 입력 가능합니다.");
                return false;
            }

            if (!isWarehouseNameChecked) {
                alert("창고명 중복확인을 해주세요.");
                return false;
            }

            alert("창고가 성공적으로 등록되었습니다.");
            // address 하나로 합쳐서 hidden 필드 추가
            const $existing = $("input[name='address']");
            const fullAddress = (roadAddress + " " + detailAddress).replace(/^,/, "").trim();
            if ($existing.length > 0) {
                $existing.val(fullAddress); // 기존 필드 있으면 값만 바꿈
            } else {
                $("<input>").attr({
                    type: "hidden",
                    name: "address",
                    value: fullAddress
                }).appendTo(this);
            }
        });

        let isModifyNameChecked = true;

        // 1. 수정 버튼 클릭 시 - 모달 열기
        $('#datatable tbody').on('click', '.btn-edit', function (e) {
            e.preventDefault();

            const $tr = $(this).closest('tr');
            const rowData = table.row($tr).data();

            const code = rowData[0];        // 창고코드
            const name = rowData[1];        // 창고명
            const memberCode = rowData[8];  // 숨겨진 td: 담당자코드
            const memberName = rowData[4];  // 담당자이름

            // 모달 input 세팅
            $('#modifyWarehouseCode').val(code);
            $('#modifyWarehouseName').val(name);

            const $selectTag = $('#modifyWarehouseMember');

            // 1. 이전에 추가한 현재 담당자 option 제거
            $selectTag.find('option[data-current="true"]').remove();

            // 2. 현재 값 선택 또는 새로 추가
            const $select = $('#modifyWarehouseMember');
            if ($select.find("option[value='" + memberCode + "']").length > 0) {
                $select.val(memberCode);
            } else {
                if (memberCode) {
                    const label = memberCode + " | " + memberName;
                    $select.prepend(`<option value="` + memberCode + `" selected data-current="true" selected>` + label +` </option>`);
                    $select.val(memberCode);
                } else {
                    // 담당자 없는 경우에는 '담당자 없음'을 선택
                    $select.val("null");
                }
            }

            // 중복확인 상태 초기화
            isModifyNameChecked = true;

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
                    const isDup = (text === 'true');
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
            alert("창고 정보가 성공적으로 수정되었습니다.");  // ← 이 줄 추가
        });

        // 삭제 버튼 클릭 시
        $(document).on('click', '.btn-delete', function(e) {
            e.preventDefault();

            var $tr = $(this).closest('tr');
            var warehouseCode = $tr.data('warehouse-code');
            var warehouseName = $tr.data('warehouse-name');
            var status        = $tr.data('status') || '';
            var memberCode    = $tr.data('member-code') || '';
            var memberName    = $tr.data('member-name') || '담당자없음';

            // 배지 클래스
            var badgeClass = (status === '삭제가능') ? 'bg-success' : 'bg-secondary';
            var badge = '<span class="badge ' + badgeClass + '">' + status + '</span>';

            // 리스트 아이템 HTML
            var liHTML =
                '<li class="list-group-item d-flex justify-content-between align-items-center">' +
                warehouseName + ' (' +
                (memberCode ? (memberCode + ' | ' + memberName) : '담당자없음') +
                ')' +
                badge +
                '</li>';

            // 모달 form hidden 세팅
            $('#deleteWarehouseCode').val(warehouseCode);

            // 내용 초기화
            $('#deleteContentOk').hide().empty();
            $('#deleteContentNo').hide().empty();

            if (status === '삭제가능') {
                $('#deleteContentOk')
                    .html(
                        '<h5>선택한 창고를 정말 삭제하시겠습니까?</h5><br>' +
                        '<ul class="list-group mb-3">' + liHTML + '</ul>'
                    )
                    .show();
                $('#confirmDeleteWarehouse').show();
            } else {
                $('#deleteContentNo')
                    .html(
                        '<h5>선택한 창고는 진행 중인 업무로 인해 삭제할 수 없습니다.</h5><br>' +
                        '<ul class="list-group mb-3">' + liHTML + '</ul>'
                    )
                    .show();
                $('#confirmDeleteWarehouse').hide();
            }

            // 모달 띄우기
            $('#warehouseDeleteModal').modal('show');
        });

        // 삭제 폼 전송
        $('#confirmDeleteWarehouse').on('click', function() {
            if ($(this).is(':hidden')) {
                alert('삭제할 수 없는 창고입니다.');
                return;
            }
            alert("창고가 성공적으로 삭제되었습니다.");
            $('#warehouseDeleteForm').submit();
        });

    });
    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>

</script>
</body>
</html>
