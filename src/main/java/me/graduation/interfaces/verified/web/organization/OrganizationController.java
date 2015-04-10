package me.graduation.interfaces.verified.web.organization;

import me.graduation.application.SaltUser;
import me.graduation.domain.model.user.User;
import me.graduation.domain.model.verified.organization.OrganizationVerified;
import me.graduation.domain.service.NoFoundException;
import me.graduation.domain.service.user.IUserService;
import me.graduation.domain.service.verified.organization.IOrganizationVerifiedService;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.share.web.AlertMessage;
import me.graduation.interfaces.share.web.BaseController;
import me.graduation.interfaces.user.web.command.EditUserCommand;
import me.graduation.interfaces.verified.web.organization.command.CreateOrganizationCommand;
import me.graduation.interfaces.verified.web.organization.command.EditOrganizationCommand;
import me.graduation.interfaces.verified.web.organization.command.ListCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Locale;

/**
 * Created by ivan_ on 2015/4/10.
 */
@Controller
@RequestMapping("/organization/verified")
public class OrganizationController extends BaseController {

    @Autowired
    private IOrganizationVerifiedService organizationVerifiedService;

    @Autowired
    private IUserService userService;

    @RequestMapping("/list")
    public ModelAndView list(ListCommand command) throws Exception {
        Pagination<OrganizationVerified> pagination = organizationVerifiedService.pagination(command);
        return new ModelAndView("/verified/organization/list", "pagination", pagination);
    }

    @RequestMapping("/ok/{id}")
    public ModelAndView list(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        AlertMessage alertMessage;

        try {
            OrganizationVerified organizationVerified = organizationVerifiedService.findById(id);

            User user = organizationVerified.getCreator();
            user.setOrganization(organizationVerified.getDestination());

            String sex = user.getSex() ? "1" : "0";

            EditUserCommand command = new EditUserCommand();
            command.setId(user.getId());
            command.setUsername(user.getUsername());
            command.setRealName(user.getRealName());
            command.setEmail(user.getEmail());
            command.setTelephone(user.getTelephone());
            command.setIdCard(user.getIdCard());
            command.setSex(sex);
            command.setOrganization(user.getOrganization());
            command.setRemark(user.getRemark());

            userService.edit(command);

            EditOrganizationCommand organizationCommand = new EditOrganizationCommand();
            organizationCommand.setId(id);
            organizationCommand.setReason(organizationVerified.getReason());
            organizationCommand.setCreator(organizationVerified.getCreator());
            organizationCommand.setDestination(organizationVerified.getDestination());
            organizationCommand.setSource(organizationVerified.getSource());
            organizationCommand.setStatus(Boolean.TRUE);

            organizationVerifiedService.edit(organizationCommand);

            alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS, this.getMessage("UserVerified.auth.ok",
                    new Object[]{user.getUsername()}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        } catch (Exception e) {
            alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        }

        return new ModelAndView("redirect:/organization/verified/list");
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView delete(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        try {
            organizationVerifiedService.delete(id);

            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.delete.success.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        }

        return new ModelAndView("redirect:/organization/verified/list");
    }

    @RequestMapping(value = "/process_list")
    public ModelAndView process(ListCommand command) throws Exception {
        Pagination<OrganizationVerified> pagination = organizationVerifiedService.pagination(command);
        return new ModelAndView("/organization/list", "pagination", pagination);
    }

    @RequestMapping(value = "/process_list/delete/{id}")
    public ModelAndView process(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        try {
            organizationVerifiedService.delete(id);

            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.delete.success.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        }

        return new ModelAndView("redirect:/organization/verified/process_list");
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create(@ModelAttribute("organization")CreateOrganizationCommand command) throws Exception {
        return new ModelAndView("/organization/create", "organization", command);
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@ModelAttribute("organization")CreateOrganizationCommand command,
                               RedirectAttributes redirectAttributes,
                               Locale locale,
                               BindingResult bindingResult) throws Exception {

        if (bindingResult.hasErrors()) {
            return new ModelAndView("/organization/create", "organization", command);
        }

        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (null == obj) {
            return new ModelAndView("redirect:/logout");
        }

        SaltUser saltUser = (SaltUser) obj;
        User user;
        try {
            user = userService.findById(saltUser.getId());
        } catch (Exception e) {
            return new ModelAndView("redirect:/logout");
        }

        command.setStatus(Boolean.FALSE);
        command.setCreator(user);

        organizationVerifiedService.create(command);

        AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS,
                this.getMessage("default.create.success.message", new Object[]{command.getSource()}, locale));
        redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);

        return new ModelAndView("redirect:/organization/verified/process_list");
    }

}
