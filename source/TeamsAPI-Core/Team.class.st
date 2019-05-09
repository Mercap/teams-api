Class {
	#name : #Team,
	#superclass : #Object,
	#instVars : [
		'name',
		'members'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #'instance creatio' }
Team class >> named: aName composedBy: aPersonsCollection [
	^ self new initializeNamed: aName composedBy: aPersonsCollection
]

{ #category : #initialization }
Team >> initializeNamed: aName composedBy: aPersonsCollection [
	name := aName.
	members := aPersonsCollection
]

{ #category : #accessing }
Team >> members [
	^members
]

{ #category : #accessing }
Team >> name [
	^ name
]
