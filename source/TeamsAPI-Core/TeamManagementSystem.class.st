Class {
	#name : #TeamManagementSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'teams'
	],
	#category : #'TeamsAPI-Core-Systems'
}

{ #category : #installing }
TeamManagementSystem >> dependencies [
	^ #()
]

{ #category : #initialization }
TeamManagementSystem >> implementedInterfaces [
	^ #(#TeamSystemInterface)
]

{ #category : #initialization }
TeamManagementSystem >> initialize [
	super initialize.
	teams := OrderedCollection new
]

{ #category : #accessing }
TeamManagementSystem >> name [

	^ 'Teams Management System'
]

{ #category : #adding }
TeamManagementSystem >> startManagingTeam: aTeam [
	AssertionChecker
		enforce: [ teams noneSatisfy: [ :team | team name = aTeam name ] ]
		because:
			('There''s already a team registered in our system with the name: <1s>.'
				expandMacrosWith: aTeam name).
	teams add: aTeam
]

{ #category : #adding }
TeamManagementSystem >> stopManagingTeam: aTeam [
	AssertionChecker
		enforce: [ teams anySatisfy: [ :team | aTeam = team ] ]
		because: 'TStop managing team failed because it does not exist in the system.'.
	teams remove: aTeam
]

{ #category : #accessing }
TeamManagementSystem >> teams [
	^ teams
]
