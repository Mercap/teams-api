Class {
	#name : #PeopleRESTfulControllerTest,
	#superclass : #ResourceRESTfulControllerTest,
	#instVars : [
		'peopleManagementSystem'
	],
	#category : #'TeamsAPI-Core-Tests-Controllers'
}

{ #category : #test }
PeopleRESTfulControllerTest >> baseUrl [

	^ 'http://people.mercap.net' asZnUrl
]

{ #category : #'block support' }
PeopleRESTfulControllerTest >> defaultPersonMediaType [
	^ resourceController specification personVersion1dot0dot0MediaType
]

{ #category : #'block support' }
PeopleRESTfulControllerTest >> registerPerson: aPerson [

	peopleManagementSystem startManagingPerson: aPerson
]

{ #category : #'block support' }
PeopleRESTfulControllerTest >> requestToCreatePersonFrom: json [

	^ self requestToPOST: json as: self defaultPersonMediaType
]

{ #category : #'block support' }
PeopleRESTfulControllerTest >> requestToGet: aUrl accepting: anAcceptHeader [

	^ TeaRequest
		fromZnRequest:
			((ZnRequest get: aUrl)
				setAccept: anAcceptHeader;
				yourself)
]

{ #category : #'block support' }
PeopleRESTfulControllerTest >> requestToGetPeopleAccepting: anAcceptHeader [

	^ self requestToGet: self resourceUrl accepting: anAcceptHeader
]

{ #category : #test }
PeopleRESTfulControllerTest >> setUp [

	peopleManagementSystem := PeopleManagementSystem new.
	super setUp
]

{ #category : #test }
PeopleRESTfulControllerTest >> setUpResourceController [

	resourceController := PeopleRESTfulController
		for: peopleManagementSystem
]

{ #category : #tests }
PeopleRESTfulControllerTest >> testGetWhenNoPeopleRegistered [

	| response |

	response := resourceController
		getPeopleBasedOn: (self requestToGetPeopleAccepting: '*/*')
		within: self newHttpRequestContext.

	self
		assert: response isSuccess;
		assert: response status equals: 200;
		assert: response contentType asMediaType
			equals: resourceController specification personVersion1dot0dot0MediaType.

	self
		withJsonFromContentsIn: response
		do: [ :people | self assert: people isEmpty ]
]

{ #category : #tests }
PeopleRESTfulControllerTest >> testPersonCreation [

	| response |

	response := resourceController
		createPersonBasedOn:
			(self
				requestToCreatePersonFrom:
					'{"name":"Roberto","lastName":"Rodriguez","email":"r.rodriguez@gmail.com"}')
		within: self newHttpRequestContext.
	self
		assert: response isSuccess;
		assert: response status equals: 201;
		assertUrl: response location
			equals: 'http://people.mercap.net/people/1';
		assert: response hasEntity;
		assert: peopleManagementSystem people size equals: 1;
		assert: peopleManagementSystem people first name equals: 'Roberto'
]

{ #category : #test }
PeopleRESTfulControllerTest >> urlOf: aPerson [

	^ (self resourceUrl / aPerson uuid asString) asString
]
