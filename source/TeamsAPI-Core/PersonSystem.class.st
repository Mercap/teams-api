Class {
	#name : #PersonSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'people'
	],
	#category : #'TeamsAPI-Core-Systems'
}

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
	people := OrderedCollection new
]

{ #category : #accessing }
PersonSystem >> people [
	^ people
]

{ #category : #accessing }
PersonSystem >> startManagingPerson: aPerson [
	AssertionChecker
		enforce: [ people
				noneSatisfy: [ :person | person emailAddress = aPerson emailAddress ] ]
		because:
			('There''s already a person registered in our system with the email address: <1s>.'
				expandMacrosWith: aPerson emailAddress).
	people add: aPerson
]

{ #category : #accessing }
PersonSystem >> stopManagingPerson: aPerson [
	AssertionChecker
		enforce: [ people anySatisfy: [ :person | person = aPerson ] ]
		because:
			'TStop managing person failed because it does not exist in the system.'.
	people remove: aPerson
]
