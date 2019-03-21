package com.ajax.cn.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AjaxController {
    @RequestMapping("/")
    public String index() {
        return "ajaxFirst";
    }

    @RequestMapping("/ajaxTest")
    public String selectWork(String id) {
        System.out.println(id);
        return "index";
    }
}
