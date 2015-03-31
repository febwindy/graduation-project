package me.graduation.interfaces.user.web;

import me.graduation.domain.model.role.Role;
import me.graduation.domain.model.user.User;
import me.graduation.domain.service.NoFoundException;
import me.graduation.domain.service.role.IRoleService;
import me.graduation.domain.service.user.IUserService;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.share.web.AlertMessage;
import me.graduation.interfaces.share.web.BaseController;
import me.graduation.interfaces.user.web.command.AuthorizationCommand;
import me.graduation.interfaces.user.web.command.CreateUserCommand;
import me.graduation.interfaces.user.web.command.EditUserCommand;
import me.graduation.interfaces.user.web.command.ListCommand;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Locale;

/**
 * Created by _liwenhe on 2015/3/7.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;

    @RequestMapping(value = "/list")
    public ModelAndView list(@ModelAttribute("user")ListCommand command) throws Exception {
        Pagination<User> pagination = userService.pagination(command);
        return new ModelAndView("/user/list", "pagination", pagination)
                .addObject("user", command);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        return new ModelAndView("/user/create");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("user")CreateUserCommand command, BindingResult bindingResult,
                               RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        User repeatUser = userService.findByUsername(command.getUsername());
        if (null != repeatUser) {
            bindingResult.rejectValue("username", "CreateUserCommand.username.found",  new Object[]{command.getUsername()}, null);
        }
        if (!command.getPassword().equals(command.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "CreateUserCommand.confirmPasswordAndPassword.NotEquals");
        }
        if (bindingResult.hasErrors()) {
            return new ModelAndView("/user/create", "user", command);
        }

        userService.create(command);

        AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS, this.getMessage("default.create.success.message",
                new Object[]{command.getUsername()}, locale));
        redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        return new ModelAndView("redirect:/user/list");

    }

    @RequestMapping(value = "/view/{id}")
    public ModelAndView view(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        User user;
        try {
            user = userService.findById(id, true);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
            return new ModelAndView("redirect:/user/list");
        }

        return new ModelAndView("/user/view", "user", user);

    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id, EditUserCommand command, RedirectAttributes redirectAttributes,
                             Locale locale) throws Exception {

        try {
            User user = userService.findById(id);

            BeanUtils.copyProperties(user, command);
            String sex = user.getSex() ? "1" : "0";
            command.setSex(sex);
        } catch (Exception e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
            return new ModelAndView("redirect:/user/list");
        }

        return new ModelAndView("/user/edit", "user", command);

    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView edit(@Valid @ModelAttribute("user")EditUserCommand command,
                             RedirectAttributes redirectAttributes,
                             BindingResult bindingResult,
                             Locale locale) throws Exception {

        if (!command.getPassword().equals(command.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "CreateUserCommand.confirmPasswordAndPassword.NotEquals");
        }
        if (StringUtils.isEmpty(command.getPassword()) && !StringUtils.isEmpty(command.getConfirmPassword())) {
            bindingResult.rejectValue("password", "CreateUserCommand.password.NotEmpty");
        }
        if (!StringUtils.isEmpty(command.getPassword()) && StringUtils.isEmpty(command.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "CreateUserCommand.confirmPassword.NotEmpty");
        }
        if (bindingResult.hasErrors()) {
            return new ModelAndView("/user/edit", "user", command);
        }

        AlertMessage alertMessage;
        try {
            userService.edit(command);
            alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS, this.getMessage("default.edit.success.message",
                    new Object[]{command.getUsername()}, locale));
        } catch (NoFoundException e) {
            alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFound.message",
                    new Object[]{command.getUsername()}, locale));
        }

        redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        return new ModelAndView("redirect:/user/list");

    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView delete(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        try {
            userService.delete(id);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        }

        return new ModelAndView("redirect:/user/list");

    }

    @RequestMapping(value = "/authorization/{id}", method = RequestMethod.GET)
    public ModelAndView authorization(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        List<Role> roles = roleService.findAll();

        User user;
        try {
            user = userService.findById(id, true);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
            return new ModelAndView("redirect:/user/list");
        }

        return new ModelAndView("/user/authorization", "roles", roles)
                .addObject("user", user);

    }

    @RequestMapping(value = "/authorization/{id}", method = RequestMethod.POST)
    public ModelAndView authorization(@ModelAttribute("user")AuthorizationCommand command,
                                      RedirectAttributes redirectAttributes,
                                      Locale locale) throws Exception {

        try {
            userService.authorization(command);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.DANGER, this.getMessage("AuthorizationCommand.failed.message",
                    new Object[]{command.getUsername()}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        }

        AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS, this.getMessage("AuthorizationCommand.success.message",
                new Object[]{command.getUsername()}, locale));
        redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);

        return new ModelAndView("redirect:/user/list");
    }

}
