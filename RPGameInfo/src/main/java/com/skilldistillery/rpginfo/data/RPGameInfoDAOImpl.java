package com.skilldistillery.rpginfo.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.rpginfo.entities.CharacterBuild;

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
	public List<CharacterBuild> findAll() {
		String query = "SELECT cb FROM CharacterBuild cb";
		return em.createQuery(query, CharacterBuild.class).getResultList();
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

}
