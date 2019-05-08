Class {
	#name : #Person,
	#superclass : #Object,
	#instVars : [
		'name',
		'lastName',
		'emailAddress'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #'instance creation' }
Person class >> named: aName surnamed: aLastName withEmailAddress: anEmailAddress [
	^ self new
		initializeNamed: aName
		surnamed: aLastName
		withEmailAddress: anEmailAddress
]

{ #category : #accessing }
Person >> emailAddress [
	^ emailAddress
]

{ #category : #initialization }
Person >> initializeNamed: aName surnamed: aLastName withEmailAddress: anEmailAddress [
	name := aName.
	lastName := aLastName.
	emailAddress := anEmailAddress
]

{ #category : #accessing }
Person >> lastName [
	^ lastName
]

{ #category : #accessing }
Person >> name [
	^ name
]
