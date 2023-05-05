package com.multi.mvc.board.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.multi.mvc.board.model.vo.Board;
import com.multi.mvc.board.model.vo.Reply;

@Mapper
public interface BoardMapper {
	// MySQL Page 기능 활용
	List<Board> selectBoardList1(Map<String, String> map);
	List<Reply> selectReplyList1(Map<String, String> map);
	// MyBatis Page 기능 활용
	int selectBoardCount(Map<String, String> map);
	int selectReplyCount(Map<String, String> map);
	Board selectBoardByNo(int no);
	int insertBoard(Board board);
	int insertReply(Reply reply);
	int updateBoard(Board board);
	int updateReadCount(Board board);
	int deleteBoard(int no);
	int deleteReply(int no);
}
