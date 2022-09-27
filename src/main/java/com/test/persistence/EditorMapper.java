package com.test.persistence;

import com.test.domain.SummerEditorVO;

public interface EditorMapper {

    //글 작성. 사진 없이
    public int insertSummerBoard(SummerEditorVO summerEditorVO)throws Exception;
}
