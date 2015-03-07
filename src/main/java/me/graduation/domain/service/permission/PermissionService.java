package me.graduation.domain.service.permission;

import me.graduation.domain.model.permission.IPermissionRepository;
import me.graduation.domain.model.permission.Permission;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Service("permissionService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
public class PermissionService implements IPermissionService {

    @Autowired
    private IPermissionRepository<Permission, String> permissionRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Permission> findByRoleId(String id) {
        return permissionRepository.getByRoleId(id);
    }
}
