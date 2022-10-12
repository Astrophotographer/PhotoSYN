package com.gallery.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.metadata.Metadata;
import com.drew.metadata.exif.ExifIFD0Directory;
import com.drew.metadata.exif.ExifSubIFDDirectory;
import com.gallery.domain.MetadataDTO;
import com.gallery.service.GalleryService;
import com.gallery.service.MetadataService;
import com.gallery.service.MetadataServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/gallery/*")
@Log4j
public class UploadController {

    @Autowired
    private MetadataService metadataService;

    @GetMapping("uploadForm")
    public String upload() {
        log.info("upload form!!!!!!!!!!!!!");
        return "gallery/uploadForm";
    }

    @PostMapping("uploadPro")
    public void uploadPro(String msg, MultipartHttpServletRequest request) { // msg(text), img(file)


        log.info("************ upload pro *************");
        log.info("************ msg : " + msg);

        try {
            // 전송한 파일 정보 꺼내기
            MultipartFile mf = request.getFile("img");
            request.getFiles("img");
            log.info("************ original file name : " + mf.getOriginalFilename());
            log.info("************ file size : " + mf.getSize());
            log.info("************ file contentType : " + mf.getContentType());

            // 파일 저장 경로 구하기
            // String uploadPath = request.getRealPath("/resources/gallery/images"); // 서버상 save 폴더 위치
            String uploadPath = "/Users/chris/Desktop/Develop/photosyn2/src/main/webapp/resources/gallery/images"; // 서버상 save 폴더 위치
            log.info("************ save path : " + uploadPath);
            // 새 파일명 생성
            String uuid = UUID.randomUUID().toString().replaceAll("-", "");
            log.info("************ uuid : " + uuid);
            // 업로드한 파일 확장자만 가져오기
            String orgName = mf.getOriginalFilename();
            String ext = orgName.substring(orgName.lastIndexOf("."));
            log.info("************ ext : " + ext);
            // 저장할 파일명
            String newFileName = uuid + ext;
            log.info("************ newFileName : " + newFileName);
            // 저장할 파일 전체 경로
            String imgPath = uploadPath + "/" + newFileName;
            log.info("************ imgPath : " + imgPath);

            // 파일 저장
            File file = new File(imgPath);
            mf.transferTo(file);
            MetadataDTO metadataDTO = metadataService.checkMetadata(imgPath); // 메타데이터 가져오기 메소드

//            int MetadataUploadResult = metadataService.insertMetadata(metadataDTO); // 메타데이터 DB에 저장
//            log.info("------------------------------------------------------------------------------");
//            log.info("MetadataUploadResult:" + MetadataUploadResult);   //성공시 1 출력

        } catch (IOException e) {
            e.printStackTrace();
        }

    }









//    // 다운 요청 처리
//    @GetMapping("download")
//    public ModelAndView down(int fileNum) {
//        // 다운시킬 파일 준비
//
//        File f = null;
//        if(fileNum == 1) {
//            f = new File("c:\\gangsa\\design.png");
//        }else if(fileNum == 2) {
//            f = new File("c:\\gangsa\\beach.jpg");
//        }
//
//        // 생성자 매개변수
//        // String viewName 		: view 이름 -> xml 지정한 DownloadView 빈의 id값
//        // String modelName		: 파라미터명 지정 (이름)
//        // Object modelObject	: 데이터 (다운시킬 파일)
//        ModelAndView mv = new ModelAndView("fileDown", "downloadFile", f);
//        return mv;
//    }
//



}
