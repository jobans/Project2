package vo;

public class UsersVO {
	private int userno;
	private String id;
	private String pw;
	private String name;
	private String sex;
 	private String dob;
	private String email;
	private String pno;
	private String address;
	private String post;
	
	
	public UsersVO() {
		super();
	}
	



	public UsersVO(int userno, String id, String pw, String name, String sex, String dob, String email, String pno,
		String address, String post) {
	super();
	this.userno = userno;
	this.id = id;
	this.pw = pw;
	this.name = name;
	this.sex = sex;
	this.dob = dob;
	this.email = email;
	this.pno = pno;
	this.address = address;
	this.post = post;
	}




	public int getUserno() {
		return userno;
	}




	public void setUserno(int userno) {
		this.userno = userno;
	}




	public String getId() {
		return id;
	}




	public void setId(String id) {
		this.id = id;
	}




	public String getPw() {
		return pw;
	}




	public void setPw(String pw) {
		this.pw = pw;
	}




	public String getName() {
		return name;
	}




	public void setName(String name) {
		this.name = name;
	}




	public String getSex() {
		return sex;
	}




	public void setSex(String sex) {
		this.sex = sex;
	}




	public String getDob() {
		return dob;
	}




	public void setDob(String dob) {
		this.dob = dob;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getPno() {
		return pno;
	}




	public void setPno(String pno) {
		this.pno = pno;
	}




	public String getAddress() {
		return address;
	}




	public void setAddress(String address) {
		this.address = address;
	}




	public String getPost() {
		return post;
	}




	public void setPost(String post) {
		this.post = post;
	}	
	
	
	
}

