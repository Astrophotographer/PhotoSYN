package com.gallery.service;

import com.blog.domain.Blog_Img_Temp;
import com.gallery.domain.GalleryDTO;
import com.gallery.domain.Gallery_Criteria;
import com.gallery.domain.Gallery_Img_Temp;
import com.gallery.domain.MaintagDTO;
import com.gallery.mapper.GalleryMapper;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j
public class GalleryServiceImpl implements GalleryService {

    @Autowired
    private GalleryMapper galleryMapper;
    @Override
    public int uploadGallery(GalleryDTO galleryDTO) {
        return galleryMapper.uploadGallery(galleryDTO);
    }

    @Override
    public int insertTempImg(Gallery_Img_Temp gallery_img_temp) {
        return galleryMapper.insertTempImg(gallery_img_temp);
    }

    @Override
    public List getTempImg(String U_ID) {return galleryMapper.getTempImg(U_ID);
    }

    @Override
    public List<GalleryDTO> getGalleryList(Gallery_Criteria cri) {


        return galleryMapper.getGalleryList(cri);
    }


    @Override
    public int checkGallerySeq() {
        return galleryMapper.checkGallerySeq();

    }



    @Override
    public GalleryDTO getGallerySingle(Long G_NO) {return galleryMapper.getGallerySingle(G_NO);}


    @Override
    public List<MaintagDTO> getMainTag() {
        return galleryMapper.getMainTag();
    }


    @Override
    public boolean updateGallery(GalleryDTO galleryDTO) {
        return galleryMapper.updateGallery(galleryDTO);
    }

    @Override
    public boolean updateMetadata(Gallery_Img_Temp gallery_img_temp) {return galleryMapper.updateMetadata(gallery_img_temp);}



    @Override
    public boolean deleteGallery(long G_NO) {
        return galleryMapper.deleteGallery(G_NO);
    }

    @Override
    public boolean hideGallery(long G_NO) {return galleryMapper.hideGallery(G_NO);}


    @Override
    public int getTotal(Gallery_Criteria cri) { return galleryMapper.getTotal(cri); }

    @Override
    public GalleryDTO getMaxLikeGallery() { return galleryMapper.getMaxLikeGallery(); }


    @Override
    public GalleryDTO getMaxReadCountGallery() { return galleryMapper.getMaxReadCountGallery(); }

    @Override

    public GalleryDTO getMaxSalesGallery() { return galleryMapper.getMaxSakesGallery();}



}