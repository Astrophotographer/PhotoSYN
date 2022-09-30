package com.gallery.mapper;

import com.blog.domain.BlogDTO;
import com.gallery.domain.GalleryDTO;
import com.gallery.domain.MetadataDTO;

import java.util.List;

public interface GalleryMapper {


    public List<GalleryDTO> getGalleryList();
    public GalleryDTO getGallerySingle(Long G_NO);
    public MetadataDTO checkMetadata(Long G_NO);
    public MetadataDTO insertMetadata(Long G_NO);
}
