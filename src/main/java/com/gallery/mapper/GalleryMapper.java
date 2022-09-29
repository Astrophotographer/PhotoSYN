package com.gallery.mapper;

import com.blog.domain.BlogDTO;
import com.gallery.domain.GalleryDTO;

import java.util.List;

public interface GalleryMapper {


    public List<GalleryDTO> getGalleryList();

    public GalleryDTO getGallerySingle(Long G_NO);
}
