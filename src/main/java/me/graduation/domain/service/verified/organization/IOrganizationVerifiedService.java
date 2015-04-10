package me.graduation.domain.service.verified.organization;

import me.graduation.domain.model.verified.organization.OrganizationVerified;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.verified.web.organization.command.CreateOrganizationCommand;
import me.graduation.interfaces.verified.web.organization.command.EditOrganizationCommand;
import me.graduation.interfaces.verified.web.organization.command.ListCommand;

/**
 * Created by ivan_ on 2015/4/10.
 */
public interface IOrganizationVerifiedService {

    OrganizationVerified findById(String id);

    Pagination<OrganizationVerified> pagination(ListCommand command);

    void edit(EditOrganizationCommand command);

    void create(CreateOrganizationCommand command);

    void delete(String id);

}
