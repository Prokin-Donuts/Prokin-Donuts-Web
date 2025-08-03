<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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

<!-- 커서 디자인 -->
<div class="cursor">
    <img src="<c:url value='/resources/images/logo/donut.svg'/>" alt="cursor">
</div>
<!-- ======== sidebar-nav start =========== -->
<%@include file="/WEB-INF/views/includes/sidebar/wmSidebar.jsp"%>
<!-- ======== sidebar-nav end =========== -->

<!-- ======== main-wrapper start =========== -->
<main class="main-wrapper">
    <!-- ========== header start ========== -->
    <%@include file="/WEB-INF/views/includes/header/LoginMemberHeader.jsp"%>
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
                            <h2>출고관리</h2>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ========== title-wrapper end ========== -->

            <!-- Start col -->
            <div class="col-lg">
                <!-- Start card -->
                <div class="card-style mb-30">
                    <h6 class="mb-10">출고요청 목록
                        <label>
                            <i
                                    class="mdi mdi-help-circle text-primary"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="right"
                                    data-bs-html="true"
                                    data-bs-custom-class="wide-tooltip"
                                    title="<b>승인</b>: 출고 요청을 승인한다.<br>승인된 요청은 출고현황에서 확인할 수 있다.<br>"
                                    style="cursor: pointer;">
                            </i>
                        </label>
                    </h6>

                    <p class="text-sm mb-20">
                        <!-- 원하는 필터(중분류, 소분류) 설정 -->
                        <div id="myCustomFilters" style="display: none;">
                            <div class="d-flex align-items-center gap-2" style="margin-top: -30px;">
                                <div class="btu-group-1 d-flex gap-2">
                                    <button class="main-btn warning-btn-outline btn-hover btn-sm btn-xs" id="btnBulkApprove">승인</button>
                                </div>
                            </div>
                        </div>
                    </p>
                    <div class="table-wrapper table-responsive p-0">


                        <!-- Start table -->
                        <table id="datatable" class="table striped-table w-100" style="width:100%">

                            <!-- colgroup를 통해 열 폭을 강제 지정 -->
                            <colgroup>
                                <col style="width: 10%; background-color: null;" />
                                <col style="width: 18%; background-color: null;" />
                                <col style="width: 14%; background-color: null;" />
                                <col style="width: 13%; background-color: null;" />
                                <col style="width: 10%; background-color: null;" />
                                <col style="width: 20%; background-color: null;" />
                                <!-- <col style="width: 10%; background-color: null;" /> -->
                            </colgroup>

                            <thead>
                            <tr>
                                <th><input type="checkbox" id="select-all"></th>
                                <th>출고코드</th>
                                <th>출고요청일</th>
                                <th>제품코드</th>
                                <th>제품명</th>
                                <th>수량(개)</th>
                                <th>가맹점코드</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="outbound" items="${outboundList}">
                                <tr>
                                    <td><input type="checkbox" class="row-checkbox" /></td>
                                    <td>${outbound.outboundCode}</td>
                                    <td>${outbound.outboundDate}</td>
                                    <td>${outbound.productCode}</td>
                                    <td>${outbound.productName}</td>
                                    <td>${outbound.quantity}</td>
                                    <td>${outbound.franchiseCode}</td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- 승인 모달 (일괄 승인용) -->
        <form id="outboundApproveForm" method="post" action="/wm/outbound/approval" accept-charset="UTF-8">
            <div class="modal fade" id="approveModal" tabindex="-1" aria-labelledby="approveModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h3 class="modal-title" id="approveModalLabel">출고요청 일괄 승인</h3>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
                        </div>
                        <div class="modal-body">
                            <h5>선택한 출고요청을 승인하겠습니까?</h5><br>
                            <ul id="approvalList" class="list-group mb-3">
                                <!-- 선택된 출고요청 목록 삽입 -->
                            </ul>
                            <div class="d-flex justify-content-end gap-2">
                                <button type="button" class="main-btn primary-btn btn-hover text-center" id="confirmApproval">승인</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>

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

<!-- 커서 디자인 -->
<script>
    // body 맨 아래에 한 번만!
    const cursorEl = document.querySelector('.cursor');
    let shown = false;

    document.addEventListener('mousemove', e => {
        // 좌표 업데이트
        cursorEl.style.left = e.clientX + 10 + 'px';
        cursorEl.style.top  = e.clientY + 10 + 'px';

        // 첫 움직임에만 보이게
        if (!shown) {
            cursorEl.classList.add('visible');
            shown = true;
        }
    });
</script>

