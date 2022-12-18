package com.skilldistillery.rpginfo.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ClassTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private CharacterClass clas;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	    emf = Persistence.createEntityManagerFactory("JPARolePlayingGameInfo");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	    emf.close();
	}
	
	@BeforeEach
	void setUp() throws Exception {
	    em = emf.createEntityManager();
	    clas = em.find(CharacterClass.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		clas = null;
	    em.close();
	}

	@Test
	void test_entity_mappings() {
		assertNotNull(clas);
		assertEquals("Rogue", clas.getName());
	}

}
