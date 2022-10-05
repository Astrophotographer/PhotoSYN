package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.MaintagDTO;
import com.gallery.mapper.GalleryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GalleryServiceImpl implements GalleryService {

    @Autowired
    private GalleryMapper galleryMapper;

    @Override
    public String insertTempImg(String gallery_img_temp) {
        return null;
    }

    @Override
    public String getTempImg(String gallery_img_temp) {
        return null;
    }

    @Override
    public int insertImg() {
        return 0;
    }

    @Override
    public int insertGallery(GalleryDTO galleryDTO) {
        return 0;
    }

    @Override
    public int checkGallerySeq() {
        return 0;
    }

    @Override
    public List<GalleryDTO> getGalleryList()
    {
        return galleryMapper.getGalleryList();
    }

    @Override
    public GalleryDTO getGallerySingle(Long G_NO) {
        return galleryMapper.getGallerySingle(G_NO);
    }

    @Override
    public List<MaintagDTO> getMainTag() {
        return null;
    }

    @Override
    public List checkMainImg() {
        return null;
    }

    @Override
    public int updateGallery(GalleryDTO galleryDTO) {
        return 0;
    }

    @Override
    public int deleteImg(String bi_name, String uuid, String originName) {
        return 0;
    }
}

