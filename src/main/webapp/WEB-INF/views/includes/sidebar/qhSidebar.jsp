<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<aside class="sidebar-nav-wrapper">
    <div class="navbar-logo">
        <a href="<c:url value='/qh/Dashboard'/>">
            <img src="<c:url value='/resources/images/logo/menu_logo.png'/>" alt="logo" />
        </a>
    </div>

    <nav class="sidebar-nav">
        <ul>
            <li class="nav-item nav-item-has-children nav-member">
                <a href="#0" class="collapsed" data-bs-toggle="collapse"
                   data-bs-target="#ddmenu_2" aria-controls="ddmenu_2"
                   aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon">
                        <i width="20" height="20" viewBox="0 0 20 20"
                           fill="none" class="lni lni-users"></i>
                    </span>
                    <span class="text">회원관리</span>
                </a>
                <ul id="ddmenu_2" class="collapse dropdown-nav">
                    <li class="nav-member-list">
                        <a href="<c:url value='/qh/member/list'/>" class="hover-text-grow">회원목록</a>
                    </li>
                    <li class="nav-member-request">
                        <a href="<c:url value='/qh/member/request'/>" class="hover-text-grow">회원 가입 요청 목록</a>
                    </li>
                </ul>
            </li>

            <li class="nav-item nav-warehouse">
                <a href="<c:url value='/qh/warehouse'/>">
                    <span class="icon">
                        <i width="20" height="20" viewBox="0 0 20 20"
                           fill="none" class="lni lni-home"></i>
                    </span>
                    <span class="text">창고관리</span>
                </a>
            </li>

            <li class="nav-item nav-franchise">
                <a href="<c:url value='/qh/franchise'/>">
                    <span class="icon">
                        <i width="20" height="20" viewBox="0 0 20 20"
                           fill="none" class="lni lni-apartment"></i>
                    </span>
                    <span class="text">가맹점관리</span>
                </a>
            </li>

            <li class="nav-item nav-inventory">
                <a href="<c:url value='/qh/inventory'/>">
                    <span class="icon">
                        <i width="20" height="20" viewBox="0 0 20 20"
                           fill="none" class="lni lni-package"></i>
                    </span>
                    <span class="text">재고관리</span>
                </a>
            </li>

            <li class="nav-item nav-product">
                <a href="<c:url value='/qh/product'/>">
                    <span class="icon">
                        <i width="20" height="20" viewBox="0 0 20 20"
                           fill="none" class="lni lni-chef-hat"></i>
                    </span>
                    <span class="text">제품관리</span>
                </a>
            </li>

            <li class="nav-item nav-item-has-children nav-inbound">
                <a href="#0" class="collapsed" data-bs-toggle="collapse"
                   data-bs-target="#ddmenu_55" aria-controls="ddmenu_55"
                   aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon">
                        <i width="20" height="20" viewBox="0 0 20 20"
                           fill="none" class="lni lni-cart"></i>
                    </span>
                    <span class="text">입고관리</span>
                </a>
                <ul id="ddmenu_55" class="collapse dropdown-nav">
                    <li class="nav-inbound-request">
                        <a href="<c:url value='/qh/inbound/request'/>" class="hover-text-grow">입고 요청 목록</a>
                    </li>
                    <li class="nav-inbound-status">
                        <a href="<c:url value='/qh/inbound/status'/>" class="hover-text-grow">입고현황</a>
                    </li>
                </ul>
            </li>

            <li class="nav-item nav-outbound">
                <a href="<c:url value='/qh/outbound'/>">
                    <span class="icon">
                        <i width="20" height="20" viewBox="0 0 20 20"
                           fill="none" class="lni lni-delivery"></i>
                    </span>
                    <span class="text">출고관리</span>
                </a>
            </li>
        </ul>
    </nav>
</aside>

<style>
    .sidebar-nav-wrapper {
        visibility: hidden;
    }

    /* 상위 메뉴 강조 */
    .sidebar-nav .nav-item.active > a {
        background-color: transparent;
    }

    .sidebar-nav .nav-item.active i {
        color: #FF9D32 !important;
    }

    /* 하위 메뉴 열기 */
    .sidebar-nav .dropdown-nav.show {
        display: block;
    }

    /* 하위 메뉴 - 기본은 흐리게 */
    .sidebar-nav .dropdown-nav li > a {
        color: #bbb;
    }

    /* 하위 메뉴 - 선택된 항목은 진하게 */
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
            { keyword: '/qh/member/list', selector: '.nav-member-list', parent: '.nav-member' },
            { keyword: '/qh/member/request', selector: '.nav-member-request', parent: '.nav-member' },
            { keyword: '/qh/warehouse', selector: '.nav-warehouse' },
            { keyword: '/qh/franchise', selector: '.nav-franchise' },
            { keyword: '/qh/inventory', selector: '.nav-inventory' },
            { keyword: '/qh/product', selector: '.nav-product' },
            { keyword: '/qh/inbound/request', selector: '.nav-inbound-request', parent: '.nav-inbound' },
            { keyword: '/qh/inbound/status', selector: '.nav-inbound-status', parent: '.nav-inbound' },
            { keyword: '/qh/outbound', selector: '.nav-outbound' },
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
        document.querySelector('.sidebar-nav-wrapper').style.visibility = 'visible';
    });
</script>

<div class="overlay"></div>