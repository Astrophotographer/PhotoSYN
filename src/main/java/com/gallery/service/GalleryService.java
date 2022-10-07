package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.Gallery_Criteria;
import com.gallery.domain.Gallery_Img_Temp;
import com.gallery.domain.MaintagDTO;


import java.util.List;

public interface GalleryService {

    // C
    public int uploadGallery(GalleryDTO galleryDTO); // 갤러리 업로드
    public int insertTempImg(Gallery_Img_Temp gallery_img_temp); // @@@@@메타데이터 확인용 이미지넣기


    // R

    public List<Gallery_Img_Temp> getTempImg(String U_ID); // @@@@@메타데이터 확인용 이미지 정보확인

    public List<GalleryDTO> getGalleryList(Gallery_Criteria cri); // 갤러리 전체 조회



    public GalleryDTO getGallerySingle(Long G_NO); // 갤러리 하나 정보가져오기

    public int getTotal(Gallery_Criteria cri); // 개수 조회



    public int checkGallerySeq(); // 사진 시퀀스 확인
    public List<MaintagDTO> getMainTag();  // 전체 해쉬태그 불러오기



    // U
    public boolean updateGallery(GalleryDTO galleryDTO);  // 사진 수정  // 1성공 . 0실패
    public boolean updateMetadata(Gallery_Img_Temp gallery_img_temp); // @@@@@메타데이터용 이미지 수정

    // D
    public boolean deleteGallery(long G_NO); // 사진 삭제 + 메타데이터도 함께 날리기



    public boolean hideGallery(long G_NO); // 사진 숨기기 // G_STATUS  2로 변경


    boolean deleteGallery(Long g_no);
}

