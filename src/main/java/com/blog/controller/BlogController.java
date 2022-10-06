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
import org.springframework.web.bind.annotation.ResponseBody;
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

    //TODO 1001 : 블로그 페이징처리
    //글 가져오기 조건. 페이징X, ajax로 요청
    //댓글만 페이징 처리.

    //TODO 1004 : 블로그 페이징처리. ajax, responsebody 구현

    //TODO 1005 : security 사용시 ajax 토큰 넣어줘야 함. 사진 업로드는 post 방식이기에 사용해야함... 임시로 토큰 미사용중.
    //TODO 1005 : 글 처음작성, 및 수정시 메인이미지 강제로 하나 적용시켜야함.

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


        if (principal != null) {
            log.info(principal.getName());
            blog_criteria.setU_id(principal.getName());
        } else {
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

    //메인 글 옵션으로 가져오기
    // 최신순/오래된순, 좋아요 많은순, 조회수 많은순
    @RequestMapping(value = "getList.do")
    @ResponseBody
    public void getList(HttpServletResponse response, Blog_Criteria blog_criteria, Principal principal, String option) throws IOException {
        //TODO 문법확인. 1003
        log.info("getList Start...");

        if (principal != null) {
            log.info(principal.getName());
            blog_criteria.setU_id(principal.getName());
        } else {
            log.info("principal is null");
        }

        log.info("blog_criteria : " + blog_criteria.toString());

        List<BlogDTO> list = blogService.getBlogList(blog_criteria);

        //json으로 변환
        String json = "";
        json += "[";
        for (int i = 0; i < list.size(); i++) {
            json += "{";
            json += "\"b_no\":\"" + list.get(i).getB_NO() + "\",";
            json += "\"b_title\":\"" + list.get(i).getB_SUBJECT() + "\",";
            json += "\"b_content\":\"" + list.get(i).getB_CONTENT() + "\",";
            json += "\"b_regdate\":\"" + list.get(i).getB_REG() + "\",";
            json += "\"b_like\":\"" + list.get(i).getB_LIKE() + "\",";
            json += "\"b_readcount\":\"" + list.get(i).getB_READCOUNT() + "\",";
            json += "\"u_id\":\"" + list.get(i).getU_ID() + "\"";
            json += "}";
            if (i != list.size() - 1) {
                json += ",";
            }
        }
        json += "]";

        log.info("json : " + json);

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(json);
        out.flush();
        out.close();
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
    public void imageUpload4(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest multiFile, @RequestParam MultipartFile upload, Blog_Img blog_img, Blog_Img_Temp blog_img_temp) throws Exception {
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
            blog_img_temp.setBIT_NAME(uid + "_" + fileName);
            blog_img_temp.setBIT_UUID(uid.toString());
            blog_img_temp.setBIT_ORIGINNAME(fileName);

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
    public void ckSubmit4(@RequestParam(value = "uid") String uid, @RequestParam(value = "fileName") String fileName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
                blog_img.setBI_NAME(list.get(i).getBIT_NAME());
                //메인 여부
                blog_img.setBI_MAIN(0);

                blog_img.setBI_UUID(list.get(i).getBIT_UUID());
                blog_img.setBI_ORIGINNAME(list.get(i).getBIT_ORIGINNAME());

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
    public String finishSubmit(String mainImg, String UUID, Principal principal) {
        log.info("finishSubmit start...");
        log.info("mainImg : " + mainImg);
        log.info("UUID : " + UUID);

        String user_id = "test";
        //임시 사진저장 테이블에 들어있는 데이터들 삭제 및 메인 지정
        //TODO  test를 유저아이디로 바꿔주기
        if(principal != null){
            user_id = principal.getName();
        }
        blogService.updateImg(user_id, UUID);


        return "redirect:/blog/main";
    }

    //메인 이미지 링크 뿌려주기
    @RequestMapping(value = "getmainimg")
    public void getmainimg(@RequestParam("b_no") int b_no, Blog_Img blog_img, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

    // 유저 한명(u_id)의 글 모아보기
    @RequestMapping(value = "usermain")
    public String goUserMain(Model model, Blog_Criteria blog_criteria, Principal principal, String u_id) {
        log.info("goUserMain start...");

        //option, sort 담아옴.
        log.info("blog_criteria : " + blog_criteria.toString());

        //넘어온 u_id가 있으면 그 u_id로 검색
        if(u_id != null){
           blog_criteria.setU_id(u_id);
        }
        //유저 정보 criteria담아주고 옵션, 정렬조건으로 db정보 가져오기
        if (principal != null) {
            blog_criteria.setU_id(principal.getName());
        }

        return "blog/blogusermain";
    }

    //  10-04 작업중
    @RequestMapping(value = "update", method = RequestMethod.GET)
    public String goUpdate(Model model, Long b_no, Principal principal) {
        log.info("update start...");
        log.info("b_no : " + b_no);
        //글 번호 가져와서 뿌려주기
        model.addAttribute("blog", blogService.getBlogSingle(b_no));
        model.addAttribute("mainTag", blogService.getMainTag());
        //글과 관련된 사진들 가져오기
        model.addAttribute("blog_imgs", blogService.getImg(b_no));


        return "blog/update";
    }

    @RequestMapping(value="update.imagedelete", method = RequestMethod.POST)
    public void updateDeleteImage(@RequestParam("bi_name") String bi_name, @RequestParam("uid") String uid, @RequestParam("originName") String originName, HttpServletResponse response) throws IOException {
        log.info("updateDeleteImage start...");

//        response.setCharacterEncoding("utf-8");
//        response.setContentType("text/html;charset=utf-8");

        log.info(bi_name);
        log.info(uid);
        log.info(originName);

        blogService.deleteImg(bi_name, uid, originName);

        //파일 삭제 서비스단에다 구현. 아래는 삭제해도 괜찮음.
//        File file = new File("C:\\Users\\pmwkd\\Desktop\\git\\PhotoSYN\\src\\main\\webapp\\resources\\saveImg" + "ckImage/" + bi_name);
//        if(file.exists()) {
//            if(file.delete()) {
//                if(blogService.deleteImg(uid)>0) {
//                    log.info("이미지 삭제 성공+DB삭제 성공");
//                    response.getWriter().print("success");
//                } else {
//                    log.info("이미지 삭제 성공+DB삭제 실패");
//                    response.getWriter().print("fail");
//                }
//            } else {
//                log.info("파일삭제 실패");
//                response.getWriter().print("fail");
//            }
//        }else{
//            log.info("파일이 존재하지 않습니다.");
//            response.getWriter().print("not_exist");
//        }

    }

    @RequestMapping(value = "update.do")
    public String afterUpdate(BlogDTO blogDTO, Principal principal, Long b_no, Model model, Blog_Img blog_img) throws  Exception{
        //http://localhost:8080/blog/update.do?B_SUBJECT=&B_CONTENT=&U_ID=&B_TAG1=
        //형색으로 주소 넘어감.
        log.info("afterUpdate start...");
        log.info(blogDTO.toString());   // 정상적 들어감
        log.info("b_no : " + b_no);     // 정상적 들어감
        int result = blogService.updateBlog(blogDTO);
        log.info("DB저장 result : " + result);

        //TODO 1004 메인 이미지 수정해주기
        //ckeckmainimg 사용
//        return "/blog/updatemainimage?bno=" + b_no;
        //return "redirect:usermain";
//        return "forward:updatemainimage?b_no=" + b_no;

        String user_id = "test";

        if(principal != null) {
            user_id = principal.getName();
        }

        List<Blog_Img_Temp> templist = blogService.getTempImg(user_id);
        List<Blog_Img> imglist = blogService.getImg(b_no);

//        log.info("templist : " + templist.toString());
//        log.info("imglist : " + imglist.toString());

        model.addAttribute("templist", templist);
        model.addAttribute("imglist", imglist);

        for (int i = 0; i < templist.size(); i++) {
            log.info("for문 사용 " + templist.get(i).toString());
            log.info("----- getClass.getname" + templist.get(i).getClass().getName());
            blog_img.setB_NO(b_no);
            blog_img.setBI_NAME(templist.get(i).getBIT_NAME());
            //메인 여부
            blog_img.setBI_MAIN(0);

            blog_img.setBI_UUID(templist.get(i).getBIT_UUID());
            blog_img.setBI_ORIGINNAME(templist.get(i).getBIT_ORIGINNAME());

            log.info("blog_img.toString() : " + blog_img.toString());
            blogService.insertImg(blog_img);
            Thread.sleep(100);
        }

        return "blog/updatemainimage";
    }

    //사진들 뿌려주고 메인 사진 고르기.
    @RequestMapping(value = "updatemainimage", method = RequestMethod.GET)
    public String updateMainImg(Long b_no, String UUID, Principal principal) {
        log.info("updateMainImg start...");
        log.info("b_no : " + b_no);
        log.info("uuid : " + UUID);

        String user_id= "test";
        if(principal!=null){
            user_id = principal.getName();
        }
        //user_id로 temp테이블 값 모두 삭제,
        //uuid로 uuid값이 일치하는 temp테이블의 bi_main값을 1로 변경
        blogService.updateImg(user_id, UUID);

        return "redirect:usermain";
    }

    @RequestMapping(value = "delete", method = RequestMethod.DELETE)
    public String delete() {
        //http://localhost:8080/blog/delete?B_SUBJECT=&B_CONTENT=&U_ID=&B_TAG1=
        //형식으로 주소 넘어감.
        log.info("delete start...");
        return "redirect:usermain";
    }
}



