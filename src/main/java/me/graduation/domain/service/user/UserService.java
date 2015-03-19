package me.graduation.domain.service.user;

import me.graduation.domain.model.user.IUserRepository;
import me.graduation.domain.model.user.User;
import me.graduation.domain.service.ExistException;
import me.graduation.interfaces.user.web.command.CreateUserCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = false, rollbackFor = Exception.class)
public class UserService implements IUserService{

    @Autowired
    private IUserRepository<User, String> userRepository;

    @Override
    public User findByUsername(String username) {
        return userRepository.loadByUsername(username);
    }

    @Override
    public User create(CreateUserCommand command) {
        Md5PasswordEncoder md5 = new Md5PasswordEncoder();
        md5.setEncodeHashAsBase64(false);

        String salt = UUID.randomUUID().toString().replaceAll("-", "");
        String pwd = md5.encodePassword(command.getConfirmPassword(), salt);
        Boolean sex;
        if ("0".equals(command.getSex())) {
            sex = false;
        } else {
            sex = true;
        }

        User user = new User();
        user.setUsername(command.getUsername());
        user.setPassword(pwd);
        user.setEmail(command.getEmail());
        user.setSex(sex);
        user.setTelephone(command.getTelephone());
        user.setSalt(salt);
        user.setRoles(null);

        try {
            userRepository.save(user);
        } catch (Exception e) {
            throw new ExistException("该用户已存在");
        }

        return user;
    }
}
