package com.gallery.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.gallery.domain.GalleryDTO;

import com.gallery.service.GalleryService;

import lombok.extern.log4j.Log4j;

import javax.swing.*;

@Controller
@RequestMapping("/gallery/*")
@Log4j
public class GalleryController {


    @Autowired
    private GalleryService galleryService;

    @RequestMapping(value ="main")
    public String list(Model model) {
        log.info("gallery main!!");
        // model로 list jsp에 뿌려줄 글 목록 전달

        model.addAttribute("list", galleryService.getGalleryList());
        return "gallery/galleryMain";
    }
    @RequestMapping(value ="upload")
    public String upload(Model model) {
        log.info("gallery upload!!");
        // model로 list jsp에 뿌려줄 글 목록 전달

        model.addAttribute("list", galleryService.getGalleryList());
        return "gallery/galleryUpload";
    }
    @RequestMapping(value ="uploadmetadata")
    public String uploadmetadata(Model model) {
        log.info("gallery uploadmetadata!!");
        // model로 list jsp에 뿌려줄 글 목록 전달

        model.addAttribute("list", galleryService.getGalleryList());
        return "gallery/galleryMetadata";
    }



//    @GetMapping("read")
//    public void read(Long bno, Model model, @ModelAttribute("  ")   teria   ) {
//        log.info("read!!!!!!!");
//        model.addAttribute("board", service.get(bno));
//    }
//
//    @PreAuthorize("isAuthenticated()") // 로그인한 사용자만 접근 가능하게
//    @GetMapping("modify")
//    public void modifyForm(Long bno, Model model, @ModelAttribute("  ")   teria   ) {
//        log.info("modifyForm!!!!!!!");
//        model.addAttribute("board", service.get(bno));
//    }
//
//    @PreAuthorize("principal.useranme == #gallery.writer") // 작성자와 로그인한 사람이 같은지 확인
//    @PostMapping("modify")
//    public String modify(BoardVO board , RedirectAttributes rttr) {
//        // 수정처리
//        if(service.modify(board)) {
//            log.info("************ 수정성공!!!!!!!!!!!!! ************");
//            rttr.addFlashAttribute("result", "success");
//        }
//        return "redirect:/board/list" +   .getListLink();
//    }
//
//    @PreAuthorize("principal.useranme == #writer") // 작성자와 로그인한 사람이 같은지 확인
//    @PostMapping("delete")
//    public String delete(Long bno, String writer , RedirectAttributes rttr) {
//        // 삭제 처리
//        if(service.delete(bno)) {
//            log.info("*********** 삭제 성공!!!!!!! ************");
//            rttr.addFlashAttribute("result", "success");
//        }
//        return "redirect:/board/list" +   .getListLink();
//    }
//
//    // 글 등록 폼
//    @GetMapping("write")
//    @PreAuthorize("isAuthenticated()") // 로그인한 사용자만 접근 가능하게
//    public void write() {
//    }
//    // 글 등록 처리
//    @PreAuthorize("isAuthenticated()") // 로그인한 사용자만 접근 가능하게
//    @PostMapping("write")
//    public String writeBoard(BoardVO board, RedirectAttributes rttr) {
//        log.info("write 처리 : " + board);
//
//        service.register(board);
//        // RedirectAttributes : Model처럼 스프링MVC가 자동으로 전달해주는 객체
//        // addFlashAttribute(key, value) : url뒤에 데이터가 붙지 않고,
//        //		일회성 데이터로 페이지를 새로고침하면 데이터 날라감.
//        //		값 1개만 전달가능, 2개이상은 데이터가 소멸하므로 Map 이용해 한번에 보내야함.
//        // addAttribute(key, value)
//        // 위와 같은 메서드를 이용하여 리다이렉트되는 jsp 페이지에 데이터 전달할수 있다.
//
//        rttr.addFlashAttribute("result", gallery.getBno());
//        // 등록처리후 글 고유번호 속성으로 추가해서 전달 (list에서 사용)
//
//        return "redirect:/board/list";
//    }







}
