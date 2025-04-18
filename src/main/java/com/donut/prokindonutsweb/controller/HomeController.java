package com.donut.prokindonutsweb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    // 루트 요청 시 "/home/login"으로 리다이렉트
    @GetMapping("/")
    public String redirectToLogin() {
        return "redirect:/home/login";
    }

    /*jsp test*/
    @GetMapping("/home/login")
    public void login(){}

    @GetMapping("/home/signup")
    public void signup(){}

    @GetMapping("/home/findId")
    public void findId(){}

    @GetMapping("/home/findPassword")
    public void findPassword(){}

    @GetMapping("/fm/order")
    public void Forder(){}

    @GetMapping("/wm/outbound")
    public void Woutbound(){}


    @GetMapping("/wm/inbound/status")
    public void Wstatus(){}


    @GetMapping("/wm/inbound/approval")
    public void Wapproval(){}

    @GetMapping("/wm/warehouse")
    public void Wwarehouse(){}

    @GetMapping("/wm/inbound/request")
    public void Wrequest(){}

    @GetMapping("/wm/Dashboard")
    public void WDashboard(){}

    @GetMapping("/qh/Dashboard")
    public void QDashboard(){}

    @GetMapping("/qh/inbound/request")
    public void QIrequest(){}

    @GetMapping("/qh/inbound/status")
    public void QIstatus(){}

    @GetMapping("/qh/member/list")
    public void QMlist(){}

    @GetMapping("/qh/member/request")
    public void QMrequest(){}

    @GetMapping("/qh/franchise")
    public void Qfranchise(){}

    @GetMapping("/qh/inventory")
    public void Qinventory(){}

    @GetMapping("/qh/outbound")
    public void Qoutbound(){}

    @GetMapping("/qh/product")
    public void Qproduct(){}

    @GetMapping("/qh/warehouse")
    public void Qwarehouse(){}

}
