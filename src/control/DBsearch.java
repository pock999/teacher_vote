package control;

import java.sql.*;
import java.util.*;

public class DBsearch {
 	private DBMgr dbmgr;
 	private String sql;
 	
 	public DBsearch(){
 		dbmgr = new DBMgr();
 	}
 	public ResultSet getRank() throws SQLException{//取得所有排名
 		sql="SELECT TeacherName,TeacherID,Votes FROM teacher ORDER BY Votes DESC";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		return resultRS;
 	}
 	public ResultSet getRank(int i) throws SQLException{//取得前i名次
 		sql="SELECT TeacherName,TeacherID,Votes FROM teacher ORDER BY Votes DESC LIMIT "+i;
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		return resultRS;
 	}
 	public int getTotalVote() throws SQLException{
 		sql = "SELECT SUM(Votes) FROM teacher";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		int total=0;
 		while(resultRS.next()){
 			total = resultRS.getInt(1);
 		}
 		return total;
 	}
 	public boolean repeatID(String id) throws SQLException{
 		sql = "SELECT * FROM user WHERE UserID='"+id+"'";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		if(resultRS.next()){
 			return true;
 		}
 		return false;
 	}
 	public boolean login(String acc,String pwd) throws SQLException{
 		sql = "SELECT UserID,Password FROM user WHERE UserID = '"+acc+"' AND Password='"+pwd+"'";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		if(resultRS.next()){
 			return true;
 		}
 		return false;
 	}
 	public ResultSet getDname() throws SQLException{
 		sql = "SELECT DeptName FROM department";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		return resultRS;
 	}
 	public ResultSet getDeptTeacher(String dept) throws SQLException{
 		sql = "SELECT TeacherNAME,Level,DeptName,TeacherID FROM department,teacher WHERE department.DeptID=teacher.DeptID AND department.DeptName='"+dept+"'";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		return resultRS;
 	}
 	public ResultSet getDeptRank() throws SQLException{
 		sql = "SELECT department.DeptName,SUM(teacher.Votes) FROM department,teacher WHERE department.DeptID=teacher.DeptID GROUP BY department.DeptID ORDER BY SUM(teacher.Votes) DESC";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		return resultRS;
 	}
 	public ResultSet getDeptAllTeacher(String dept) throws SQLException{
 		sql = "SELECT TeacherID,TeacherNAME,Level,Expertise FROM department,teacher WHERE department.DeptID=teacher.DeptID AND department.DeptName='"+dept+"' ORDER BY TeacherID ASC";
 		ResultSet resultRS = dbmgr.queryDB(sql);
 		return resultRS;
 	}
 	public boolean checkVote(String userID){
 		sql = "SELECT voted FROM user WHERE UserID='"+userID+"'";
 		try{
 			ResultSet resultRS = dbmgr.queryDB(sql);
 			while(resultRS.next()){
 				String voted = resultRS.getString(1);
 				if(voted.equals("1")){
 					return true;
 				}
 			}
 			return false;
 		}catch(SQLException e){
 			e.printStackTrace();
 			return true;
 		}
 	}
}
