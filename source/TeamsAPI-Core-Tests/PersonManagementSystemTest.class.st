"
A PersonSystemTest is a test class for testing the behavior of PersonSystem
"
Class {
	#name : #PersonManagementSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'rootSystem'
	],
	#category : #'TeamsAPI-Core-Tests-Systems'
}

{ #category : #acccessing }
PersonManagementSystemTest >> lucasRojas [
	^ Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'
]

{ #category : #acccessing }
PersonManagementSystemTest >> personSystem [
	^ rootSystem systemImplementing: #PersonSystemInterface
]

{ #category : #initializing }
PersonManagementSystemTest >> setUp [
	super setUp.
	rootSystem := CompositeSystem new.
	rootSystem
		register: PeopleManagementSystem new;
		register: TeamManagementSystem new;
		startUp
]

{ #category : #tests }
PersonManagementSystemTest >> testAddPerson [
	| person personSystem |
	person := self lucasRojas.
	personSystem := self personSystem.
	personSystem startManagingPerson: person.
	self
		assertCollection: personSystem people
		hasSameElements: (Array with: person)
]

{ #category : #tests }
PersonManagementSystemTest >> testDeletePerson [
	| person personSystem |
	person := self lucasRojas.
	personSystem := self personSystem.
	personSystem startManagingPerson: person.
	self
		assertCollection: personSystem people
		hasSameElements: (Array with: person).
	personSystem stopManagingPerson: person.
	self assert: personSystem people isEmpty
]

{ #category : #tests }
PersonManagementSystemTest >> testFailToDeletePersonAlreadyDeleted [
	| person personSystem |
	person := self lucasRojas.
	personSystem := self personSystem.
	personSystem startManagingPerson: person.
	self
		assertCollection: personSystem people
		hasSameElements: (Array with: person).
	personSystem stopManagingPerson: person.
	self
		assert: personSystem people isEmpty;
		should: [ personSystem stopManagingPerson: person ]
			raise: AssertionFailed
			withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals:
					'TStop managing person failed because it does not exist in the system.' ]
]

{ #category : #tests }
PersonManagementSystemTest >> testFailWhenAddingAPersonWithSameEmailAddress [
	| person personSystem personWithSameEmail |
	person := self lucasRojas.
	personWithSameEmail := Person
		named: 'Lucia'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	personSystem := self personSystem.
	personSystem startManagingPerson: person.
	self
		should: [ personSystem startManagingPerson: personWithSameEmail ]
			raise: Exception
			withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals:
					'There''s already a person registered in our system with the email address: l.rojas@gmail.com.' ];
		assertCollection: personSystem people
			hasSameElements: (Array with: person)
]

{ #category : #tests }
PersonManagementSystemTest >> testGetPeopleOnEmptySystem [
	self assert: self personSystem people isEmpty
]
