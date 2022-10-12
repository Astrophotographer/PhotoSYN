package com.blog.controller;

import com.blog.domain.ReplyDTO;
import com.blog.service.ReplyService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("/reply/*")
@RestController
@Log4j
public class ReplyController {

    @Autowired
    private ReplyService replyService;

    @RequestMapping(value = "add", consumes = "application/json", produces={MediaType.TEXT_PLAIN_VALUE}, method = RequestMethod.POST)
    //@RequestMapping(value = "add",consumes = "application/json", method = RequestMethod.POST)
    public ResponseEntity<String> add(@RequestBody ReplyDTO replyDTO) {
        log.info("add replyDTO : " + replyDTO.toString());
        log.info(replyDTO.getU_ID());
        int result = replyService.add(replyDTO);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "text/plain;charset=UTF-8");
        return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
    }
//    @RequestMapping(value = "add", consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE, produces={MediaType.TEXT_PLAIN_VALUE}, method = RequestMethod.POST)
//    public ResponseEntity<String> addForm(@RequestBody ReplyDTO replyDTO) {
//        log.info("x-www-form-urlencoded add replyVO : " + replyDTO);
//        log.info("add replyVO : " + replyDTO);
//        int result = replyService.add(replyDTO);
//        return result == 1 ? new ResponseEntity<String>("success", HttpStatus.OK) : new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
//    }

    @GetMapping(value = "list/{bno}", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
    public ResponseEntity<List<ReplyDTO>> getList(@PathVariable("bno") Long bno) {
        log.info("bno : " + bno);
        List<ReplyDTO> list = replyService.getList(bno);
        return new ResponseEntity<List<ReplyDTO>>(list, HttpStatus.OK);
    }

}
