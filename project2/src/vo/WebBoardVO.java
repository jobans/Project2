package vo;

public class WebBoardVO {
	private int bno;
	private String userno;
	private String code;
	private String ip;
	private String bname;
	private String bcontent;
	private String regdate;
	private int hits;
	
	public WebBoardVO() {}

	public WebBoardVO(int bno, String userno, String code, String ip, String bname, String bcontent, String regdate,
			int hits) {
		super();
		this.bno = bno;
		this.userno = userno;
		this.code = code;
		this.ip = ip;
		this.bname = bname;
		this.bcontent = bcontent;
		this.regdate = regdate;
		this.hits = hits;
	}

	public int getBno() {
		return bno;
	}

	public void setBno(int bno) {
		this.bno = bno;
	}

	public String getUserno() {
		return userno;
	}

	public void setUserno(String userno) {
		this.userno = userno;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getBname() {
		return bname;
	}

	public void setBname(String bname) {
		this.bname = bname;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}
	
	
	
}
