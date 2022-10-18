package com.admin.domain;

import lombok.Data;

@Data
public class Admin_UpsertTagDTO {
    private String originTag;
    private String updateTag;
    private String newTag;
    private String tagImgName;
}
