package com.gallery.controller;

import com.gallery.domain.Gallery_Criteria;
import com.gallery.domain.Gallery_PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
    public String list(Model model, Gallery_Criteria cri) {
        log.info("gallery main!!");

//        // model로 list jsp에 뿌려줄 글 목록 전달
        model.addAttribute("main", galleryService.getGalleryList(cri));
        log.info("************ cri : " + cri);
//
        int total = galleryService.getTotal(cri); // 게시글 개수 가져오기
        log.info("******************* total : " + total);
        model.addAttribute("pager", new Gallery_PageDTO(cri, total));

        return "gallery/galleryMain";
    }

    @PreAuthorize("isAuthenticated()") // 로그인한 사용자만 접근 가능하게
    @GetMapping("single")
    public void gallerySingle(Long G_NO, Model model, @ModelAttribute("cri") Gallery_Criteria cri) {
        log.info("gallerySingle G_NO : " + G_NO);
        model.addAttribute("board", galleryService.getGallerySingle(G_NO));
    }

    @PreAuthorize("principal.useranme == #board.writer") // 작성자와 로그인한 사람이 같은지 확인
    @PostMapping("modify")
    public String modify(GalleryDTO galleryDTO, Gallery_Criteria cri, RedirectAttributes rttr) {
        // 수정처리
        if(galleryService.updateGallery(galleryDTO)) {
            log.info("************ 수정성공!!!!!!!!!!!!! ************");
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/gallery/main" + cri.getListLink();
    }


    @PostMapping("delete")
    public String delete(Long G_NO, String writer, Gallery_Criteria cri, RedirectAttributes rttr) {
        // 삭제 처리
        if(galleryService.deleteGallery(G_NO)) {
            log.info("*********** 삭제 성공!!!!!!! ************");
            rttr.addFlashAttribute("result", "success");
        }
        return "redirect:/gallery/main" + cri.getListLink();
    }




}


