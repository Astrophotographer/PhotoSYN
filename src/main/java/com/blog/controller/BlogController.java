package com.blog.controller;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Img;
import com.blog.service.BlogService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

@Controller
@Log4j
@RequestMapping("blog/*")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @RequestMapping(value ="main")
    public String goMain(Model model){
        log.info("goMain Start...");

        model.addAttribute("list", blogService.getBlogList());

        return "blog/blogmain";
    }

    //블로그 글 한개 보기
    @RequestMapping(value="single", method = RequestMethod.GET)
    public String goSingle(Model model, @RequestParam("b_no") Long b_no){
        log.info("goSingle Start...");

        model.addAttribute("blog", blogService.getBlogSingle(b_no));

        return "blog/blogsingle";
    }


    // 블로그 글 작성 페이지
    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String writeBoard() {
        log.info("writeBoard start...");

        return "blog/write";
    }

    // 블로그 사진 업로드 시 진행 페이지
    @RequestMapping(value = "write", method = RequestMethod.POST)
    public void imageUpload4(HttpServletRequest request,
                             HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload, Blog_Img blog_img) throws Exception {
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();

        OutputStream out = null;
        PrintWriter printWriter = null;

        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try {
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();

            //이미지 경로 생성
            String path = "C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/";    // 이미지 경로 설정(폴더 자동 생성)
//            C:\Users\pmwkd\Desktop\git\PhotoSYN\src\main\webapp\resources\saveImgckImage
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            log.info("path:" + path);    // 이미지 저장경로 console에 확인
            log.info("ckUploadPath:" + ckUploadPath);    // 이미지 실제 저장 확인
//            INFO : com.blog.controller.BlogController - ckUploadPath:C:\Users\pmwkd\Desktop\git\PhotoSYN\src\main\webapp\resources\saveImgckImage/cb40770d-353e-42c0-ad07-cfa1f0237d6d_고양이5.jpg


            //해당 디렉토리 확인
            if (!folder.exists()) {
                try {
                    folder.mkdirs(); // 폴더 생성
                } catch (Exception e) {
                    e.getStackTrace();
                }
            }

            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = "/blog/write/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

            // 업로드시 메시지 출력
            printWriter.println("{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\":\"" + fileUrl + "\"}");
            printWriter.flush();

            //임시 사진 저장 사용 전
//            //사진 이름 저장
//            blog_img.setBI_NAME(uid+"_"+fileName);
//            //사진 메인 여부 0 : 서브, 1 : 메인
//            //기본으로 서브용 사진들로 지정.
//            blog_img.setBI_MAIN(0);
//            blog_img.setBI_UUID(uid.toString());
//            blog_img.setBI_ORIGINNAME(fileName);
//
//
//            //사진 정보 DB에 저장
//            int result = blogService.insertImg(blog_img);

            //DB 저장 성공시 1출력.
            log.info("result:" + result);


        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (printWriter != null) {
                    printWriter.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return;
    }

//    String fileUrl = "../resources/saveImgckImage/" + uid + "_" + fileName; // 작성화면(에디터에 저장되는 텍스트 문구)
    // 서버로 전송된 이미지 글에다가 뿌려주기
    //이미지 태그 에서도 사진 불러오기 위해 사용.
    @RequestMapping(value = "/write/ckImgSubmit.do")
    public void ckSubmit4(@RequestParam(value = "uid") String uid
            , @RequestParam(value = "fileName") String fileName
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //서버에 저장된 이미지 경로
//        String path = "C:\\Users\\wowo1\\Pictures\\Saved Pictures" + "ckImage/";	// 저장된 이미지 경로
        String path = "C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/";    // 저장된 이미지 경로
        System.out.println("/write/ckImgSubmit.do 에서 실행 path:" + path);
        log.info("/write/ckImgSubmit.do 에서 실행 path:" + path);
        String sDirPath = path + uid + "_" + fileName;

        File imgFile = new File(sDirPath);

        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if (imgFile.isFile()) {
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;

            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;

            try {
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();

                while ((readByte = fileInputStream.read(buf)) != -1) {
                    outputStream.write(buf, 0, readByte);
                }

                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();

            } catch (IOException e) {
                e.printStackTrace();
            } finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }

    @RequestMapping(value="checkmainimg", method = RequestMethod.POST)
    public String checkmainimg(BlogDTO blogDTO, Blog_Img blog_img, Model model){
        log.info("checkmainimg start...");

        //블로그 글 DB 저장.
        log.info(blogDTO.toString());
        blogService.insertBlog(blogDTO);
        int blog_seq = blogService.checkBlogSeq();

        //정상적으로 시퀀스값 가져옴.
        log.info("checkmainimg_blog_seq:" + blog_seq);

        //이름들로 db 저장된 사진들 가져와서 출력 후 select 해서 이미지 고르게하기

        model.addAttribute("imgs", blogService.checkMainImg());

        //임시 사진 저장한것 불러와서 값 담기
//        //사진 이름 저장
//        blog_img.setBI_NAME(uid+"_"+fileName);
//        //사진 메인 여부 0 : 서브, 1 : 메인
//        //기본으로 서브용 사진들로 지정.
//        blog_img.setBI_MAIN(0);
//        blog_img.setBI_UUID(uid.toString());
//        blog_img.setBI_ORIGINNAME(fileName);



        return "blog/checkmainimg";
    }
}

