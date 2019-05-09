"
A TeamSystemTest is a test class for testing the behavior of TeamSystem
"
Class {
	#name : #TeamSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'person',
		'anotherPerson',
		'composite'
	],
	#category : #'TeamsAPI-Core-Tests'
}

{ #category : #running }
TeamSystemTest >> setUp [
	super setUp.
	person := Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	anotherPerson := Person
		named: 'Rocio'
		surnamed: 'Pasco'
		withEmailAddress: 'r.pasco@gmail.com'.
	composite := (TeamsAPISystemInstallation
		installing:
			{PersonModule.
			TeamModule}) install: '1.0'.
	composite startUp
]

{ #category : #tests }
TeamSystemTest >> testAddTeam [
	| team teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamSystem := composite systemImplementing: #TeamSystemInterface.
	teamSystem addTeam: team .
	self assert: (teamSystem teamNamed: 'Linces') equals: team
]

{ #category : #tests }
TeamSystemTest >> testDeleteATeamAlreadyDeleted [
	| team teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamSystem := composite systemImplementing: #TeamSystemInterface.
	teamSystem addTeam: team.
	self assert: (teamSystem teamNamed: 'Linces') equals: team.
	teamSystem deleteTeam: team.
	self
		should: [ teamSystem deleteTeam: team]
		raise: Exception
		description: 'Este equipo no existe' 
]

{ #category : #tests }
TeamSystemTest >> testDeleteTeam [
	| team teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamSystem := composite systemImplementing: #TeamSystemInterface.
	teamSystem addTeam: team.
	self assert: (teamSystem teamNamed: 'Linces') equals: team.
	teamSystem deleteTeam: team.
	self
		should: [ teamSystem teamNamed: 'Linces' ]
		raise: Exception
		description: 'No se encontro este equipo' 
]

{ #category : #tests }
TeamSystemTest >> testFailToAddTeamWithNamedAlreadyUsed [
	| team teamWithSameName teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamWithSameName := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: anotherPerson).
	teamSystem := composite systemImplementing: #TeamSystemInterface.
	teamSystem addTeam: team.
	self
		assert: (teamSystem teamNamed: 'Linces') equals: team;
		should: [ teamSystem addTeam: teamWithSameName ]
			raise: Exception
			description: 'El nombre de este equipo ya esta en uso'
]
