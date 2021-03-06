package com.chinasofti.role.service;

import com.chinasofti.base.PageBean;
import com.chinasofti.role.dao.MenuDao;
import com.chinasofti.role.entity.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description MenuService
 * @Author WYR
 * @CreateTime 2019-04-28 9:52
 */
@Service
public class MenuService {
    @Autowired
    private MenuDao dao;

    public List<Menu> query() {
        return dao.queryAll();
    }

    public List<Menu> queryByPageBean(PageBean pageBean) {
        return dao.queryByPageBean(pageBean);
    }

    public void addMenu(Menu menu) {
        dao.add(menu);
    }

    public Menu queryMenu(Integer menuId) {
        return dao.queryById(menuId);
    }

    public Integer getCount() {
        return dao.getCount();
    }

    public void updateMenu(Menu menu) {
        dao.update(menu);
    }

    public void deleteMenu(Integer menuId) {
        dao.delete(dao.queryById(menuId));
    }

    public List<Menu> findMenuByUserId(Integer userId) {
        return dao.findMenuByUserId(userId);
    }
}
