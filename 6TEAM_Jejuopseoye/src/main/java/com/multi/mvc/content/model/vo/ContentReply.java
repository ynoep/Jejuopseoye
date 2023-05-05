package com.multi.mvc.content.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ContentReply {
	private int no;
	private int contentNo;
	private int writerNo;
	private String nickName;
	private String content;
	private String status;
	private Date createDate;
	private Date modifyDate;

}
