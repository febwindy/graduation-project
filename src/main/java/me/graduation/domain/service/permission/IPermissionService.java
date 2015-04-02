package me.graduation.domain.service.permission;

import me.graduation.domain.model.permission.Permission;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.permission.web.command.CreatePermissionCommand;
import me.graduation.interfaces.permission.web.command.EditPermissionCommand;
import me.graduation.interfaces.user.web.command.ListCommand;

import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IPermissionService {

    Permission findById(String id);

    Permission findByName(String name);

    List<Permission> findByRoleId(String id);

    List<Permission> findAll();

    List<Permission> findAll(boolean isFetchMode);

    Pagination<Permission> pagination(ListCommand command);

    void create(CreatePermissionCommand command);

    void edit(EditPermissionCommand command);

    void delete(String id);
}
