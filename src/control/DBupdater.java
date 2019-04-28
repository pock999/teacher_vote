package control;
import java.sql.*;

public class DBupdater {
	private DBMgr dbmgr;
 	private String sql;
 	public DBupdater(){
 		dbmgr = new DBMgr();
 	}
 	public boolean register(String name,String id,String pwd){
 		sql = "INSERT INTO user(UserID,Password,UserName,voted,TeacherID) VALUES('"+id+"','"+pwd+"','"+name+"',0,'0')";
 		try{
 			dbmgr.modify(sql);
 			return true;
 		}catch(SQLException e){
 			e.printStackTrace();
 			return false;
 		}
 		
 	}
 	public boolean voteTeacher(String id,String userID){
 		sql = "UPDATE teacher SET Votes=Votes+1 WHERE TeacherID = '"+id+"'";
 		DBsearch dbs = new DBsearch();
 		boolean check = dbs.checkVote(userID);
 		if(check == true){
 			return false;
 		}else{
 			try{
 	 			dbmgr.modify(sql);
 	 			boolean voteState = votedState(id,userID);
 	 			return true;
 	 		}catch(SQLException e){
 	 			e.printStackTrace();
 	 			return false;
 	 		}
 		}
 		
 	}
 	public boolean votedState(String Tid,String userID){
 		sql = "UPDATE user SET voted=1,TeacherID='"+Tid+"' WHERE UserID='"+userID+"'";
 		try{
 			dbmgr.modify(sql);
 			return true;
 		}catch(SQLException e){
 			e.printStackTrace();
 			return false;
 		}
 	}
 	
}
