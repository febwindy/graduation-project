package me.graduation.interfaces;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.Collection;
import java.util.Collections;

/**
 * Created by _liwenhe on 2015/3/3.
 */
@Controller
@RequestMapping("/")
public class IndexController {

    @RequestMapping
    public ModelAndView index() throws Exception {
        return new ModelAndView("/login");
    }

    @RequestMapping(value = "/index")
    public ModelAndView success() throws Exception {
        UserDetails user = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        Collection authorities = user.getAuthorities();

        return new ModelAndView("/index");
    }

}
