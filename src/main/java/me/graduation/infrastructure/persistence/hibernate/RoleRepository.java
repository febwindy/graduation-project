package me.graduation.infrastructure.persistence.hibernate;

import me.graduation.domain.model.role.IRoleRepository;
import me.graduation.domain.model.role.Role;
import me.graduation.infrastructure.persistence.hibernate.generic.AbstractHibernateGenericRepository;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Repository("roleRepository")
public class RoleRepository extends AbstractHibernateGenericRepository<Role, String> implements IRoleRepository<Role, String> {
    @Override
    public List<Role> getAll() {
        Criteria criteria = getSession().createCriteria(getPersistentClass());
        criteria.setFetchMode("permissions", FetchMode.JOIN);
        return criteria.list();
    }
}
