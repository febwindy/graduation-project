package me.graduation.domain.model.board;

import me.graduation.infrastructure.persistence.hibernate.generic.IHibernateGenericRepository;

import java.io.Serializable;

/**
 * Created by ivan_ on 2015/4/8.
 */
public interface IMessageBoardRepository<T, ID extends Serializable> extends IHibernateGenericRepository<T, ID> {
}
