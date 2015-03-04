package me.graduation.domain.service.role;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Service("roleService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = true, rollbackFor = Exception.class)
public class RoleService implements IRoleService {
}
