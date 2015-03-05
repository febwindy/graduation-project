package me.graduation.domain.service.permission;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by _liwenhe on 2015/3/4.
 */
@Service("permissionService")
@Transactional(propagation = Propagation.REQUIRED, readOnly = true, rollbackFor = Exception.class)
public class PermissionService implements IPermissionService {
}