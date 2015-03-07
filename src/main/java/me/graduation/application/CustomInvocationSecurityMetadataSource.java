package me.graduation.application;

import me.graduation.domain.model.permission.Permission;
import me.graduation.domain.model.role.Role;
import me.graduation.domain.service.permission.IPermissionService;
import me.graduation.domain.service.role.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import java.util.*;

/**
 * Created by _liwenhe on 2015/3/6.
 */
public class CustomInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {

    @Autowired
    private IRoleService roleService;

    @Autowired
    private IPermissionService permissionService;

    private static Map<String, List<String>> resourceMap = null;

    public void loadResourceDefine() throws Exception {
        this.resourceMap = new HashMap<String, List<String>>();

        List<Role> roles = roleService.findAll();
        for (Role role : roles) {
            List<String> permissionList = new ArrayList<String>();
            List<Permission> permissions = permissionService.findByRoleId(role.getId());
            for (Permission permission : permissions) {
                permissionList.add(permission.getResource());
            }
            resourceMap.put(role.getRole(), permissionList);
        }
    }

    @Override
    public Collection<ConfigAttribute> getAttributes(Object o) throws IllegalArgumentException {
        String url = ((FilterInvocation) o).getRequestUrl();
        Iterator<String> ite = resourceMap.keySet().iterator();
        Collection<ConfigAttribute> returnCollection = new ArrayList<ConfigAttribute>();
        while (ite.hasNext()) {
            String role = ite.next();
            List list = resourceMap.get(role);
            if (list.contains(url)) {
                ConfigAttribute ca = new SecurityConfig(role);
                returnCollection.add(ca);
            }
        }
        return returnCollection;
    }

    @Override
    public Collection<ConfigAttribute> getAllConfigAttributes() {
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return true;
    }
}
