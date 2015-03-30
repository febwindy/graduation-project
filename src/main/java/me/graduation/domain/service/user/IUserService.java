package me.graduation.domain.service.user;

import me.graduation.domain.model.user.User;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.user.web.command.CreateUserCommand;
import me.graduation.interfaces.user.web.command.ListCommand;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IUserService {

    User findByUsername(String username);

    User findById(String id);

    User create(CreateUserCommand command);

    Pagination<User> pagination(ListCommand command);

    void delete(String id);

}
