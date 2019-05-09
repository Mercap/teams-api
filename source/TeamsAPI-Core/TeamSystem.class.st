Class {
	#name : #TeamSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'teams'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #adding }
TeamSystem >> addTeam: aTeam [
	self assertTeamNameIsNotInUse: aTeam name.
	teams add: aTeam
]

{ #category : #adding }
TeamSystem >> assertTeamNameIsNotInUse: aName [
	teams
		detect: [ :team | team name = aName ]
		ifFound: [ Exception signal: 'El nombre de este equipo ya esta en uso' ]
]

{ #category : #adding }
TeamSystem >> deleteTeam: aTeam [
	teams
		detect: [ :team | aTeam = team ]
		ifNone: [ Exception signal: 'Este equipo no existe' ].
	teams remove: aTeam
]

{ #category : #installing }
TeamSystem >> dependencies [
	^ #(PersonSystemInterface TeamSystemInterface)
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

{ #category : #accessing }
TeamSystem >> name [

	^ 'Team Management'
]

{ #category : #adding }
TeamSystem >> teamNamed: aName [
	^ teams
		detect: [ :team | team name = aName ]
		ifNone: [ Exception signal: 'No se encontro este equipo' ]
]
