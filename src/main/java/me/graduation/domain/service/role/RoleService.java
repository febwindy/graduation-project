package me.graduation.domain.service.role;

import me.graduation.domain.model.role.IRoleRepository;
import me.graduation.domain.model.role.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Service("roleService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
public class RoleService implements IRoleService {

    @Autowired
    private IRoleRepository<Role, String> roleRepository;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public Role findByUserId(String id) {
        return null;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Role> findAll() {
        return roleRepository.findAll();
    }
}
