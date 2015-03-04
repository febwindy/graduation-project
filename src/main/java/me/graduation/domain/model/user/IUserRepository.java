package me.graduation.domain.model.user;

import me.graduation.infrastructure.persistence.hibernate.generic.IHibernateGenericRepository;

import java.io.Serializable;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IUserRepository<T, TD extends Serializable> extends IHibernateGenericRepository<T, TD> {
}
