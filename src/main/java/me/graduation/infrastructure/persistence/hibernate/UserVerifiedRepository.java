package me.graduation.infrastructure.persistence.hibernate;

import me.graduation.domain.model.verified.user.IUserVerifiedRepository;
import me.graduation.domain.model.verified.user.UserVerified;
import me.graduation.infrastructure.persistence.hibernate.generic.AbstractHibernateGenericRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by ivan_ on 2015/4/10.
 */
@Repository("userVerifiedRepository")
public class UserVerifiedRepository extends AbstractHibernateGenericRepository<UserVerified, String>
        implements IUserVerifiedRepository<UserVerified, String> {
}
