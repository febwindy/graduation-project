package me.graduation.domain.service.user;

import me.graduation.domain.model.user.IUserRepository;
import me.graduation.domain.model.user.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = true, rollbackFor = Exception.class)
public class UserService implements IUserService{

    @Autowired
    private IUserRepository<User, String> userRepository;

    @Override
    public User findByUsername(String username) {
        return userRepository.loadByUsername(username);
    }
}
