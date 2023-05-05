package com.multi.mvc.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int no;
	private int boardNo;
	private int writerNo;
	private String nickName;
	private String content;
	private String status;
	private Date createDate;
	private Date modifyDate;
}