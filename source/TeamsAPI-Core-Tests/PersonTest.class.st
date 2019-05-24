Class {
	#name : #PersonTest,
	#superclass : #TestCase,
	#category : #'TeamsAPI-Core-Tests-Model'
}

{ #category : #tests }
PersonTest >> testInstanceCreation [
	| person personName personEmail personLastName |
	personName := 'La Raulito'.
	personLastName := 'Perez'.
	personEmail := 'laraulitoperez@gmail.com'.
	person := Person
		named: personName
		surnamed: personLastName
		withEmailAddress: personEmail.
	self
		assert: person name equals: personName;
		assert: person lastName equals: personLastName;
		assert: person emailAddress equals: personEmail
]
