package me.graduation.infrastructure.persistence.hibernate;

import me.graduation.domain.model.verified.organization.IOrganizationVerifiedRepository;
import me.graduation.domain.model.verified.organization.OrganizationVerified;
import me.graduation.infrastructure.persistence.hibernate.generic.AbstractHibernateGenericRepository;
import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

/**
 * Created by ivan_ on 2015/4/10.
 */
@Repository("organizationVerifiedRepository")
public class OrganizationVerifiedRepository extends AbstractHibernateGenericRepository<OrganizationVerified, String>
        implements IOrganizationVerifiedRepository<OrganizationVerified, String> {

    @Override
    public OrganizationVerified get(String id) {
        Criteria criteria = getSession().createCriteria(getPersistentClass());
        criteria.add(Restrictions.eq("id", id))
                .setFetchMode("creator", FetchMode.JOIN);

        Object obj = criteria.uniqueResult();

        return (null != obj) ? (OrganizationVerified) obj : null;
    }
}
