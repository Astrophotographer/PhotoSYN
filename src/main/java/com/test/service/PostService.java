package com.test.service;

import com.test.domain.EditorDTO;

import java.sql.SQLException;

public interface PostService {
    public void savePost(EditorDTO editorDTO)throws SQLException;
}
