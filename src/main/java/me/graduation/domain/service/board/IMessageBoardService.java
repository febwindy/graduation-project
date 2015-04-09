package me.graduation.domain.service.board;

import me.graduation.domain.model.board.MessageBoard;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.board.web.command.CreateBoardCommand;
import me.graduation.interfaces.board.web.command.EditBoardCommand;
import me.graduation.interfaces.board.web.command.ListCommand;

/**
 * Created by ivan_ on 2015/4/8.
 */
public interface IMessageBoardService {

    MessageBoard findById(String id);

    Pagination<MessageBoard> pagination(ListCommand command);

    void create(CreateBoardCommand command);

    void edit(EditBoardCommand command);

    void delete(String id);
}
