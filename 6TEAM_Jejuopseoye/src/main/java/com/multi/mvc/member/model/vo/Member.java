package com.multi.mvc.member.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int no;
	private String id;
	private String password;
	private String nickName;
	private String email1;
	private String email2;
	private String phone;
	private String kakaoToKen;
	private String status;
	private String role;
	private Date enrollDate;
	private Date modifyDate;
}
