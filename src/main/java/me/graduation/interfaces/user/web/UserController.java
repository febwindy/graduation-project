package me.graduation.interfaces.user.web;

import me.graduation.domain.model.user.User;
import me.graduation.domain.service.NoFoundException;
import me.graduation.domain.service.user.IUserService;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.user.web.command.CreateUserCommand;
import me.graduation.interfaces.user.web.command.EditUserCommand;
import me.graduation.interfaces.user.web.command.ListCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

/**
 * Created by _liwenhe on 2015/3/7.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/list")
    public ModelAndView list(ListCommand command) throws Exception {
        Pagination<User> pagination = userService.pagination(command);
        return new ModelAndView("/user/list", "pagination", pagination);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        return new ModelAndView("/user/create");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("user")CreateUserCommand command, BindingResult bindingResult) throws Exception {
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
        return new ModelAndView("/user/list");
    }

    @RequestMapping(value = "/view/{id}")
    public ModelAndView view(@PathVariable String id) throws Exception {
        User user = null;
        try {
            user = userService.findById(id);
        } catch (Exception e) {
            //TODO 优化
            e.printStackTrace();
        }
        return new ModelAndView("/user/view", "user", user);
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id) throws Exception {
        //TODO edit
        return null;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@Valid @ModelAttribute("user")EditUserCommand command) throws Exception {
        //TODO edit
        return null;
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView delete(@PathVariable String id) throws Exception {
        try {
            userService.delete(id);
        } catch (NoFoundException e) {
            //TODO 优化
            e.printStackTrace();
        }
        return new ModelAndView("/user/list");
    }

}
