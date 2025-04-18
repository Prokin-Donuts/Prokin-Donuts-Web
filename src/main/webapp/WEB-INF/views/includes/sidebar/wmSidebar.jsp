<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<aside class="sidebar-nav-wrapper">
    <div class="navbar-logo">
        <a href="<c:url value='wm/Dashboard'/>">
            <img src="<c:url value='/resources/images/logo/menu_logo.png'/>" alt="logo" />
        </a>
    </div>
    <nav class="sidebar-nav">
        <ul>
            <li class="nav-item nav-member">
                <a href="<c:url value='/wm/member'/>">
          <span class="icon">
            <i class="lni lni-users"></i>
          </span>
                    <span class="text">회원관리</span>
                </a>
            </li>

            <li class="nav-item nav-warehouse">
                <a href="<c:url value='/wm/warehouse'/>">
          <span class="icon">
            <i class="lni lni-home"></i>
          </span>
                    <span class="text">창고관리</span>
                </a>
            </li>

            <li class="nav-item nav-item-has-children nav-inbound">
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
            <i class="lni lni-cart"></i>
          </span>
                    <span class="text">입고관리</span>
                </a>
                <ul id="ddmenu_55" class="collapse dropdown-nav ">
                    <li class="nav-inbound-request">
                        <a href="<c:url value='/wm/inbound/request'/>" class="hover-text-grow">입고요청</a>
                    </li>
                    <li class="nav-inbound-approval">
                        <a href="<c:url value='/wm/inbound/approval'/>" class="hover-text-grow">입고관리</a>
                    </li>
                    <!-- <li>
                        <a href="<c:url value='/wm/inbound/modify'/>" class="hover-text-grow">입고수정/취소</a>
                    </li> -->
                    <li class="nav-inbound-status">
                        <a href="<c:url value='/wm/inbound/status'/>" class="hover-text-grow">입고현황</a>
                    </li>
                </ul>
            </li>
            <li class="nav-item nav-outbound">
                <a href="<c:url value='/wm/outbound'/>">
          <span class="icon">
            <i class="lni lni-delivery"></i>
          </span>
                    <span class="text">출고관리</span>
                </a>
            </li>
        </ul>
    </nav>
</aside>

<style>
    .sidebar-nav-wrapper {
        visibility: hidden; /* 깜빡임 방지용 */
    }

    .sidebar-nav .nav-item.active > a {
        background-color: transparent !important;
    }

    .sidebar-nav .nav-item.active i {
        color: #FF9D32 !important;
    }

    .sidebar-nav .nav-item.active .text {
        color: #1c1c1c !important;
        font-weight: bold;
    }

    .sidebar-nav .dropdown-nav.show {
        display: block;
    }

    .sidebar-nav .dropdown-nav li > a {
        color: #bbb;
    }

    .sidebar-nav .dropdown-nav li.active > a {
        color: #1c1c1c !important;
        font-weight: bold !important;
        font-size: 1.05rem !important;
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const path = window.location.pathname;

        const map = [
            { keyword: '/wm/member', selector: '.nav-member' },
            { keyword: '/wm/warehouse', selector: '.nav-warehouse' },
            { keyword: '/wm/inbound/request', selector: '.nav-inbound-request', parent: '.nav-inbound' },
            { keyword: '/wm/inbound/approval', selector: '.nav-inbound-approval', parent: '.nav-inbound' },
            { keyword: '/wm/inbound/status', selector: '.nav-inbound-status', parent: '.nav-inbound' },
            { keyword: '/wm/outbound', selector: '.nav-outbound' }
        ];

        map.forEach(item => {
            if (path.startsWith(item.keyword)) {
                const target = document.querySelector(item.selector);
                if (target) target.classList.add('active');

                if (item.parent) {
                    const parent = document.querySelector(item.parent);
                    if (parent) {
                        parent.classList.add('active');
                        const submenu = parent.querySelector('.dropdown-nav');
                        if (submenu) submenu.classList.add('show');
                    }
                }
            }
        });

        // 깜빡임 방지 → 강조 완료 후 보여줌
        document.querySelector('.sidebar-nav-wrapper').style.visibility = 'visible';
    });
</script>

<div class="overlay"></div>
