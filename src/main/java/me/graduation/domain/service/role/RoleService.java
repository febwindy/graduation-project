package me.graduation.domain.service.role;

import me.graduation.domain.model.role.IRoleRepository;
import me.graduation.domain.model.role.Role;
import me.graduation.domain.service.NoFoundException;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.role.web.command.CreateRoleCommand;
import me.graduation.interfaces.role.web.command.EditRoleCommand;
import me.graduation.interfaces.user.web.command.ListCommand;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Service("roleService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
public class RoleService implements IRoleService {

    @Autowired
    private IRoleRepository<Role, String> roleRepository;

    @Override
    public Role findByUserId(String id) {
        return null;
    }

    @Override
    public Role findById(String id) {
        Role role = roleRepository.getById(id);
        if (null == role) {
            throw new NoFoundException("该角色不存在");
        }
        return role;
    }

    @Override
    public Role findById(String id, Boolean isFetchModeForUser, Boolean isFetchModeForPermission) {

        Map<String, FetchMode> fetchModeMap = new HashMap<String, FetchMode>();
        if (isFetchModeForUser) {
            fetchModeMap.put("users", FetchMode.JOIN);
        }
        if (isFetchModeForPermission) {
            fetchModeMap.put("permissions", FetchMode.JOIN);
        }

        return roleRepository.getById(id, fetchModeMap);

    }

    @Override
    public Role findByName(String name) {
        return roleRepository.getByName(name);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public List<Role> findAll() {
        return roleRepository.findAll();
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = true)
    public Pagination<Role> pagination(ListCommand command) {

        command.setPageSize(10);

        List<Criterion> criterionList = new ArrayList<Criterion>();

        Criterion[] restrictions = null;
        int size = criterionList.size();
        if (size> 0) {
            restrictions = new Criterion[size];
            criterionList.toArray(restrictions);
        }

        return roleRepository.pagination(command.getPage(), command.getPageSize(), restrictions, null);
    }

    @Override
    public void create(CreateRoleCommand command) {
        Role role = new Role();
        role.setRole(command.getRole());
        role.setDescription(command.getDescription());

        roleRepository.save(role);
    }

    @Override
    public void edit(EditRoleCommand command) {
        Role role = this.findById(command.getId());
        role.setRole(command.getRole());
        role.setDescription(command.getDescription());

        roleRepository.update(role);
    }

    @Override
    public void delete(String id) {
        Role role = this.findById(id);
        roleRepository.delete(role);
    }
}
