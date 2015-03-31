package me.graduation.infrastructure.persistence.hibernate;

import me.graduation.domain.model.permission.IPermissionRepository;
import me.graduation.domain.model.permission.Permission;
import me.graduation.infrastructure.persistence.hibernate.generic.AbstractHibernateGenericRepository;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Repository("permissionRepository")
public class PermissionRepository extends AbstractHibernateGenericRepository<Permission, String> implements IPermissionRepository<Permission, String> {

    @Override
    public Permission getByName(String name) {
        Criteria criteria = getSession().createCriteria(getPersistentClass());
        criteria.add(Restrictions.eq("resource", name));

        Object obj = criteria.uniqueResult();

        return (null != obj) ? (Permission) obj : null;
    }

    @Override
    public List<Permission> getByRoleId(String id) {
        Criteria criteria = getSession().createCriteria(getPersistentClass());
        criteria.createAlias("roles", "r")
                .add(Restrictions.eq("r.id", id));

        return criteria.list();
    }
}
