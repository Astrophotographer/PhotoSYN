package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.mapper.GalleryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GalleryServiceImpl implements GalleryService {

    @Autowired
    private GalleryMapper galleryMapper;

    @Override
    public int insertImg() {
        return 0;
    }

    @Override
    public int insertGallery(GalleryDTO galleryDTO) {
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
}

