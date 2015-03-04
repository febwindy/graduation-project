package me.graduation.interfaces;

import me.graduation.domain.model.user.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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

}
