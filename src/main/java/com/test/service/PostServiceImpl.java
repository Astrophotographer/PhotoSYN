package com.test.service;

import com.test.domain.EditorDTO;
import com.test.domain.SummerEditorVO;
import com.test.persistence.EditorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.SQLException;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private EditorMapper editorMapper;

    @Override
    public void savePost(EditorDTO editorDTO) throws SQLException {

    }

    @Override
    public int insertSummerBoard(SummerEditorVO summerEditorVO) throws Exception {
        return editorMapper.insertSummerBoard(summerEditorVO);
    }
}
