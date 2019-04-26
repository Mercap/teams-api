Class {
	#name : #PersonTest,
	#superclass : #TestCase,
	#category : #'TeamsAPI-Core-Tests'
}

{ #category : #tests }
PersonTest >> testCreation [

	|person personName|
	
	personName:='La Raulito'.
	person := Person identifiedBy: 10 named: personName.
	
	self assert: person identifier equals: 10;
	assert: person name equals: personName
	
]
