package dto;

public class UserDTO {
    private String full_name;
    private String user_name;
    private String password;
    private String email;
    private String phone_number;
    private int role_id;

    public UserDTO() {
        this.full_name= "";
        this.user_name = "";
        this.password = "";
        this.email = "";
        this.phone_number = "";
    }

    public UserDTO( String full_name, String user_name, String password, String email, String phone_number, int role_id) {
        this.full_name = full_name;
        this.user_name = user_name;
        this.password = password;
        this.email = email;
        this.phone_number = phone_number;
        this.role_id = role_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }
}
