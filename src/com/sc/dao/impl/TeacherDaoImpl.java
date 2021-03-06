package com.sc.dao.impl;

import com.sc.dao.ITeacherDao;
import com.sc.domain.Student;
import com.sc.domain.Teacher;
import com.sc.util.JDBCUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author: fangju
 * @Date: 2019/5/25 15:40
 */
public class TeacherDaoImpl implements ITeacherDao {
    @Override
    public List<Teacher> getAllTeacher() throws SQLException {
        List<Teacher> teacherList = null;
        Connection conn = null;
        Statement st = null;
        ResultSet rs = null;
        String sql = "select * from teacher";
        conn = JDBCUtil.getConn();
        st = conn.createStatement();
        st.execute(sql);
        rs = st.getResultSet();
        teacherList = new ArrayList<>();
        while (rs.next()){
            Teacher teacher = new Teacher();
            teacher.setId(rs.getString("t_id"));
            teacher.setPassword(rs.getString("t_password"));
            teacher.setName(rs.getString("t_name"));
            teacher.setSex(rs.getString("t_sex"));
            teacher.setAge(rs.getInt("t_age"));
            teacher.setIdentity(rs.getString("t_identity"));
            teacher.setImage(rs.getString("t_image"));
            teacherList.add(teacher);
        }
        JDBCUtil.closeConn(conn,st,rs);
        return teacherList;
    }

    @Override
    public Teacher getTeacher(String id) throws SQLException {
        Teacher teacher = null;
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from teacher where t_id = ?";
        conn = JDBCUtil.getConn();
        psmt = conn.prepareStatement(sql);
        psmt.setString(1,id);
        psmt.execute();
        rs = psmt.getResultSet();
        rs.next();
        teacher = new Teacher();
        teacher.setId(rs.getString("t_id"));
        teacher.setPassword(rs.getString("t_password"));
        teacher.setName(rs.getString("t_name"));
        teacher.setSex(rs.getString("t_sex"));
        teacher.setAge(rs.getInt("t_age"));
        teacher.setIdentity(rs.getString("t_identity"));
        teacher.setImage(rs.getString("t_image"));
        JDBCUtil.closeConn(conn,psmt,rs);
        return teacher;
    }

    @Override
    public int insertTeacher(Teacher teacher) throws SQLException {
        Connection conn = null;
        PreparedStatement psmt = null;
        String sql = "insert into teacher(t_id,t_password,t_name,t_sex,t_age,t_image,t_identity) values(?,?,?,?,?,?,?)";
        conn = JDBCUtil.getConn();
        psmt = conn.prepareStatement(sql);
        psmt.setString(1,teacher.getId());
        psmt.setString(2,teacher.getPassword());
        psmt.setString(3,teacher.getName());
        psmt.setString(4,teacher.getSex());
        psmt.setInt(5,teacher.getAge());
        psmt.setString(6,teacher.getImage());
        psmt.setString(7,teacher.getIdentity());
        int i = psmt.executeUpdate();
        JDBCUtil.closeConn(conn,psmt,null);
        return i;
    }

    @Override
    public int updateTeacher(Teacher teacher) throws SQLException {
        Connection conn = null;
        PreparedStatement psmt = null;
        String sql = "update teacher set t_password = ?,t_name = ?,t_sex = ?,t_age = ?,t_image = ?,t_identity = ?" +
                " where t_id = ?";
        conn = JDBCUtil.getConn();
        psmt = conn.prepareStatement(sql);
        psmt.setString(1,teacher.getPassword());
        psmt.setString(2,teacher.getName());
        psmt.setString(3,teacher.getSex());
        psmt.setInt(4,teacher.getAge());
        psmt.setString(5,teacher.getImage());
        psmt.setString(6,teacher.getIdentity());
        psmt.setString(7,teacher.getId());
        int i = psmt.executeUpdate();
        JDBCUtil.closeConn(conn,psmt,null);
        return i;
    }

    @Override
    public int deleteTeacher(String id) throws SQLException {
        Connection conn = null;
        PreparedStatement psmt = null;
        String sql = "delete from teacher where t_id = ?";
        conn = JDBCUtil.getConn();
        psmt = conn.prepareStatement(sql);
        psmt.setString(1,id);
        int i = psmt.executeUpdate();
        JDBCUtil.closeConn(conn,psmt,null);
        return i;
    }

    @Override
    public boolean findTeacher(String username, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = "select * from teacher where t_id = ? and t_password = ?";
        conn = JDBCUtil.getConn();
        psmt = conn.prepareStatement(sql);
        psmt.setString(1,username);
        psmt.setString(2,password);
        psmt.execute();
        rs = psmt.getResultSet();
        if(rs.next()){
            JDBCUtil.closeConn(conn,psmt,rs);
            return true;
        }
        JDBCUtil.closeConn(conn,psmt,rs);
        return false;
    }

    @Override
    public List<Teacher> getPageData(Integer start, Integer end) throws SQLException {
        List<Teacher> teacherList = null;
        Connection conn = null;
        PreparedStatement psmt = null;
        ResultSet rs= null;
        String sql = "SELECT * FROM(SELECT ROWNUM NO,s.* FROM (SELECT * FROM teacher ORDER BY t_id ASC) s WHERE ROWNUM<=?) WHERE NO >=?";
        conn = JDBCUtil.getConn();
        psmt = conn.prepareStatement(sql);
        psmt.setInt(2,start);
        psmt.setInt(1,end);
        psmt.execute();
        rs = psmt.getResultSet();
        teacherList = new ArrayList<>();
        while (rs.next()){
            Teacher teacher = new Teacher();
            teacher.setId(rs.getString("t_id"));
            teacher.setPassword(rs.getString("t_password"));
            teacher.setName(rs.getString("t_name"));
            teacher.setSex(rs.getString("t_sex"));
            teacher.setAge(rs.getInt("t_age"));
            teacher.setIdentity(rs.getString("t_identity"));
            teacher.setImage(rs.getString("t_image"));
            teacherList.add(teacher);
        }
        JDBCUtil.closeConn(conn,psmt,rs);
        return teacherList;
    }

    @Override
    public int getTeacherCount() throws SQLException {
        Connection conn = null;
        Statement st = null;
        ResultSet rs= null;
        conn = JDBCUtil.getConn();
        st = conn.createStatement();
        String sql = "select count(*) as total from teacher";
        st.execute(sql);
        rs = st.getResultSet();
        rs.next();
        int totalNum = rs.getInt("total");
        JDBCUtil.closeConn(conn,st,rs);
        return totalNum;
    }
}
