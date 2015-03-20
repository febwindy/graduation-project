package me.graduation.interfaces;

import me.graduation.domain.service.ExistException;
import me.graduation.domain.service.user.IUserService;
import me.graduation.interfaces.share.web.AlertMessage;
import me.graduation.interfaces.user.web.command.CreateUserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.Locale;

/**
 * Created by _liwenhe on 2015/3/3.
 */
@Controller
public class IndexController {

    @Autowired
    private MessageSource messageSource;

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/")
    public ModelAndView login() throws Exception {
        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (obj instanceof User) {
            return new ModelAndView("redirect:/index");
        }
        return new ModelAndView("/signin");
    }

    @RequestMapping(value = "/index")
    public ModelAndView index() throws Exception {
        return new ModelAndView("/index");
    }

    @RequestMapping(value = "/signup", method = RequestMethod.GET)
    public ModelAndView signUp() throws Exception {
        return new ModelAndView("/signup");
    }

    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public ModelAndView signUp(@Valid @ModelAttribute("user")CreateUserCommand command, BindingResult bindingResult, Locale locale) throws Exception {

        if (!command.getPassword().equals(command.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "CreateUserCommand.confirmPasswordAndPassword.NotEquals");
        }

        if (bindingResult.hasErrors()) {
            return new ModelAndView("/signup", "user", command);
        }

        try {
            userService.create(command);
        } catch (ExistException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING,
                    this.messageSource.getMessage("default.repeat.found.message", new Object[]{command.getUsername()}, locale));
            return new ModelAndView("/signup", "user", command)
                    .addObject(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        }

        AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.WARNING,
                this.messageSource.getMessage("default.create.success.message", null, locale));
        return new ModelAndView("redirect:/", AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
    }

    @RequestMapping(value = "/about")
    public ModelAndView about() throws Exception {
        return new ModelAndView("/about");
    }

}
