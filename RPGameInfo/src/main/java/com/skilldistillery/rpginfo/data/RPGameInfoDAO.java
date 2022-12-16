package com.skilldistillery.rpginfo.data;

import java.util.List;

import com.skilldistillery.rpginfo.entities.CharacterBuild;

public interface RPGameInfoDAO {
	public CharacterBuild findById(int id);
	
	public List<CharacterBuild> findAll();
	
	public CharacterBuild updateCharacterBuild(int id, CharacterBuild cb);
	
	public boolean deleteCharacterBuild (int id);
}
