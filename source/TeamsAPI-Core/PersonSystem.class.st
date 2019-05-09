Class {
	#name : #PersonSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'persons'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #accessing }
PersonSystem >> addPerson: aPerson [
	self assertPersonEmailIsNotInUse: aPerson emailAddress.
	persons add: aPerson
]

{ #category : #accessing }
PersonSystem >> assertPersonEmailIsNotInUse: anEmail [
	persons
		detect: [ :person | person emailAddress = anEmail ]
		ifFound: [ Exception signal: 'El email de esta persona ya esta en uso' ]
]

{ #category : #accessing }
PersonSystem >> deletePerson: aPerson [
	persons
		detect: [:person|person =aPerson]
		ifNone: [ Exception signal: 'Esta persona no existe' ].
	persons remove: aPerson
]

{ #category : #installing }
PersonSystem >> dependencies [
	^ #()
]

{ #category : #installing }
PersonSystem >> implementedInterfaces [
	^ #(#PersonSystemInterface)
]

{ #category : #installing }
PersonSystem >> initialize [
	super initialize.
	persons := OrderedCollection new
]

{ #category : #accessing }
PersonSystem >> name [

	^ 'Persons Management'
]

{ #category : #accessing }
PersonSystem >> personWithEmailAddress: anEmail [
	^ persons
		detect: [ :person | person emailAddress = anEmail ]
		ifNone: [ Exception signal: 'No se encontro esta persona' ]
]
