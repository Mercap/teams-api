Class {
	#name : #PeopleRESTfulControllerTest,
	#superclass : #ResourceRESTfulControllerTest,
	#category : #'TeamsAPI-Core-Tests'
}

{ #category : #test }
PeopleRESTfulControllerTest >> baseUrl [

	^'https://teamsAPI.com' asZnUrl 
	
	
]

{ #category : #'block support' }
PeopleRESTfulControllerTest >> defaultPersonMediaType [
	^ resourceController specification personVersion1dot0dot0MediaType
]

{ #category : #'block support' }
PeopleRESTfulControllerTest >> requestToCreatePersonFrom: json [ 
	^ self requestToPOST: json as: self defaultPersonMediaType
]

{ #category : #test }
PeopleRESTfulControllerTest >> setUp [ 

	super setUp.
	self setUpResourceController.
	resourceController serverUrl: self baseUrl asZnUrl.
	self assert: resourceController people isEmpty
	
	
]

{ #category : #test }
PeopleRESTfulControllerTest >> setUpResourceController [
	resourceController := PeopleRESTfulController new
]

{ #category : #tests }
PeopleRESTfulControllerTest >> testPersonCreation [
	| response |
	response := resourceController
		createPersonBasedOn:
			(self
				requestToCreatePersonFrom:
					'{"name":"Roberto", "lastName":"Rodriguez","email":"r.rodriguez@gmail.com"}')
		within: self newHttpRequestContext.
	self
		assert: response isSuccess;
		assert: response status equals: 201;
		assertUrl: response location
			equals: 'http://people.example.com/people/1';
		assert: response hasEntity;
		assert: resourceController people size equals: 1;
		assert: resourceController people first name equals: 'Roberto'
]
