package me.graduation.interfaces.user.web.command;

import me.graduation.domain.model.role.Role;

import java.io.Serializable;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by ivan_ on 2015/3/31.
 */
public class AuthorizationRoleCommand implements Serializable {

    private String id;

    private String username;

    private String roles;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }
}
