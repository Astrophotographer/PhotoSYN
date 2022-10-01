package com.blog.controller;

import com.blog.domain.BlogDTO;
import com.blog.domain.Blog_Criteria;
import com.blog.domain.Blog_Img;
import com.blog.domain.Blog_Img_Temp;
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
import java.security.Principal;
import java.util.*;

@Controller
@Log4j
@RequestMapping("blog/*")
public class BlogController {

    @Autowired
    private BlogService blogService;

    @RequestMapping(value = "main")
    public String goMain(Model model, Blog_Criteria blog_criteria, Principal principal) {
    //public String goMain(Model model, String user_id, String option, String sort) {

        //option -- reg, like, readcount
        //sort -- desc(latest/ popular/ highest_view), asc(oldest/ unpopular/ lowest_view)

        //정렬(sort)    desc/asc
        //reg 최신순    latest/ oldest4115@in.
        //like 인기순   popular/ unpopular
        //view 조회순   highest_view/ lowest_view
        log.info("goMain Start...");



        if(principal != null) {
            log.info(principal.getName());
            blog_criteria.setU_id(principal.getName());
        }else{
            log.info("principal is null");
        }
        //userid 값 받아오기? TODO 확인해주기..
        //principal.getName();

        //TODO 유저아이디 담아주기
//        blog_criteria.setU_id("작성자1");

        log.info("blog_criteria : " + blog_criteria.toString());

        model.addAttribute("list", blogService.getBlogList(blog_criteria));

        return "blog/blogmain";
    }

    //블로그 글 한개 보기
    @RequestMapping(value = "single", method = RequestMethod.GET)
    public String goSingle(Model model, @RequestParam("b_no") Long b_no) {
        log.info("goSingle Start...");

        model.addAttribute("blog", blogService.getBlogSingle(b_no));


        return "blog/blogsingle";
    }


    // 블로그 글 작성 페이지
    @RequestMapping(value = "write", method = RequestMethod.GET)
    public String writeBoard(Model model) {
        log.info("writeBoard start...");
        model.addAttribute("mainTag", blogService.getMainTag());

        //출력 확인용
//        List test = blogService.getMainTag();
//        log.info("test : " + test.toString());

        return "blog/write";
    }

    // 블로그 사진 업로드 시 진행 페이지
    @RequestMapping(value = "write", method = RequestMethod.POST)
    public void imageUpload4(HttpServletRequest request,
                             HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload, Blog_Img blog_img, Blog_Img_Temp blog_img_temp) throws Exception {
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

            //TODO 유저이름 test에서 수정해주기
            blog_img_temp.setU_ID("test");
            blog_img_temp.setBI_NAME(uid + "_" + fileName);
            blog_img_temp.setBI_UUID(uid.toString());
            blog_img_temp.setBI_ORIGINNAME(fileName);

            int tempResult = blogService.insertTempImg(blog_img_temp);
            log.info("------------------------------------------------------------------------------");
            log.info("tempResult:" + tempResult);   //성공시 1 출력

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

    @RequestMapping(value = "checkmainimg", method = RequestMethod.POST)
    public String checkmainimg(BlogDTO blogDTO, Blog_Img blog_img, Model model) {
        try {
            log.info("checkmainimg start...");

            //블로그 글 DB 저장.
            log.info(blogDTO.toString());
            blogService.insertBlog(blogDTO);
            int blog_seq = blogService.checkBlogSeq();

            //정상적으로 시퀀스값 가져옴.
            log.info("checkmainimg_blog_seq:" + blog_seq);  //작성한 시퀀스 값 가져옴

//        blogService.getTempImg("test");

            //이름들로 db 저장된 사진들 가져와서 출력 후 select 해서 이미지 고르게하기
            blogService.getTempImg("test").forEach(img -> log.info("foreach사용 " + img.toString() + "\nimg 타입 :" + img.getClass().getName()));
            //img 타입 ㅣ com.blog.domain.Blog_Img_Temp

            //람다로는 안되나?
//            blogService.getTempImg("test").forEach(img ->{
//                blog_img.setBI_UUID(img.getBI_UUID());
//            });

            List<Blog_Img_Temp> list = blogService.getTempImg("test");
            List<Blog_Img> list2 = new ArrayList<Blog_Img>();

            //현재 있는 temp에 담긴 테이블 값들 뷰에 뿌려주기
            model.addAttribute("imgs", list);

            //list에 담겨있는 temp테이블 가져와서 메인으로 보내주기
            for (int i = 0; i < list.size(); i++) {
                log.info("for문 사용 " + list.get(i).toString());
                log.info("----- getClass.getname" + list.get(i).getClass().getName());
                blog_img.setB_NO(blog_seq);
                blog_img.setBI_NAME(list.get(i).getBI_NAME());
                //메인 여부
                blog_img.setBI_MAIN(0);

                blog_img.setBI_UUID(list.get(i).getBI_UUID());
                blog_img.setBI_ORIGINNAME(list.get(i).getBI_ORIGINNAME());

                log.info("blog_img.toString() : " + blog_img.toString());
                blogService.insertImg(blog_img);
                Thread.sleep(100);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            log.info("finally...");

            return "blog/checkmainimg";
        }
    }

    @RequestMapping(value = "checkmainimg", method = RequestMethod.GET)
    public String finishSubmit(String mainImg, String UUID) {
        log.info("finishSubmit start...");
        log.info("mainImg : " + mainImg);
        log.info("UUID : " + UUID);

        //임시 사진저장 테이블에 들어있는 데이터들 삭제 및 메인 지정
        //TODO  test를 유저아이디로 바꿔주기
        blogService.updateImg("test", UUID);


        return "redirect:/blog/main";
    }

    //메인 이미지 링크 뿌려주기
    @RequestMapping(value = "getmainimg")
    public void getmainimg(@RequestParam("b_no") int b_no, Blog_Img blog_img
            , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        log.info("getmainimg start...");

        //blog_img에 b_no 주고 메인이미지 가져오기
        blog_img = blogService.getMainImg(b_no);

        String path = "C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/";    // 저장된 이미지 경로
        log.info("getmainimg 에서 실행 path:" + path);
        String sDirPath = path + blog_img.getBI_UUID() + "_" + blog_img.getBI_ORIGINNAME();
        log.info("getmainimg 에서 실행 sDirPath:" + sDirPath);
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

    // 유저 한명의 글 모아보기
    @RequestMapping(value = "usermain")
    public String goUserMain(Model model, Blog_Criteria blog_criteria){
        log.info("goUserMain start...");

        return "blog/blogusermain";
    }
}



