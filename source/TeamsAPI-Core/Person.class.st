Class {
	#name : #Person,
	#superclass : #Object,
	#instVars : [
		'name',
		'lastName',
		'emailAddress'
	],
	#category : #'TeamsAPI-Core-Model'
}

{ #category : #'private-assertions' }
Person class >> assertNotEmpty: aString forField: aFieldName [
	AssertionChecker
		enforce: [ aString notEmpty ]
		because: ('A person''s <1s> can''t be empty.' expandMacrosWith: aFieldName)
]

{ #category : #'instance creation' }
Person class >> named: aName surnamed: aSurName withEmailAddress: anEmailAddress [
	self
		assertNotEmpty: aName forField: 'name';
		assertNotEmpty: aSurName forField: 'surname';
		assertNotEmpty: anEmailAddress forField: 'email adress'.
	^ self new
		initializeNamed: aName
		surnamed: aSurName
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
