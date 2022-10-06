package com.gallery.service;

import com.gallery.domain.GalleryDTO;
import com.gallery.domain.MetadataDTO;

import java.util.List;

public interface MetadataService {


    void checkMetadata(Long G_NO);

    public MetadataDTO insertMetadata(Long G_NO); // 메타데이터 넣기

    public void getMetadata(Long G_NO); // 메타데이터 가져오기

    public boolean updateMetadata(MetadataDTO metadataDTO); // 메타데이터 수정

    // public boolean deleteMetadata(Long G_NO); // 메타데이터 삭제 -> Gallery service 에서 같이 삭제





}
