package com.multi.mvc.content.model.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Content {
	private int no;
	private String contentsId;		// 콘텐츠 아이디
	private String alltag;			// 관련 태그 전체
	private String title;			// 해당 콘텐츠의 제목
	private String address;			// 주소
	private String roadaddress;		// 도로명주소
	private String tag;				// 태그
	private String introduction;	// 소개글
	private double latitude;		// 위도
	private double longitude;		// 경도
	private String postcode;		// 우편번호
	private String phoneno;			// 전화번호
	private int likeAmount;
	private List<ContentReply> replies;
	private String contentscdValue;	// 콘텐츠 종류 코드
	private String contentscdLabel;	// 콘텐츠 종류 이름
	private String imgpath;			// 일반 이미지경로
	private String thumbnailpath;	// 썸네일 이미지경로

}
