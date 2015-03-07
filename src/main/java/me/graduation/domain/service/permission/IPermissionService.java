package me.graduation.domain.service.permission;

import me.graduation.domain.model.permission.Permission;

import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IPermissionService {
    List<Permission> findByRoleId(String id);
}
