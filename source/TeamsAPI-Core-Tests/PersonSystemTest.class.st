"
A PersonSystemTest is a test class for testing the behavior of PersonSystem
"
Class {
	#name : #PersonSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'composite'
	],
	#category : #'TeamsAPI-Core-Tests'
}

{ #category : #initializing }
PersonSystemTest >> setUp [
	super setUp.
	composite := (TeamsAPISystemInstallation
		installing:
			{PersonModule.
			TeamModule}) install: '1.0'.
	composite startUp
]

{ #category : #tests }
PersonSystemTest >> testAddPerson [
	| person personSystem |
	person := Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	personSystem := composite systemImplementing: #PersonSystemInterface.
	personSystem addPerson: person.
	self
		assert: (personSystem personWithEmailAddress: person emailAddress)
		equals: person
]

{ #category : #tests }
PersonSystemTest >> testDeletePerson [
	| person personSystem |
	person := Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	personSystem := composite systemImplementing: #PersonSystemInterface.
	personSystem addPerson: person.
	self
		assert: (personSystem personWithEmailAddress: person emailAddress)
		equals: person.
	personSystem deletePerson: person.
	self
		should: [ personSystem personWithEmailAddress: person emailAddress ]
		raise: Exception
		description: 'No se encontro esta persona'
]

{ #category : #tests }
PersonSystemTest >> testFailToDeletePersonAlreadyDeleted [
	| person personSystem |
	person := Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	personSystem := composite systemImplementing: #PersonSystemInterface.
	personSystem addPerson: person.
	self
		assert: (personSystem personWithEmailAddress: person emailAddress)
		equals: person.
	personSystem deletePerson: person.
	self
		should: [ personSystem deletePerson: person ]
		raise: Exception
		description: 'Esta persona no existe'
]

{ #category : #tests }
PersonSystemTest >> testFailWhenAddingAPersonWithSameEmailAddress [
	| person personSystem personWithSameEmail |
	person := Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	personWithSameEmail := Person
		named: 'Lucia'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	personSystem := composite systemImplementing: #PersonSystemInterface.
	personSystem addPerson: person.
	self
		assert: (personSystem personWithEmailAddress: person emailAddress)
			equals: person;
		should: [ personSystem addPerson: personWithSameEmail ]
			raise: Exception
			description: 'El nombre de este equipo ya esta en uso'
]
