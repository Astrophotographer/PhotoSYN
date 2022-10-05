package com.gallery.service;

import com.blog.domain.BlogDTO;
import com.gallery.domain.GalleryDTO;
import com.gallery.domain.MaintagDTO;


import java.util.List;

public interface GalleryService {



    public String insertTempImg(String gallery_img_temp); // 메타데이터 확인용
    public String getTempImg(String gallery_img_temp); // 메타데이터 확인용

    public int insertImg();
    public int insertGallery(GalleryDTO galleryDTO);

    public int checkGallerySeq();
    public List<GalleryDTO> getGalleryList();



    public GalleryDTO getGallerySingle(Long G_NO);
    public List<MaintagDTO> getMainTag();
    public List checkMainImg();




    public int updateGallery(GalleryDTO galleryDTO);   // 1성공 . 0실패

    public int deleteImg(String bi_name, String uuid, String originName);





}
