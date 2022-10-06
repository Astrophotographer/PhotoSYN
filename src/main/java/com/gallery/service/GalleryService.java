package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.Gallery_Criteria;
import com.gallery.domain.MaintagDTO;


import java.util.List;

public interface GalleryService {

    // C
    public int uploadGallery(GalleryDTO galleryDTO); // 갤러리 업로드
    public String insertTempImg(String gallery_img_temp); // 메타데이터 확인용


    // R

    public String getTempImg(String gallery_img_temp); // 메타데이터 확인용

    public List<GalleryDTO> getGalleryList(Gallery_Criteria cri); // 갤러리 전체 조회


    List<GalleryDTO> getGalleryList();

    public GalleryDTO getGallerySingle(Long G_NO); // 갤러리 하나 정보가져오기

    public int getTotal(Gallery_Criteria cri); // 개수 조회



    public int checkGallerySeq(); // 사진 시퀀스 확인
    public List<MaintagDTO> getMainTag();  // 전체 해쉬태그 불러오기



    // U
    public boolean updateGallery(GalleryDTO galleryDTO);  // 사진 수정  // 1성공 . 0실패
    public boolean updateMetadata(GalleryDTO galleryDTO); // 메타데이터 수정

    // D
    public boolean deleteGallery(long G_NO); // 사진 삭제 + 메타데이터도 함께 날리기
    public boolean hideGallery(long G_NO); // 사진 숨기기 // status 0으로 변경




}

