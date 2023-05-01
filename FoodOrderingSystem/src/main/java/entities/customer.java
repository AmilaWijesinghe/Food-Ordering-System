package entities;

public class customer {
	
	private int id;
	private String name;
	private String pnumber;
	private String email;
	private String password;
	private String log_email;
	private String log_passsword;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getLog_email() {
		return log_email;
	}

	public void setLog_email(String log_email) {
		this.log_email = log_email;
	}

	public String getLog_passsword() {
		return log_passsword;
	}

	public void setLog_passsword(String log_passsword) {
		this.log_passsword = log_passsword;
	}

	public customer() {

		name = "";
		pnumber = "";
		email = "";
		password = "";
	}

}
