"
A TeamSystemTest is a test class for testing the behavior of TeamSystem
"
Class {
	#name : #TeamManagementSystemTest,
	#superclass : #TestCase,
	#instVars : [
		'person',
		'anotherPerson',
		'rootSystem'
	],
	#category : #'TeamsAPI-Core-Tests-Systems'
}

{ #category : #running }
TeamManagementSystemTest >> setUp [
	super setUp.
	person := Person
		named: 'Lucas'
		surnamed: 'Rojas'
		withEmailAddress: 'l.rojas@gmail.com'.
	anotherPerson := Person
		named: 'Rocio'
		surnamed: 'Pasco'
		withEmailAddress: 'r.pasco@gmail.com'.
	rootSystem := CompositeSystem new.
	rootSystem
		register: PeopleManagementSystem new;
		register: TeamManagementSystem new;
		startUp
]

{ #category : #tests }
TeamManagementSystemTest >> teamSystem [
	^ rootSystem systemImplementing: #TeamSystemInterface
]

{ #category : #tests }
TeamManagementSystemTest >> testAddTeam [
	| team teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamSystem := self teamSystem.
	teamSystem startManagingTeam: team.
	self
		assertCollection: teamSystem teams
		hasSameElements: (Array with: team)
]

{ #category : #tests }
TeamManagementSystemTest >> testDeleteATeamAlreadyDeleted [
	| team teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamSystem := self teamSystem.
	teamSystem startManagingTeam: team.
	self
		assertCollection: teamSystem teams
		hasSameElements: (Array with: team).
	teamSystem stopManagingTeam: team.
	self
		assert: teamSystem teams isEmpty;
		should: [ teamSystem stopManagingTeam: team ]
			raise: AssertionFailed
			withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'TStop managing team failed because it does not exist in the system.' ]
]

{ #category : #tests }
TeamManagementSystemTest >> testDeleteTeam [
	| team teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamSystem := self teamSystem.
	teamSystem startManagingTeam: team.
	self
		assertCollection: teamSystem teams
		hasSameElements: (Array with: team).
	teamSystem stopManagingTeam: team.
	self assert: teamSystem teams isEmpty
]

{ #category : #tests }
TeamManagementSystemTest >> testFailToAddTeamWithNamedAlreadyUsed [
	| team teamWithSameName teamSystem |
	team := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: person with: anotherPerson).
	teamWithSameName := Team
		named: 'Linces'
		composedBy: (OrderedCollection with: anotherPerson).
	teamSystem := self teamSystem.
	teamSystem startManagingTeam: team.
	self
		should: [ teamSystem startManagingTeam: teamWithSameName ]
			raise: Exception
			withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals:
					'There''s already a team registered in our system with the name: Linces.' ];
		assertCollection: teamSystem teams
			hasSameElements: (Array with: team)
]

{ #category : #tests }
TeamManagementSystemTest >> testGetTeamsOnEmptySystem [
	self assert: self teamSystem teams isEmpty
]
