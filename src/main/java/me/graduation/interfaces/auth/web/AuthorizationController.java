package me.graduation.interfaces.auth.web;

import com.alibaba.fastjson.JSONObject;
import me.graduation.domain.model.user.User;
import me.graduation.interfaces.share.web.JsonMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Controller
@RequestMapping(value = "/auth")
public class AuthorizationController {

    @RequestMapping(value = "/login")
    public ModelAndView login(User user, RedirectAttributes redirectAttributes) throws Exception {

        JsonMessage message = new JsonMessage();
        message.setStatus("1");
        message.setMessage("登录成功");

        try {
            Object obj = JSONObject.toJSON(user);
            message.setData(obj);

            throw new Exception();

//            return new ModelAndView("/index");
//            redirectAttributes.addFlashAttribute("message", message);
//            return new ModelAndView("redirect:/auth/failed");
        } catch (Exception e) {
            message.setStatus("0");
            message.setMessage("登录失败");

            redirectAttributes.addFlashAttribute("message", message);

            return new ModelAndView("redirect:/auth/failed");
        }
    }

    @RequestMapping(value = "/failed")
    @ResponseBody
    public JsonMessage failed(@ModelAttribute("message")JsonMessage message) throws Exception {
        return message;
    }

}
