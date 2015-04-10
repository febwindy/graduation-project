package me.graduation.domain.service.verified.organization;

import me.graduation.domain.model.verified.VerifiedType;
import me.graduation.domain.model.verified.organization.IOrganizationVerifiedRepository;
import me.graduation.domain.model.verified.organization.OrganizationVerified;
import me.graduation.domain.service.NoFoundException;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.verified.web.organization.command.CreateOrganizationCommand;
import me.graduation.interfaces.verified.web.organization.command.EditOrganizationCommand;
import me.graduation.interfaces.verified.web.organization.command.ListCommand;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by ivan_ on 2015/4/10.
 */
@Service("organizationVerifiedService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
public class OrganizationVerifiedService implements IOrganizationVerifiedService {

    @Autowired
    private IOrganizationVerifiedRepository<OrganizationVerified, String> organizationVerifiedRepository;

    @Override
    public OrganizationVerified findById(String id) {
        OrganizationVerified organizationVerified = organizationVerifiedRepository.get(id);
        if (null == organizationVerified) {
            throw new NoFoundException("没有发现该审核信息");
        }
        return organizationVerified;
    }

    @Override
    public Pagination<OrganizationVerified> pagination(ListCommand command) {

        command.setPageSize(10);

        List<Criterion> criterionList = new ArrayList<Criterion>();

        Criterion[] restrictions = null;
        int size = criterionList.size();
        if (size> 0) {
            restrictions = new Criterion[size];
            criterionList.toArray(restrictions);
        }

        Order[] orders = {Order.desc("createdDate")};

        Map<String, FetchMode> fetchModeMap = new HashMap<String, FetchMode>();
        fetchModeMap.put("creator", FetchMode.JOIN);

        return organizationVerifiedRepository.pagination(command.getPage(), command.getPageSize(), restrictions, orders, fetchModeMap);
    }

    @Override
    public void edit(EditOrganizationCommand command) {

        OrganizationVerified organizationVerified = this.findById(command.getId());

        organizationVerified.setStatus(command.getStatus());
        organizationVerified.setType(VerifiedType.ORGANIZATION_VERIFIED);
        organizationVerified.setCreatedDate(new Date());
        organizationVerified.setCreator(command.getCreator());
        organizationVerified.setSource(command.getSource());
        organizationVerified.setDestination(command.getDestination());
        organizationVerified.setReason(command.getReason());

        organizationVerifiedRepository.update(organizationVerified);
    }

    @Override
    public void create(CreateOrganizationCommand command) {

        OrganizationVerified organizationVerified = new OrganizationVerified();
        organizationVerified.setStatus(Boolean.FALSE);
        organizationVerified.setType(VerifiedType.ORGANIZATION_VERIFIED);
        organizationVerified.setCreatedDate(new Date());
        organizationVerified.setCreator(command.getCreator());
        organizationVerified.setSource(command.getSource());
        organizationVerified.setDestination(command.getDestination());
        organizationVerified.setReason(command.getReason());

        organizationVerifiedRepository.save(organizationVerified);
    }

    @Override
    public void delete(String id) {
        OrganizationVerified organizationVerified = this.findById(id);
        organizationVerifiedRepository.delete(organizationVerified);
    }
}
