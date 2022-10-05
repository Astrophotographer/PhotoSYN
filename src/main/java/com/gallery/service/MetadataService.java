package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.MetadataDTO;

import java.util.List;

public interface MetadataService {


    public void checkMetadata(Long G_NO);

    public MetadataDTO insertMetadata(Long G_NO);

}
