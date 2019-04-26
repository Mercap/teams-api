Class {
	#name : #Person,
	#superclass : #Object,
	#instVars : [
		'identifier',
		'name'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #'instance creation' }
Person class >> identifiedBy: anIdentifier named: aName [
	^ self new initializeIdentifiedBy: anIdentifier named: aName
]

{ #category : #accessing }
Person >> identifier [
	^ identifier
]

{ #category : #initialization }
Person >> initializeIdentifiedBy: anIdentifier named: aName [
	identifier := anIdentifier.
	name := aName
]

{ #category : #acccessing }
Person >> name [
	^ name
]
