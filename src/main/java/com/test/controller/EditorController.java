package com.test.controller;

import com.drew.lang.StringUtil;
import com.google.gson.JsonObject;
import com.test.domain.Editor;
import com.test.domain.EditorDTO;
import com.test.domain.SummerEditorVO;
import com.test.service.PostService;
import lombok.extern.log4j.Log4j;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Log4j
@Controller
@RequestMapping("editor")
public class EditorController {

    @Autowired
    private PostService postService;


    // CKEDITOR

    @RequestMapping("ckeditor")
    public String ckeditor() {

        log.info("ckeditor start...");
        return "testpage/editor/ckeditor";
    }

    @RequestMapping("ckeditor2")
    public String ckeditor2() {

        log.info("ckeditor2 start...");
        return "testpage/editor/ckeditor2";
    }



    @RequestMapping(value="editor/food/imageUpload.do", method = RequestMethod.POST)
    public void imageUpload4(HttpServletRequest request,
                            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // ?????? ?????? ??????
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //?????????
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //?????? ?????? ????????????
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //????????? ?????? ??????
//            String path = "C:\\Users\\wowo1\\Pictures\\Saved Pictures" + "ckImage/";	// ????????? ?????? ??????(?????? ?????? ??????)
            String path = "C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/";	// ????????? ?????? ??????(?????? ?????? ??????)
//            C:\Users\pmwkd\Desktop\git\PhotoSYN\src\main\webapp\resources\saveImgckImage
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
//            System.out.println("path:"+path);	// ????????? ???????????? console??? ??????
            log.info("path:"+path);	// ????????? ???????????? console??? ??????
            //?????? ???????????? ??????
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // ?????? ??????
                }catch(Exception e){
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram??? ????????? ???????????? ???????????? ?????????

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/editor/food/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // ????????????

            // ???????????? ????????? ??????
            printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
            printWriter.flush();

        }catch(IOException e){
            e.printStackTrace();
        } finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
        return;
    }
    // ????????? ????????? ????????? ????????????
    @RequestMapping(value="/food/ckImgSubmit.do")
    public void ckSubmit4(@RequestParam(value="uid") String uid
            , @RequestParam(value="fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        //????????? ????????? ????????? ??????
//        String path = "C:\\Users\\wowo1\\Pictures\\Saved Pictures" + "ckImage/";	// ????????? ????????? ??????
        String path = "C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/";	// ????????? ????????? ??????
        System.out.println("path:"+path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //?????? ????????? ?????? ????????? ?????? ??????????????? ??? ????????? ????????? ????????????.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            }catch(IOException e){
                e.printStackTrace();
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }

}
