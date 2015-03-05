package me.graduation.domain.service.user;

import me.graduation.domain.model.user.User;

/**
 * Created by _liwenhe on 2015/3/4.
 */
public interface IUserService {

    User findByUsername(String username);

}
