package com.skilldistillery.rpginfo.data;

import java.util.List;

import com.skilldistillery.rpginfo.entities.CharacterBuild;
import com.skilldistillery.rpginfo.entities.CharacterClass;
import com.skilldistillery.rpginfo.entities.Race;

public interface RPGameInfoDAO {
	public CharacterBuild findById(int id);
	
	public List<CharacterBuild> findAllBuilds();
	
	public void insertCharacterBuild (CharacterBuild cb);
	
	public CharacterBuild updateCharacterBuild(int id, CharacterBuild cb);
	
	public boolean deleteCharacterBuild (int id);
	
	public List<Race> findAllRaces();
	
	public Race findRaceById(int id);
	
	public List<CharacterClass> findAllClasses();
	
	public CharacterClass findClassById(int id);
}
