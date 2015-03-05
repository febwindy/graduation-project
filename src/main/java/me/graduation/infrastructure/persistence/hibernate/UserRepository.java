package me.graduation.infrastructure.persistence.hibernate;

import me.graduation.domain.model.user.IUserRepository;
import me.graduation.domain.model.user.User;
import me.graduation.infrastructure.persistence.hibernate.generic.AbstractHibernateGenericRepository;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Repository("userRepository")
public class UserRepository extends AbstractHibernateGenericRepository<User, String> implements IUserRepository<User, String> {

    @Override
    public User loadByUsername(String username) {
        Criteria criteria = getSession().createCriteria(getPersistentClass());
        criteria.add(Restrictions.eq("username", username))
                .setFetchMode("roles", FetchMode.JOIN);

        Object obj = criteria.uniqueResult();

        return (null == obj) ? null : (User) obj;
    }
}
