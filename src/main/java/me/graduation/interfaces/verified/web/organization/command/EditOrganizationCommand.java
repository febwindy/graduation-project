package me.graduation.interfaces.verified.web.organization.command;

import me.graduation.domain.model.user.User;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by ivan_ on 2015/4/10.
 */
public class EditOrganizationCommand {

    private String id;

    @NotEmpty(message = "{CreateOrganizationCommand.source.NotEmpty}")
    private String source;

    @NotEmpty(message = "{CreateOrganizationCommand.destination.NotEmpty}")
    private String destination;

    @NotEmpty(message = "{CreateOrganizationCommand.reason.NotEmpty}")
    private String reason;

    private User creator;

    private Boolean status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public User getCreator() {
        return creator;
    }

    public void setCreator(User creator) {
        this.creator = creator;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }
}
