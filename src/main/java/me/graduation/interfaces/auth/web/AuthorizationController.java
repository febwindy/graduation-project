package me.graduation.interfaces.auth.web;

import me.graduation.interfaces.share.web.JsonMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Controller
@RequestMapping(value = "/auth")
public class AuthorizationController {

    @RequestMapping(value = "/login")
    public ModelAndView login(RedirectAttributes redirectAttributes) throws Exception {

        JsonMessage message = new JsonMessage();
        message.setStatus("1");
        message.setMessage("登录成功");

        redirectAttributes.addFlashAttribute("message", message);
        return new ModelAndView("redirect:/index");
    }

    @RequestMapping(value = "/failed")
    @ResponseBody
    public JsonMessage failed(@ModelAttribute("message")JsonMessage message) throws Exception {
        message.setStatus("0");
        message.setMessage("登录失败");

        return message;
    }

}
