Class {
	#name : #PeopleRESTfulControllerTest,
	#superclass : #ResourceRESTfulControllerTest,
	#category : #'TeamsAPI-Core-Tests-Controllers'
}

{ #category : #test }
PeopleRESTfulControllerTest >> baseUrl [

	^ 'https://localhost' asZnUrl
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
					(NeoJSONObject new
						at: #name put: 'Roberto';
						at: #lastName put: 'Rodriguez';
						at: #email put: 'r.rodriguez@gmail.com';
						yourself))
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
