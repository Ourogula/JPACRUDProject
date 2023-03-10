package com.skilldistillery.rpginfo.entities;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="character_build")
public class CharacterBuild {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	
	private String name;
	private String description;
	private Integer strength;
	private Integer dexterity;
	private Integer constitution;
	private Integer intelligence;
	private Integer wisdom;
	private Integer charisma;
	@OneToOne
	@JoinColumn(name="class_id")
	private CharacterClass CharClass;
	@OneToOne
	@JoinColumn(name="race_id")
	private Race race;
	
	
	public CharacterBuild () {}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Integer getStrength() {
		return strength;
	}


	public void setStrength(Integer strength) {
		this.strength = strength;
	}


	public Integer getDexterity() {
		return dexterity;
	}


	public void setDexterity(Integer dexterity) {
		this.dexterity = dexterity;
	}


	public Integer getConstitution() {
		return constitution;
	}


	public void setConstitution(Integer constitution) {
		this.constitution = constitution;
	}


	public Integer getIntelligence() {
		return intelligence;
	}


	public void setIntelligence(Integer intelligence) {
		this.intelligence = intelligence;
	}


	public Integer getWisdom() {
		return wisdom;
	}


	public void setWisdom(Integer wisdom) {
		this.wisdom = wisdom;
	}


	public Integer getCharisma() {
		return charisma;
	}


	public void setCharisma(Integer charisma) {
		this.charisma = charisma;
	}


	public CharacterClass getCharClass() {
		return CharClass;
	}


	public void setCharClass(CharacterClass charClass) {
		CharClass = charClass;
	}


	public Race getRace() {
		return race;
	}


	public void setRace(Race race) {
		this.race = race;
	}


	@Override
	public int hashCode() {
		return Objects.hash(id);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CharacterBuild other = (CharacterBuild) obj;
		return id == other.id;
	}


	@Override
	public String toString() {
		return "CharacterBuild [id=" + id + ", name=" + name + ", description=" + description + ", strength=" + strength
				+ ", dexterity=" + dexterity + ", constitution=" + constitution + ", intelligence=" + intelligence
				+ ", wisdom=" + wisdom + ", charisma=" + charisma + ", CharClass=" + CharClass + ", race=" + race + "]";
	}

	
}
