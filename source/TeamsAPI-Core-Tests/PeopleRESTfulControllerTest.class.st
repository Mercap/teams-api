Class {
	#name : #PeopleRESTfulControllerTest,
	#superclass : #TestCase,
	#instVars : [
		'resourceController'
	],
	#category : #'TeamsAPI-Core-Tests'
}

{ #category : #test }
PeopleRESTfulControllerTest >> baseUrl [

	^'https://teamsAPI.com'
	
	
]

{ #category : #test }
PeopleRESTfulControllerTest >> setUp [ 

	super setUp.
	self setUpResourceController.
	resourceController serverUrl: self baseUrl asZnUrl.
	self assert: resourceController orders isEmpty
	
	
]

{ #category : #test }
PeopleRESTfulControllerTest >> setUpResourceController [
	resourceController := TeamsRESTfulController new
]
