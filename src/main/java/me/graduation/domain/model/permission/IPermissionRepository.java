package me.graduation.domain.model.permission;

import me.graduation.infrastructure.persistence.hibernate.generic.IHibernateGenericRepository;

import java.io.Serializable;
import java.util.List;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IPermissionRepository<T, TD extends Serializable> extends IHibernateGenericRepository<T, TD> {
    List<T> getByRoleId(TD id);
}
