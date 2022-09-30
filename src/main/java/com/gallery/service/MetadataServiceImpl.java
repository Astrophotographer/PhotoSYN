package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.MetadataDTO;
import com.gallery.mapper.GalleryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MetadataServiceImpl implements MetadataService{

    @Autowired
    private GalleryMapper galleryMapper;

    @Override
    public MetadataDTO checkMetadata(Long G_NO) {


        return null;
    }

    @Override
    public MetadataDTO insertMetadata(Long G_NO) {
        return null;
    }
}

