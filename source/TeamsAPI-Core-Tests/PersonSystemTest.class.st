"
A PersonSystemTest is a test class for testing the behavior of PersonSystem
"
Class {
	#name : #PersonSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'rootSystem'
	],
	#category : #'TeamsAPI-Core-Tests'
}

{ #category : #acccessing }
PersonSystemTest >> lucasRojas [
	^ Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'
]

{ #category : #acccessing }
PersonSystemTest >> personSystem [
	^ rootSystem systemImplementing: #PersonSystemInterface
]

{ #category : #initializing }
PersonSystemTest >> setUp [
	super setUp.
	rootSystem := CompositeSystem new.
	rootSystem
		register: PersonSystem new;
		register: TeamSystem new;
		startUp
]

{ #category : #tests }
PersonSystemTest >> testAddPerson [
	| person personSystem |
	person := self lucasRojas.
	personSystem := self personSystem.
	personSystem startManagingPerson: person.
	self
		assertCollection: personSystem people
		hasSameElements: (Array with: person)
]

{ #category : #tests }
PersonSystemTest >> testDeletePerson [
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
PersonSystemTest >> testFailToDeletePersonAlreadyDeleted [
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
PersonSystemTest >> testFailWhenAddingAPersonWithSameEmailAddress [
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
PersonSystemTest >> testGetPeopleOnEmptySystem [
	self assert: self personSystem people isEmpty
]
