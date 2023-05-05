package com.multi.mvc.content.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.mvc.content.model.vo.Content;
import com.multi.mvc.content.model.vo.ContentReply;

@Mapper
public interface ContentMapper {
	List<Content> selectContentList(Map<String, String> map);
	List<ContentReply> selectContentReplyList(Map<String, String> map);
	int selectContentCount(Map<String, String> map);
	int selectContentReplyCount(Map<String, String> map);
	Content selectContentByNo(Map<String, String> map);
	int insertContentReply(ContentReply reply);
	int updateRikeAmount(Content content);
	int deleteContentReply(int no);

}
