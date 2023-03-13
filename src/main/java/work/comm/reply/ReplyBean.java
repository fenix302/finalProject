package work.comm.reply;

import java.io.Serializable;

public class ReplyBean implements Serializable{
	private Long bno;
	private String userCode;     //유저코드
	private int rno;	 //댓글일련번호
	private String userReply;    //댓글내용
	private String replyDate;    //댓글날짜

	public ReplyBean() {
		super();
	}

	public ReplyBean(String productCode, String userCode, int userReplyNo,
			String userReply, String replyDate) {
		super();
		this.bno = bno;
		this.userCode = userCode;
		this.rno = rno;
		this.userReply = userReply;
		this.replyDate = replyDate;
	}

	public Long getBno() {
		return bno;
	}

	public void setBno(Long bno) {
		this.bno = bno;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String getUserReply() {
		return userReply;
	}

	public void setUserReply(String userReply) {
		this.userReply = userReply;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	@Override
	public String toString() {
		return "ReplyBean [bno=" + bno + ", userCode=" + userCode + ", rno=" + rno + ", userReply=" + userReply
				+ ", replyDate=" + replyDate + "]";
	}

}
