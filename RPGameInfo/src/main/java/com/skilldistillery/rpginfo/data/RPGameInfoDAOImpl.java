package com.skilldistillery.rpginfo.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rpginfo.entities.CharacterBuild;
import com.skilldistillery.rpginfo.entities.CharacterClass;
import com.skilldistillery.rpginfo.entities.Race;

@Transactional
@Service
public class RPGameInfoDAOImpl implements RPGameInfoDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public CharacterBuild findById(int id) {
		return em.find(CharacterBuild.class, id);
	}

	@Override
	public List<CharacterBuild> findAllBuilds() {
		String query = "SELECT cb FROM CharacterBuild cb";
		return em.createQuery(query, CharacterBuild.class).getResultList();
	}
	
	@Override
	public List<Race> findAllRaces() {
		String query = "SELECT r FROM Race r";
		return em.createQuery(query, Race.class).getResultList();
	}
	
	
	@Override
	public List<CharacterClass> findAllClasses() {
		String query = "SELECT cc FROM CharacterClass cc";
		return em.createQuery(query, CharacterClass.class).getResultList();
	}
	
	@Override
	public void insertCharacterBuild(CharacterBuild cb) {
		em.persist(cb);
	}

	@Override
	public CharacterBuild updateCharacterBuild(int id, CharacterBuild cb) {
		// TODO Auto-generated method stub
		CharacterBuild updating = null;
		
		updating = em.find(CharacterBuild.class, id);
		
		if (updating != null) {
			updating.setName(cb.getName());
			updating.setDescription(cb.getDescription());
			updating.setStrength(cb.getStrength());
			updating.setDexterity(cb.getDexterity());
			updating.setConstitution(cb.getConstitution());
			updating.setIntelligence(cb.getIntelligence());
			updating.setWisdom(cb.getWisdom());
			updating.setCharisma(cb.getCharisma());
			updating.setRace(cb.getRace());
			updating.setCharClass(cb.getCharClass());
			
		}
		
		return updating;
	}

	@Override
	public boolean deleteCharacterBuild(int id) {
		boolean success = false;
		
		CharacterBuild deleting = em.find(CharacterBuild.class, id);
		
		if (deleting != null) {
			em.remove(deleting);
			success = true;
		}
		return success;
	}

	@Override
	public Race findRaceById(int id) {
		String query = "SELECT r FROM Race r WHERE id = :id";
		Race result = null;
		
		List<Race> raceList = em.createQuery(query, Race.class).setParameter("id", id).getResultList();
		if (!raceList.isEmpty()) {
			result = raceList.get(0);
		}
		
		return result;
	}

	@Override
	public CharacterClass findClassById(int id) {
		String query = "SELECT cc FROM CharacterClass cc WHERE id = :id";
		CharacterClass result = null;
		
		List<CharacterClass> classList = em.createQuery(query, CharacterClass.class).setParameter("id", id).getResultList();
		if (!classList.isEmpty()) {
			result = classList.get(0);
		}
		
		return result;
	}

}
