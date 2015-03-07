package me.graduation.interfaces.user.web.command;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by _liwenhe on 2015/3/7.
 */
public class CreateUserCommand {

    @NotEmpty(message = "{CreateUserCommand.username.NotEmpty}")
    private String username;

    @NotEmpty(message = "{CreateUserCommand.password.NotEmpty}")
    private String password;

    @NotEmpty(message = "{CreateUserCommand.confirmPassword.NotEmpty}")
    private String confirmPassword;

    private String salt;
    private Boolean sex;
    private String email;
    private String telephone;
    private String remark;

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

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
