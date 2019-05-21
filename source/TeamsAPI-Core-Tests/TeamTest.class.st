Class {
	#name : #TeamTest,
	#superclass : #TestCase,
	#instVars : [
		'defaultPerson'
	],
	#category : #'TeamsAPI-Core-Tests-Model'
}

{ #category : #initialization }
TeamTest >> setUp [
	super setUp.
	
	defaultPerson := Person
		named: 'Agustin'
		surnamed: 'Tarda'
		withEmailAddress: 'a.e.tarda@gmail.com'
]

{ #category : #tests }
TeamTest >> testInstanceCreation [
	| teamMembers teamName team |
	teamMembers := OrderedCollection with: defaultPerson.
	teamName := 'Linces'.
	team := Team named: teamName composedBy: teamMembers.
	self
		assert: team name equals: teamName;
		assert: team members equals: teamMembers
]
