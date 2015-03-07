package me.graduation.interfaces.auth.web;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Controller
@RequestMapping(value = "/auth")
public class AuthorizationController {

    @RequestMapping(value = "/login")
    public ModelAndView login() throws Exception {
        return new ModelAndView("redirect:/index");
    }

    @RequestMapping(value = "/failed")
    public ModelAndView failed() throws Exception {
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/denied")
    public ModelAndView denied() throws Exception {
        return new ModelAndView("redirect:/");
    }

}
