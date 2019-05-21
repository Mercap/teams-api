Class {
	#name : #PeopleRESTfulController,
	#superclass : #ResourceRESTfulController,
	#instVars : [
		'people'
	],
	#category : #'TeamsAPI-Core-Controllers'
}

{ #category : #'private - support' }
PeopleRESTfulController >> createPersonBasedOn: anHttpRequest within: aContext [

	^ self
		withCreatedResourceDo: [ :resource | 
			| newPerson |

			newPerson := Person
				named: resource name
				surnamed: resource lastName
				withEmailAddress: resource email.
			people add: newPerson ]
		decodedUsing: self specification personMappingKey
		basedOn: anHttpRequest
		within: aContext
]

{ #category : #accesing }
PeopleRESTfulController >> initialize [
	super initialize.
	people := OrderedCollection new
]

{ #category : #accesing }
PeopleRESTfulController >> people [
		^people
]

{ #category : #specification }
PeopleRESTfulController >> specification [
	^ PeopleRESTfulControllerSpecification new
]
