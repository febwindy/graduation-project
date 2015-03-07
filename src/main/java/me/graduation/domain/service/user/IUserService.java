package me.graduation.domain.service.user;

import me.graduation.domain.model.user.User;
import me.graduation.interfaces.user.web.command.CreateUserCommand;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IUserService {

    User findByUsername(String username);

    User create(CreateUserCommand command);

}
