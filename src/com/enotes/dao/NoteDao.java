package com.enotes.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.enotes.pojo.Note;
import com.enotes.pojo.User;

public class NoteDao {

	private Connection conn;

	public NoteDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addNotes(String title, String content, int uid) {
		boolean f = false;

		try {
			String query = "insert into notes(title, content, uid) values(?,?,?)";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, uid);

			int i = psmt.executeUpdate();

			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Note> getAllNotesByUserId(int userId) {

		List<Note> list = new ArrayList<Note>();
		Note note = null;

		try {

			String query = "select * from notes where uid=? order by id DESC";
			PreparedStatement psmt = conn.prepareStatement(query);
			psmt.setInt(1, userId);

			ResultSet rs = psmt.executeQuery();

			while (rs.next()) {
				note = new Note();
				note.setId(rs.getInt("id"));
				note.setTitle(rs.getString("title"));
				note.setContent(rs.getString("content"));
				list.add(note);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public Note getNoteById(int noteId) {

		Note note = null;
		
		try {
			
			String query="select * from notes where id=?";
			PreparedStatement psmt=conn.prepareStatement(query);
			psmt.setInt(1, noteId);
			
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				note=new Note();
				note.setId(rs.getInt(1));
				note.setTitle(rs.getString(2));
				note.setContent(rs.getString(3));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return note;

	}
	
	public boolean updateNote(int note_id, String title, String content) {
		
		boolean f=false;
		
		try {
			
			String query="update notes set title=?, content=? where id=?";
			PreparedStatement psmt=conn.prepareStatement(query);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, note_id);
			
			int i = psmt.executeUpdate();
			
			if(i>0) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
		
	}

	public boolean deleteNote(Integer note_id) {
		boolean f=false;
		
		try {
			
			String query="delete from notes where id=?";
			PreparedStatement psmt=conn.prepareStatement(query);
			psmt.setInt(1, note_id);
			
			int i = psmt.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}

}
