package me.graduation.interfaces.board.web;

import me.graduation.domain.model.board.MessageBoard;
import me.graduation.domain.service.NoFoundException;
import me.graduation.domain.service.board.IMessageBoardService;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.board.web.command.CreateBoardCommand;
import me.graduation.interfaces.board.web.command.EditBoardCommand;
import me.graduation.interfaces.board.web.command.ListCommand;
import me.graduation.interfaces.share.web.AlertMessage;
import me.graduation.interfaces.share.web.BaseController;
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
import java.util.Locale;

/**
 * Created by ivan_ on 2015/4/8.
 */
@Controller
@RequestMapping("/board")
public class MessageBoardController extends BaseController {

    @Autowired
    private IMessageBoardService messageBoardService;

    @RequestMapping(value = "/list")
    public ModelAndView list(ListCommand command) throws Exception {
        Pagination<MessageBoard> pagination = messageBoardService.pagination(command);
        return new ModelAndView("/board/list", "pagination", pagination)
                .addObject("board", command);
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView create() throws Exception {
        return new ModelAndView("/board/create");
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView create(@Valid @ModelAttribute("board")CreateBoardCommand command,
                               RedirectAttributes redirectAttributes,
                               BindingResult bindingResult,
                               Locale locale) throws Exception {

        if (bindingResult.hasErrors()) {
            return new ModelAndView("/board/create", "board", command);
        }

        try {
            messageBoardService.create(command);
        } catch (NoFoundException e) {
            return new ModelAndView("redirect:/logout");
        }

        AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS,
                this.getMessage("default.create.success.message", new Object[]{command.getTitle()}, locale));
        redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);

        return new ModelAndView("redirect:/board/list");
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        MessageBoard board;
        try {
            board = messageBoardService.findById(id);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.DANGER, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
            return new ModelAndView("redirect:/board/list");
        }

        return new ModelAndView("/board/edit", "board", board);
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public ModelAndView edit(@Valid @ModelAttribute("board")EditBoardCommand command,
                             RedirectAttributes redirectAttributes,
                             BindingResult bindingResult,
                             Locale locale) throws Exception {

        if (bindingResult.hasErrors()) {
            return new ModelAndView("/board/create", "board", command);
        }

        try {
            messageBoardService.edit(command);
        } catch (NoFoundException e) {
            return new ModelAndView("redirect:/logout");
        }

        AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS,
                this.getMessage("default.edit.success.message", new Object[]{command.getTitle()}, locale));
        redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);

        return new ModelAndView("redirect:/board/list");
    }

    @RequestMapping(value = "/view/{id}")
    public ModelAndView view(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        MessageBoard board;
        try {
            board = messageBoardService.findById(id);
        } catch (NoFoundException e) {
            AlertMessage alertMessage = new AlertMessage(AlertMessage.MessageType.DANGER, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
            redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
            return new ModelAndView("redirect:/board/list");
        }

        return new ModelAndView("/board/view", "board", board);
    }

    @RequestMapping(value = "/delete/{id}")
    public ModelAndView delete(@PathVariable String id, RedirectAttributes redirectAttributes, Locale locale) throws Exception {

        AlertMessage alertMessage;
        try {
            messageBoardService.delete(id);
            alertMessage = new AlertMessage(AlertMessage.MessageType.SUCCESS, this.getMessage("default.delete.success.message",
                    new Object[]{id}, locale));
        } catch (NoFoundException e) {
            alertMessage = new AlertMessage(AlertMessage.MessageType.DANGER, this.getMessage("default.noFoundId.message",
                    new Object[]{id}, locale));
        }

        redirectAttributes.addFlashAttribute(AlertMessage.MODEL_ATTRIBUTE_KEY, alertMessage);
        return new ModelAndView("redirect:/board/list");
    }

}
