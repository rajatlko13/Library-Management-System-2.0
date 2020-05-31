package entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="admin_details")
public class AdminDetails {
	
	@Column(name="firstname")
	private String firstname;
	
	@Column(name="lastname")
	private String lastname;
	
	@Id
	@Column(name="username")
	private String username;

	@Column(name="password")
	private String password;
	
	public AdminDetails()
	{
	}
	
	public AdminDetails(String firstname, String lastname, String username, String password) {
		this.firstname = firstname;
		this.lastname = lastname;
		this.username = username;
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	
	public String getLastname() {
		return lastname;
	}
	
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

}
