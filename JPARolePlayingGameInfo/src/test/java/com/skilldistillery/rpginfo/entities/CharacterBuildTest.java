package com.skilldistillery.rpginfo.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class CharacterBuildTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private CharacterBuild build;
	
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
	    build = em.find(CharacterBuild.class, 11);
	}

	@AfterEach
	void tearDown() throws Exception {
		build = null;
	    em.close();
	}

	@Test
	void test_entity_mappings() {
		assertNotNull(build);
		assertEquals("Lance Longinus", build.getName());
	}
	
	@Test
	void test_entity_joins () {
		assertNotNull(build);
		assertEquals("Human", build.getRace().getName());
		assertEquals("Assassin", build.getCharClass().getName());
	}

}
