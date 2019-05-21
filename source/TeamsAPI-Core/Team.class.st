Class {
	#name : #Team,
	#superclass : #Object,
	#instVars : [
		'name',
		'members'
	],
	#category : #'TeamsAPI-Core-Model'
}

{ #category : #'instance creatio' }
Team class >> assertNotEmpty: aStringOrCollection forField: aFieldName [
	AssertionChecker
		enforce: [ aStringOrCollection notEmpty ]
		because: ('A team''s <1s> can''t be empty.' expandMacrosWith: aFieldName)
]

{ #category : #'instance creatio' }
Team class >> named: aName composedBy: aPersonsCollection [
	self assertNotEmpty: aName forField: 'name'.
	^ self new initializeNamed: aName composedBy: aPersonsCollection
]

{ #category : #initialization }
Team >> initializeNamed: aName composedBy: aPersonsCollection [
	name := aName.
	members := aPersonsCollection
]

{ #category : #accessing }
Team >> members [
	^ members
]

{ #category : #accessing }
Team >> name [
	^ name
]
