package com.gallery.service;

import com.blog.domain.BlogDTO;
import com.gallery.domain.GalleryDTO;


import java.util.List;

public interface GalleryService {


    public int insertImg();

    public int insertGallery(GalleryDTO galleryDTO);

    public List<GalleryDTO> getGalleryList();

    public GalleryDTO getGallerySingle(Long G_NO);




}
