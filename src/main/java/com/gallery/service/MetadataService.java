package com.gallery.service;

import com.gallery.domain.MetadataDTO;

public interface MetadataService {


    public MetadataDTO checkMetadata(String imgpath); // 메타데이터 확인

    public int insertMetadata(MetadataDTO metadataDTO); // 메타데이터 넣기

    public void getMetadata(Long G_NO); // 메타데이터 가져오기

    public boolean updateMetadata(MetadataDTO metadataDTO); // 메타데이터 수정

    // public boolean deleteMetadata(long G_NO); // 메타데이터 삭제 -> Gallery service 에서 같이 삭제





}
