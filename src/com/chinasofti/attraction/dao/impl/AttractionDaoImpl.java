package com.chinasofti.attraction.dao.impl;

import com.chinasofti.attraction.dao.AttractionDao;
import com.chinasofti.attraction.entity.Attraction;
import com.chinasofti.base.impl.BaseDaoImpl;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class AttractionDaoImpl extends BaseDaoImpl<Attraction> implements AttractionDao {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    public List<Attraction> changePlace() {

        List<Attraction> list = new ArrayList<>();
        List num = new ArrayList<>();
        for (int i = 0; i < 4; i++) {
            int id = (int) (Math.random() * (32 - 25 + 1) + 25);
            Attraction attraction = hibernateTemplate.get(Attraction.class, id);
            list.add(attraction);
        }
        return list;
    }

    @Override
    public List queryOneByName(String place) {

        return hibernateTemplate.execute(new HibernateCallback<List>() {

            public List doInHibernate(Session session) throws HibernateException {

                String hql = "from Attraction where attractionName like '%"+place+"%'";

                Query query = session.createQuery(hql);
                List list = query.list();
                return list;
            }
        });
    }
}
