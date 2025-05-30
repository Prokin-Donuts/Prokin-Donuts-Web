

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
    <section class="section">
        <div class="container-fluid">
            <!-- ========== title-wrapper start ========== -->
            <div class="title-wrapper pt-30">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <div class="title">
                            <h2>회원관리</h2>
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
                                    <th>요청 코드</th>
                                    <th>성함</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>주소</th>
                                    <th>아이디</th>
                                    <th>요청상태</th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="request" items="${requestList}">
                                    <tr data-password="${request.password}">
                                        <td><input type="checkbox" class="row-checkbox" /></td>
                                        <td>${request.requestDate}</td>
                                        <td>${request.requestCode}</td>
                                        <td>${request.name}</td>
                                        <td>${request.phoneNumber}</td>
                                        <td>${request.email}</td>
                                        <td>${request.address}</td>
                                        <td>${request.id}</td>
                                        <td>${request.request}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal HTML Start -->
            <!-- 승인 모달 -->
            <form id="approvalForm" method="post" action="/qh/member/approval" accept-charset="UTF-8">
            <div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="approveModalLabel">회원가입 요청 승인</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <h5>선택한 회원의 가입요청을 승인하겠습니까?</h5><br>
                            <ul id="approvalList" class="list-group mb-3">
                                <!-- 선택된 회원 목록 삽입 -->
                            </ul>
                            <div class="d-flex justify-content-end gap-2">
                                <button type="button" class="main-btn primary-btn btn-hover text-center" id="confirmApproval">승인</button>
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

    <!-- ========== common-footer start =========== -->
    <%@ include file="/WEB-INF/views/includes/common/Footer.jsp" %>
    <!-- ========== common-footer end =========== -->
</main>
<!-- ======== main-wrapper end =========== -->

<!-- ========== Javascript start =========== -->
<%@ include file="/WEB-INF/views/includes/common/Javascript.jsp" %>
<!-- ========== Javascript end =========== -->
<script>
    var table = $('#datatable').DataTable({
        autoWidth: false,
        columnDefs: [
            { width: '95px', targets: -1 },  // Actions 열 너비
            { targets: [1, 2, 3, 4, 5, 6], className: 'text-center' }, // JS 속성으로 가운데 정렬
            {targets: 0, orderable: false, searchable: false} // 체크박스 컬럼

        ],
        order: [[1, 'asc']],
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
            const api = this.api();

            setTimeout(() => {
                api.draw(false);
            }, 0);
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
        const selectedData = [];

        $('#datatable tbody input.row-checkbox:checked').each(function () {
            const $tr = $(this).closest('tr');
            const rowData = {
                id: $tr.find('td').eq(7).text().trim(),      // 아이디
                name: $tr.find('td').eq(3).text().trim(),    // 성함
                requestCode: $tr.find('td').eq(2).text().trim(),  // 요청 코드
                request: $tr.find('td').eq(8).text().trim()  // 요청 상태
            };
            selectedData.push(rowData);
        });

        if (selectedData.length === 0) {
            alert('승인할 요청을 선택하세요.');
            return;
        }

        // 회원 목록을 <ul> 안에 추가
        const $list = $('#approvalList');
        $list.empty(); // 기존 내용 비우고

        selectedData.forEach((item) => {
            const li = `
      <li class="list-group-item d-flex justify-content-between align-items-center" data-request-code="`+ item.requestCode +`">
        <span>` + item.name + ` (` + item.id + `)</span>
        <span class="badge bg-secondary">` + item.request + `</span>
      </li>
    `;
            $list.append(li);
        });


    // 승인 확인 버튼 클릭 시: form에 hidden input 추가하고 전송
        $('#confirmApproval').off('click').on('click', function (e) {
        const $form = $('#approvalForm');

        // 혹시 이전에 추가된 hidden input이 있으면 제거
        $form.find('input[name="requestCodeList"]').remove();

        $('#approvalList .list-group-item').each(function () {
            const requestCode = $(this).data('request-code');
            const input = `<input type="hidden" name="requestCodeList" value="` + requestCode + `" />`;
            $form.append(input);
        });

        const result = confirm('선택하신 회원을 승인 하시겠습니까?');
        if (result) {
            console.log('승인');
            $form.submit();
        } else {
            console.log('승인 취소');
        }
    });

        // 모달 열기
        $('#approveModal').modal('show');
    });

    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>

</script>
</body>
</html>