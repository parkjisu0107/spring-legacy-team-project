package com.spring.timecinema.reply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.timecinema.reply.entity.Reply;
import com.spring.timecinema.reply.service.ReplyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/reply")
@RequiredArgsConstructor
@Slf4j
public class ReplyController {
    
    private final ReplyService service;
    
    // 댓글 작성
    @PostMapping("/detail")
    public String registReply(Reply reply, HttpSession session, Model model) {
        System.out.println(reply.toString());
        model.addAttribute("reply", reply);
        int rowNum = reply.getRowNum();
        service.registReply(reply);
        return "redirect:/movie/detail/" + rowNum;
    }
    
     //댓글 리스트
    @GetMapping("/{rowNum}")
    @ResponseBody
    public List<Reply> getList(@PathVariable int rowNum ,Model model) {
        log.info("요청 들어옴 rowNum: {}", rowNum);
        log.info("요청 들어옴 getList: {}", service.getList(rowNum));
        return service.getList(rowNum);
    }
    
}