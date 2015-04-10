package me.graduation.domain.model.verified.organization;

import me.graduation.domain.model.verified.AbstractVerified;

/**
 * Created by ivan_ on 2015/4/10.
 */
public class OrganizationVerified extends AbstractVerified {

    private String source;

    private String destination;

    private String reason;

    private String createdDate;

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

    public String getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(String createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrganizationVerified that = (OrganizationVerified) o;

        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;
        if (destination != null ? !destination.equals(that.destination) : that.destination != null) return false;
        if (reason != null ? !reason.equals(that.reason) : that.reason != null) return false;
        if (source != null ? !source.equals(that.source) : that.source != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = source != null ? source.hashCode() : 0;
        result = 31 * result + (destination != null ? destination.hashCode() : 0);
        result = 31 * result + (reason != null ? reason.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }
}
