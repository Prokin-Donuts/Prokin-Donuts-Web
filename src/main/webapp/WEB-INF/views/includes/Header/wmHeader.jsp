<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5 col-md-5 col-6">
                <div class="header-left d-flex align-items-center">
                    <div class="menu-toggle-btn mr-15">
                        <button id="menu-toggle" class="main-btn primary-btn btn-hover">
                            <i class="lni lni-chevron-left me-2"></i> Menu
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 col-md-7 col-6">
                <div class="header-right">
                    <!-- profile start -->
                    <div class="profile-box ml-15">
                        <button class="dropdown-toggle bg-transparent border-0" type="button" id="profile" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="profile-info">
                                <div class="info">
                                    <div class="image">
                                        <img src="<c:url value='/resources/images/profile/user_profile.png'/>" alt="" />
                                    </div>
                                    <div>
                                        <h6 class="fw-500">박창고</h6>
                                        <p>WM Admin</p>
                                    </div>
                                </div>
                            </div>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profile">
                            <li>
                                <div class="flex items-center !p-1">
                                    <div class="content-a">
                                        <h6>박창고</h6>
                                        <p>Email@gmail.com</p>
                                    </div>
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a  href="#mypageModal" data-bs-toggle="modal" id="btnmypageMenu">
                                    <i class="lni lni-user"></i> my page
                                </a>
                            </li>
                            <li>
                                <a href="<c:url value='/home/login'/>"> <i class="lni lni-exit"></i> Sign Out </a>
                            </li>
                        </ul>
                    </div>
                    <!-- profile end -->
                </div>
            </div>
        </div>
    </div>
</header>
