package me.graduation.domain.model.verified.organization;

import me.graduation.infrastructure.persistence.hibernate.generic.IHibernateGenericRepository;

import java.io.Serializable;

/**
 * Created by ivan_ on 2015/4/10.
 */
public interface IOrganizationVerifiedRepository<T, ID extends Serializable> extends IHibernateGenericRepository<T, ID> {

    T get(String id);

}
