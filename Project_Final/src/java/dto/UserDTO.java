package dto;

public class UserDTO {

    private String userID;
    private String userName;
    private String password;
    private String fullName;
    private String email;
    private int phone_number;
    private String role;

    public UserDTO() {
    }

    public UserDTO(String userID, String userName, String password, String fullName, String email, int phone_number, String role) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone_number = phone_number;
        this.role = role;
    }

    public UserDTO(String userName, String password, String fullName, String email, int phone_number, String role) {
        this.userName = userName;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.phone_number = phone_number;
        this.role = role;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(int phone_number) {
        this.phone_number = phone_number;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", userName=" + userName + ", password=" + password + ", fullName=" + fullName + ", email=" + email + ", phone_number=" + phone_number + ", role=" + role + '}';
    }

}
