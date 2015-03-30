package me.graduation.interfaces.user.web;

import me.graduation.domain.service.user.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by _liwenhe on 2015/3/7.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @RequestMapping(value = "/list")
    public ModelAndView list() throws Exception {
        return null;
    }

    @RequestMapping(value = "/create")
    public ModelAndView create() throws Exception {
        return null;
    }

    @RequestMapping(value = "/edit/{id}")
    public ModelAndView edit(@PathVariable String id) throws Exception {
        return null;
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView delete(@PathVariable String id) throws Exception {
        return null;
    }

}
