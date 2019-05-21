Class {
	#name : #PeopleRESTfulControllerSpecification,
	#superclass : #ResourceRESTfulControllerSpecification,
	#category : #'TeamsAPI-Core-Controllers'
}

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> addTemplate [

	^ '<1s>/%<<2s>:IsInteger>'
		expandMacrosWith: self endpoint
		with: self identifierKey
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> detailTemplate [

	^ '<1s>/%<<2s>:IsInteger>'
		expandMacrosWith: self endpoint
		with: self identifierKey
]

{ #category : #'private - accessing' }
PeopleRESTfulControllerSpecification >> endpoint [

	^ '/people'
]

{ #category : #'private - accessing' }
PeopleRESTfulControllerSpecification >> identifierKey [

	^ #identifier
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> listTemplate [

	^ self endpoint
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> personMappingKey [

	^ #person
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> personVersion1dot0dot0MediaType [

	^ 'application/vnd.stargate.person+json;version=1.0.0' asMediaType
]
