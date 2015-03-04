package me.graduation.infrastructure.persistence.hibernate;

import me.graduation.domain.model.role.IRoleRepository;
import me.graduation.domain.model.role.Role;
import me.graduation.infrastructure.persistence.hibernate.generic.AbstractHibernateGenericRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Repository("roleRepository")
public class RoleRepository extends AbstractHibernateGenericRepository<Role, String> implements IRoleRepository<Role, String> {
}
