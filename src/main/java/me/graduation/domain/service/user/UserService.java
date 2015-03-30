package me.graduation.domain.service.user;

import me.graduation.domain.model.user.IUserRepository;
import me.graduation.domain.model.user.User;
import me.graduation.domain.service.NoFoundException;
import me.graduation.infrastructure.persistence.hibernate.generic.Pagination;
import me.graduation.interfaces.user.web.command.CreateUserCommand;
import me.graduation.interfaces.user.web.command.ListCommand;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
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
    public User findById(String id) {
        User user = userRepository.getById(id);
        if (null == user) {
            throw new NoFoundException("该用户不存在.");
        }
        return user;
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

        userRepository.save(user);

        return user;
    }

    @Override
    public Pagination<User> pagination(ListCommand command) {
        List<Criterion> criterionList = new ArrayList<Criterion>();

        if (null != command.getUsername() && !StringUtils.isEmpty(command.getUsername())) {
            criterionList.add(Restrictions.like("username", command.getUsername()));
        }

        Criterion[] restrictions = null;
        int size = criterionList.size();
        if (size> 0) {
            restrictions = new Criterion[size];
            criterionList.toArray(restrictions);
        }

        Order[] orders = {Order.desc("createdDate")};
        return userRepository.pagination(command.getPage(), command.getPageSize(), restrictions, orders);
    }

    @Override
    public void delete(String id) {
        User user;
        try {
            user = this.findById(id);
        } catch (NoFoundException e) {
            throw new NoFoundException(e);
        }
        userRepository.delete(user);
    }
}
