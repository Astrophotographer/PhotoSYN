package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.Gallery_Criteria;
import com.gallery.domain.MaintagDTO;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GalleryServiceImpl implements GalleryService {
    @Override
    public int uploadGallery(GalleryDTO galleryDTO) {
        return 0;
    }

    @Override
    public String insertTempImg(String gallery_img_temp) {
        return null;
    }

    @Override
    public String getTempImg(String gallery_img_temp) {
        return null;
    }

    @Override
    public List<GalleryDTO> getGalleryList(Gallery_Criteria cri) {
        return null;
    }


    @Override
    public int checkGallerySeq() {
        return 0;
    }

    @Override
    public List<GalleryDTO> getGalleryList() {
        return null;
    }

    @Override
    public GalleryDTO getGallerySingle(Long G_NO) {
        return null;
    }

    @Override
    public List<MaintagDTO> getMainTag() {
        return null;
    }


    @Override
    public boolean updateGallery(GalleryDTO galleryDTO) {
        return false;
    }

    @Override
    public boolean deleteGallery(long G_NO) {
        return false;
    }


    @Override
    public int getTotal(Gallery_Criteria cri) {
        return 0;
    }

    @Override
    public boolean deleteGallery(Long g_no) {
        return false;
    }
}

