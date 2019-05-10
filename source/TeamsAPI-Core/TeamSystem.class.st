Class {
	#name : #TeamSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'teams'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #installing }
TeamSystem >> dependencies [
	^ #()
]

{ #category : #initialization }
TeamSystem >> implementedInterfaces [
	^ #(#TeamSystemInterface)
]

{ #category : #initialization }
TeamSystem >> initialize [
	super initialize.
	teams := OrderedCollection new
]

{ #category : #adding }
TeamSystem >> startManagingTeam: aTeam [
	AssertionChecker
		enforce: [ teams noneSatisfy: [ :team | team name = aTeam name ] ]
		because:
			('There''s already a team registered in our system with the name: <1s>.'
				expandMacrosWith: aTeam name).
	teams add: aTeam
]

{ #category : #adding }
TeamSystem >> stopManagingTeam: aTeam [
	AssertionChecker
		enforce: [ teams anySatisfy: [ :team | aTeam = team ] ]
		because: 'TStop managing team failed because it does not exist in the system.'.
	teams remove: aTeam
]

{ #category : #accessing }
TeamSystem >> teams [
	^ teams
]
