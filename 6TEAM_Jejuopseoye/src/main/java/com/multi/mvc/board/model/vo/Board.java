package com.multi.mvc.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int no;
	private int writerNo;
	private String nickName;
	private String title;
	private String content;
	private String originalFileName;
	private String renamedFileName;
	private int readCount;
	private String status;
	private List<Reply> replies;
	private Date createDate;
	private Date modifyDate;
	private String type;
}