<style>
    button:disabled {
        border: none !important; /* 테두리 제거 */
        background-color: transparent !important; /* 배경도 필요 시 투명하게 */
        box-shadow: none !important; /* 그림자도 제거 */
    }
</style>
<script>
    // Bootstrap 5 Tooltip 활성화 (모달 내부)
    document.addEventListener('DOMContentLoaded', function () {
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    });


    $(document).ready(function() {

        // 5. DataTable 초기화 (dom 옵션에 사용자 정의 영역 포함)
        var table = $('#datatable').DataTable({
            autoWidth: false,
            columnDefs: [
                { targets: [1, 2, 3, 4, 5], className: 'text-center' },
                { targets: 0, orderable: false, searchable: false }
            ],
            order: [[1, 'asc']],
            paging: true,
            pageLength: 10,
            lengthMenu: [[5, 10, 20, -1], ['5개', '10개', '20개', '전체']],
            searching: true,
            ordering: true,
            info: true,
            lengthChange: true,
            dom: '<"top"l<"myFilterArea">fr>t<"bottom"ip>', // request.jsp와 동일한 dom 설정
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

        // 6. 사용자 정의 필터 영역에 승인 버튼만 복제 (request.jsp와 동일한 방식)
        var $clone = $('#myCustomFilters').clone(true);
        $clone.find('#btnBulkApprove').attr('id', 'btnBulkApprove_clone');
        $clone.find('#btnBulkApprove').remove();
        $('div.myFilterArea').html($clone.html());


        // select 태그 감싸는 구조 적용
        $('.dataTables_length select').each(function() {
            const $select = $(this);
            if (!$select.parent().hasClass('select-position')) {
                $select.wrap('<div class="col-lg-2"><div class="select-style-1"><div class="select-position"></div></div></div>');
            }
        });

        // 모달 열릴 때마다 목록 갱신
        $('#outboundAddModal').on('show.bs.modal', function () {
            populateManagerDropdown();
        });


        // "Select All" 체크박스 이벤트
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
        $('#btnBulkApprove_clone').on('click', function (e) {
            const selectedData = [];
            $('#datatable tbody input.row-checkbox:checked').each(function () {
                const $tr = $(this).closest('tr');
                const rowData = {
                    outboundCode: $tr.find('td').eq(1).text().trim(),
                    productName: $tr.find('td').eq(4).text().trim(),
                    quantity: $tr.find('td').eq(5).text().trim()
                };
                selectedData.push(rowData);
            });

            if (selectedData.length === 0) {
                alert('승인할 출고 요청을 선택하세요.');
                return;
            }

            // 출고 요청 목록을 <ul> 안에 추가
            const $list = $('#approvalList');
            $list.empty();

            selectedData.forEach((item) => {
                const li = `
                    <li class="list-group-item d-flex justify-content-between align-items-center" data-outbound-code="`+ item.outboundCode +`">
                        <span>` + item.outboundCode + ` (` + item.productName + `)</span>
                        <span class="badge bg-secondary">` + item.quantity + `개 </span>
                    </li>
                `;
                $list.append(li);
            });

            // 승인 확인 버튼 클릭 시: form에 hidden input 추가하고 전송
            $('#confirmApproval').off('click').on('click', function (e) {
                const $form = $('#outboundApproveForm');
                $form.find('input[name="outboundCodeList"]').remove();

                $('#approvalList .list-group-item').each(function () {
                    const outboundCode = $(this).data('outbound-code');
                    const input = `<input type="hidden" name="outboundCodeList" value="` + outboundCode + `" />`;
                    $form.append(input);
                });

                const result = confirm('선택하신 출고 요청을 승인 하시겠습니까?');
                if (result) {
                    $form.submit();
                }
            });

            // 모달 열기
            const modal = new bootstrap.Modal(document.getElementById('approveModal'));
            modal.show();
        });
    });

    //mypageData
    <%@ include file="/WEB-INF/views/includes/mypage/mypageData.jsp" %>

</script>

<%--출고승인 완료 알림창--%>
<c:if test="${not empty approveSuccessMessage}">
    <script>
        alert('${approveSuccessMessage}');
    </script>
</c:if>

<%--출고수정 완료 알림창--%>
<c:if test="${not empty editSuccessMessage}">
    <script>
        alert('${editSuccessMessage}');
    </script>
</c:if>

<%--출고취소 완료 알림창--%>
<c:if test="${not empty deleteSuccessMessage}">
    <script>
        alert('${deleteSuccessMessage}');
    </script>
</c:if>

<c:if test="${not empty errorMessage}">
    <script>
        alert('${errorMessage}');
    </script>
</c:if>
</body>
</html>

