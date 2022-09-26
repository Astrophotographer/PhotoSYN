package com.test.service;

import com.test.domain.EditorDTO;
import com.test.domain.SummerEditorVO;

import java.sql.SQLException;

public interface PostService {
    public void savePost(EditorDTO editorDTO)throws SQLException;

    public int insertSummerBoard(SummerEditorVO summerEditorVO) throws Exception;
}
