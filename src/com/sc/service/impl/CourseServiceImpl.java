package com.sc.service.impl;

import com.sc.dao.DaoFactory;
import com.sc.dao.ICourseDao;
import com.sc.domain.Course;
import com.sc.domain.PageBean;
import com.sc.domain.Student;
import com.sc.service.ICourseService;

import java.sql.SQLException;
import java.util.List;

/**
 * @Author: fangju
 * @Date: 2019/5/26 17:24
 */
public class CourseServiceImpl implements ICourseService {
    private ICourseDao courseDao;
    @Override
    public List<Course> getAllCourse(){
        courseDao = DaoFactory.getCourseDao();
        try {
            return courseDao.getAllCourse();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Course getCourse(String number){
        courseDao = DaoFactory.getCourseDao();
        try {
            return courseDao.getCourse(number);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean insertCourse(Course course){
        courseDao = DaoFactory.getCourseDao();
        try {
            if(courseDao.insertCourse(course) > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean updateCourse(Course course){
        courseDao = DaoFactory.getCourseDao();
        try {
            if(courseDao.updateCourse(course) > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCourse(String number){
        courseDao = DaoFactory.getCourseDao();
        try {
            if(courseDao.deleteCourse(number) > 0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public PageBean<Course> getPageBean(Integer currentPage) {
        courseDao = DaoFactory.getCourseDao();
        PageBean<Course> pageBean = null;
        try {
            pageBean = new PageBean<>();
            pageBean.setTotalCount(courseDao.getCourseCount());//设置总数量
            pageBean.setCurrentPage(currentPage);//设置当前页
            pageBean.setList(courseDao.getPageData(pageBean.getStart(),pageBean.getEnd()));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pageBean;
    }

    @Override
    public int getStudentCount() {
        courseDao = DaoFactory.getCourseDao();
        try {
            return courseDao.getCourseCount();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
}
