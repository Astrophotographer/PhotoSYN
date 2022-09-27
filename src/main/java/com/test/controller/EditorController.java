package com.test.controller;

import com.google.gson.JsonObject;
import com.test.domain.Editor;
import com.test.domain.EditorDTO;
import com.test.domain.SummerEditorVO;
import com.test.service.PostService;
import lombok.extern.log4j.Log4j;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.UUID;

@Log4j
@Controller
@RequestMapping("editor")
public class EditorController {

    @Autowired
    private PostService postService;

    @RequestMapping("/testeditor")
    public String testeditor(){
        log.info("testEditor Start...");

        return "/testpage/editor/editor";
    }
    @RequestMapping("/summereditor")
    public String summereditor(){
        log.info("summereditor Start...");

        return "/testpage/editor/summereditor";
    }
    @PostMapping("/summerwrite")
    public String summerwrite(Model model, SummerEditorVO summerEditorVO) throws Exception {
        log.info("summerwrite Start...");

        log.info("summerEditorVO : "+summerEditorVO.toString());
        log.info("summerEditorVO content : "+summerEditorVO.getContent());
        log.info("summerEditorVO subject : "+summerEditorVO.getSubject());
        log.info("summerEditorVO writer  : "+summerEditorVO.getWriter());

        int result = postService.insertSummerBoard(summerEditorVO);

        log.info("summerwrite result : "+result);

        return "/testpage/editor/summerwrite";
    }

    @RequestMapping(value = "/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
    @ResponseBody
    public String uploadSummernoteImageFile(@RequestParam("file")MultipartFile multipartFile, HttpServletRequest request){
        JsonObject json = new JsonObject();


        String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
        String fileRoot = contextRoot+"resources/fileupload/";

        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); //파일 확장자

        String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
        File targetFile = new File(fileRoot + savedFileName);

        try {
            // 파일 저장
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);

            // 파일을 열기위하여 common/getImg.do 호출 / 파라미터로 savedFileName 보냄.
            json.addProperty("url", "common/getImg.do?savedFileName="+savedFileName);
            json.addProperty("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);
            json.addProperty("responseCode", "error");
            e.printStackTrace();
        }
        String jsonvalue = json.toString();

        return jsonvalue;
    }
















    @RequestMapping("/")
    public ModelAndView insertEditor(HttpServletRequest request, HttpServletResponse response, Editor editor) throws Exception {
        log.info("insertEditor Start...");
        return new ModelAndView("editor/newPost");
    }

    @RequestMapping("/savePost")
    public View savePost(HttpServletRequest request, EditorDTO post) throws Exception{
        log.info("savePost Start...");

        ModelMap model = new ModelMap();
        model.addAttribute("result", HttpStatus.OK);

        postService.savePost(post);

        return new MappingJackson2JsonView();
    }

    //일반 파일 업로드 컨트롤러
    @RequestMapping("/testfileupload")
    public String testfileupload(HttpServletRequest request, HttpServletResponse response, Editor editor){
        log.info("testfileupload Start...");

        String return1=request.getParameter("callback");
        String return2="?callback_func=" + request.getParameter("callback_func");
        String return3="";
        String name = "";
        try {
            if(editor.getFile() != null && editor.getFile().getOriginalFilename() != null && !editor.getFile().getOriginalFilename().equals("")) {
                // 기존 상단 코드를 막고 하단코드를 이용
                name = editor.getFile().getOriginalFilename().substring(editor.getFile().getOriginalFilename().lastIndexOf(File.separator)+1);
                String filename_ext = name.substring(name.lastIndexOf(".")+1);
                filename_ext = filename_ext.toLowerCase();
                String[] allow_file = {"jpg","png","bmp","gif"};
                int cnt = 0;
                for(int i=0; i<allow_file.length; i++) {
                    if(filename_ext.equals(allow_file[i])){
                        cnt++;
                    }
                }
                if(cnt == 0) {
                    return3 = "&errstr="+name;
                } else {
                    //파일 기본경로
                    String dftFilePath = request.getSession().getServletContext().getRealPath("/");
                    //파일 기본경로 _ 상세경로
                    String filePath = dftFilePath + "resources"+ File.separator + "editor" + File.separator +"upload" + File.separator;
                    File file = new File(filePath);
                    if(!file.exists()) {
                        file.mkdirs();
                    }
                    String realFileNm = "";
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                    String today= formatter.format(new java.util.Date());
                    realFileNm = today+ UUID.randomUUID().toString() + name.substring(name.lastIndexOf("."));
                    String rlFileNm = filePath + realFileNm;
                    ///////////////// 서버에 파일쓰기 /////////////////
                    editor.getFile().transferTo(new File(rlFileNm));
                    ///////////////// 서버에 파일쓰기 /////////////////
                    return3 += "&bNewLine=true";
                    return3 += "&sFileName="+ name;
                    return3 += "&sFileURL=/resources/editor/upload/"+realFileNm;
                }
            }else {
                return3 += "&errstr=error";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:"+return1+return2+return3;
    }

    @RequestMapping(value="/file_uploader_html5",method = RequestMethod.POST)
    public void file_uploader_html5(HttpServletResponse response, HttpServletRequest request){
        try {
            //파일정보
            String sFileInfo = "";
            //파일명을 받는다 - 일반 원본파일명
            String filename = request.getHeader("file-name");
            //파일 확장자
            String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
            //확장자를소문자로 변경
            filename_ext = filename_ext.toLowerCase();

            //이미지 검증 배열변수
            String[] allow_file = {"jpg","png","bmp","gif"};

            //돌리면서 확장자가 이미지인지
            int cnt = 0;
            for(int i=0; i<allow_file.length; i++) {
                if(filename_ext.equals(allow_file[i])){
                    cnt++;
                }
            }

            //이미지가 아님
            if(cnt == 0) {
                PrintWriter print = response.getWriter();
                print.print("NOTALLOW_"+filename);
                print.flush();
                print.close();
            } else {
                //이미지이므로 신규 파일로 디렉토리 설정 및 업로드
                //파일 기본경로
                String dftFilePath = request.getSession().getServletContext().getRealPath("/");
                //파일 기본경로 _ 상세경로
                String filePath = dftFilePath + "resources" + File.separator + "editor" + File.separator +"multiupload" + File.separator;
                File file = new File(filePath);
                if(!file.exists()) {
                    file.mkdirs();
                }
                String realFileNm = "";
                SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
                String today= formatter.format(new java.util.Date());
                realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
                String rlFileNm = filePath + realFileNm;
                ///////////////// 서버에 파일쓰기 /////////////////
                InputStream is = request.getInputStream();
                OutputStream os=new FileOutputStream(rlFileNm);
                int numRead;
                byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
                while((numRead = is.read(b,0,b.length)) != -1){
                    os.write(b,0,numRead);
                }
                if(is != null) {
                    is.close();
                }
                os.flush();
                os.close();
                ///////////////// 서버에 파일쓰기 /////////////////

                // 정보 출력
                sFileInfo += "&bNewLine=true";
                // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
                sFileInfo += "&sFileName="+ filename;;
                sFileInfo += "&sFileURL="+"/resources/editor/multiupload/"+realFileNm;
                PrintWriter print = response.getWriter();
                print.print(sFileInfo);
                print.flush();
                print.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
