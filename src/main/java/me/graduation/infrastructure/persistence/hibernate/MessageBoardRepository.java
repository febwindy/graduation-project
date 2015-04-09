package me.graduation.infrastructure.persistence.hibernate;

import me.graduation.domain.model.board.IMessageBoardRepository;
import me.graduation.domain.model.board.MessageBoard;
import me.graduation.infrastructure.persistence.hibernate.generic.AbstractHibernateGenericRepository;
import org.springframework.stereotype.Repository;

/**
 * Created by ivan_ on 2015/4/8.
 */
@Repository("messageBoardRepository")
public class MessageBoardRepository extends AbstractHibernateGenericRepository<MessageBoard, String>
        implements IMessageBoardRepository<MessageBoard, String> {
}
