package me.graduation.domain.service.role;

import me.graduation.domain.model.role.Role;

import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IRoleService {

    Role findByUserId(String id);

    List<Role> findAll();

}
