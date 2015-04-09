package me.graduation.domain.service.board;

import me.graduation.application.SaltUser;
import me.graduation.domain.model.board.IMessageBoardRepository;
import me.graduation.domain.model.board.MessageBoard;
import me.graduation.domain.model.user.IUserRepository;
import me.graduation.domain.model.user.User;
import me.graduation.domain.service.NoFoundException;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.board.web.command.CreateBoardCommand;
import me.graduation.interfaces.board.web.command.EditBoardCommand;
import me.graduation.interfaces.board.web.command.ListCommand;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.FetchMode;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

/**
 * Created by ivan_ on 2015/4/8.
 */
@Service("messageBoardService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
public class MessageBoardService implements IMessageBoardService {

    @Autowired
    private IMessageBoardRepository<MessageBoard, String> messageBoardRepository;

    @Autowired
    private IUserRepository<User, String> userRepository;

    @Override
    public MessageBoard findById(String id) {
        MessageBoard messageBoard = messageBoardRepository.getById(id);
        if (null == messageBoard) {
            throw new NoFoundException("该留言没有发现");
        }
        return messageBoard;
    }

    @Override
    public Pagination<MessageBoard> pagination(ListCommand command) {

        command.setPageSize(10);

        List<Criterion> criterionList = new ArrayList<Criterion>();

        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (obj instanceof SaltUser) {
            GrantedAuthority authority = new SimpleGrantedAuthority("administrator");
            if (!((SaltUser) obj).getAuthorities().contains(authority)) {
                criterionList.add(Restrictions.eq("user.id", ((SaltUser) obj).getId()));
            }
        }

        if (null != command.getTitle() && !StringUtils.isEmpty(command.getTitle())) {
            criterionList.add(Restrictions.like("title", command.getTitle(), MatchMode.ANYWHERE));
        }

        Criterion[] restrictions = null;
        int size = criterionList.size();
        if (size> 0) {
            restrictions = new Criterion[size];
            criterionList.toArray(restrictions);
        }

        Order[] orders = new Order[]{Order.desc("updatedDate")};

        Map<String, FetchMode> fetchModeMap = new HashMap<String, FetchMode>();
        fetchModeMap.put("user", FetchMode.JOIN);

        return messageBoardRepository.pagination(command.getPage(), command.getPageSize(), restrictions, orders, fetchModeMap);
    }

    @Override
    public void create(CreateBoardCommand command) {

        User user = null;

        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (obj instanceof SaltUser) {
            user = userRepository.getById(((SaltUser) obj).getId());
        }

        if (null == user) {
            throw new NoFoundException("该用户不存在");
        }

        MessageBoard board = new MessageBoard();
        board.setTitle(command.getTitle());
        board.setContent(command.getContent());
        board.setUser(user);
        board.setCreatedDate(new Date());
        board.setUpdatedDate(new Date());

        messageBoardRepository.save(board);
    }

    @Override
    public void edit(EditBoardCommand command) {

        User user = null;

        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (obj instanceof SaltUser) {
            user = userRepository.getById(((SaltUser) obj).getId());
        }

        if (null == user) {
            throw new NoFoundException("该用户不存在");
        }

        MessageBoard board = this.findById(command.getId());
        board.setTitle(command.getTitle());
        board.setContent(command.getContent());
        board.setUpdatedDate(new Date());
        board.setUser(user);

        messageBoardRepository.update(board);
    }

    @Override
    public void delete(String id) {

        User user = null;

        Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (obj instanceof SaltUser) {
            user = userRepository.getById(((SaltUser) obj).getId());
        }

        if (null == user) {
            throw new NoFoundException("该用户不存在");
        }

        MessageBoard board = this.findById(id);

        messageBoardRepository.delete(board);
    }
}
