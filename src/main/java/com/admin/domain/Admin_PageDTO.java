package com.admin.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Admin_PageDTO {
    //페이지 번호등 페이지 처리시 필요한 정보 담아주는 곳

    private int startPage;  //시작 페이지 번호
    private int endPage;    //끝 페이지 번호

    // 페이지 번호 앞으로, 뒤로가기
    private boolean prev, next;

    //전체 인원 및 글(블로그, 갤러리)수
    private int total;

    //페이지 번호 pageNum, 페이지당 보여줄 글의 개수 listQty
    private Admin_Criteria cri;

    public Admin_PageDTO(Admin_Criteria cri, int total){
        this.cri = cri;
        this.total = total;

        //한 페이지에 띄워줄 개수는 10개
        this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)*10);
        this.startPage = this.endPage - 9;

        //만약 글의 갯수가 123개라면, 끝페이지는 13페이지가 되어야함
        int realEnd = (int)(Math.ceil((total*1.0)/cri.getListQty()));

        if(realEnd < this.endPage){
            //전체 페이지수보다 endPage가 크면
            //마지막 페이지 번호를 전체페이지로 변경함.
            this.endPage = realEnd;
        }

        //startPage에 들어가는 수는 1, 11, 21 ...
        //prev 버튼을 보여주기 위해서는 1보다 큰수들만 true를 줌
        //1페이지에서는 굳이 prev 를 활성화 할 이유가 없기 때문...?
        this.prev = this.startPage > 1;

        //endpage가 realend보다 작을경우 다음페이지로 갈수 있는 next가 활성화가 되어야 하므로 true를 돌려줌
        this.next = this.endPage < realEnd;

    }

}
