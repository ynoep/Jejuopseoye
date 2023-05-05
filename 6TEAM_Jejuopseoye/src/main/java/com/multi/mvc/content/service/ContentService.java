package com.multi.mvc.content.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.mvc.common.util.PageInfo;
import com.multi.mvc.content.model.mapper.ContentMapper;
import com.multi.mvc.content.model.vo.Content;
import com.multi.mvc.content.model.vo.ContentReply;

@Service
public class ContentService {
	
	@Autowired
	private ContentMapper mapper;
	
	@Transactional(rollbackFor = Exception.class)
	public int saveContentReply(ContentReply reply) {
		return mapper.insertContentReply(reply);
	}
	
	public int getContentCount(Map<String, String> param) {
		return mapper.selectContentCount(param);
	}
	
	public int getContentReplyCount(Map<String, String> param) {
		return mapper.selectContentReplyCount(param);
	}
	
	public List<Content> getContentList(PageInfo pageInfo, Map<String, String> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectContentList(param);
	}
	
	public List<ContentReply> getContentReplyList(PageInfo pageInfo, Map<String, String> param){
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.selectContentReplyList(param);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Content findByNo(Map<String, String> param) {
		Content content = mapper.selectContentByNo(param); 
		return content; 
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteContentReply(int no) {
		return mapper.deleteContentReply(no);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int contentLikeAmount(Map<String, String> param, int likeAmount) {
		Content content = mapper.selectContentByNo(param);
		content.setLikeAmount(likeAmount);
		return mapper.updateRikeAmount(content);
	}

}
