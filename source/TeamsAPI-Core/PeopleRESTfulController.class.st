Class {
	#name : #PeopleRESTfulController,
	#superclass : #ResourceRESTfulController,
	#instVars : [
		'peopleManagementSystem'
	],
	#category : #'TeamsAPI-Core-Controllers'
}

{ #category : #'instance creation' }
PeopleRESTfulController class >> for: aPeopleManagementSystem [

	^ self new initializeFor: aPeopleManagementSystem
]

{ #category : #'private - support' }
PeopleRESTfulController >> createPersonBasedOn: anHttpRequest within: aContext [

	^ self
		withCreatedResourceDo: [ :newPerson | 
			peopleManagementSystem startManagingPerson: newPerson.
			newPerson ]
		decodedUsing: self specification personMappingKey
		basedOn: anHttpRequest
		within: aContext
]

{ #category : #'private - accessing' }
PeopleRESTfulController >> entityTagOf: aResource encodedAs: mediaType [

	^ ZnETag with: (MD5 hashMessage: aResource printString) hex
]

{ #category : #'private - support' }
PeopleRESTfulController >> getPeopleBasedOn: aTeaRequest within: aContext [

	^ self
		get: [ peopleManagementSystem people ]
		asCollectionEncodedUsing: self specification peopleMappingKey
		basedOn: aTeaRequest
		within: aContext
]

{ #category : #'private - support' }
PeopleRESTfulController >> getPersonBasedOn: anHttpRequest within: aContext [

	^ self
		get: [ | uuid |

			uuid := UUID fromString: (anHttpRequest at: #identifier).
			peopleManagementSystem
				personIdentifiedBy: uuid
				ifFound: #yourself
				ifNone: [ ObjectNotFound signal ] ]
		encodedUsing: self specification personMappingKey
		basedOn: anHttpRequest
		within: aContext
]

{ #category : #'private - support' }
PeopleRESTfulController >> initializeFor: aPeopleManagementSystem [

	peopleManagementSystem := aPeopleManagementSystem
]

{ #category : #'private - accessing' }
PeopleRESTfulController >> locationOf: aResource [

	| baseUrl |

	baseUrl := (baseUrlOptional withContentDo: #yourself ifUnused: [ '' ])
		asZnUrl.

	^ baseUrl / self specification endpoint
		/ aResource uuid printString asZnUrl
]

{ #category : #'private - accessing' }
PeopleRESTfulController >> provideHypermediaPolicy [

	^ HypermediaDrivenRESTfulControllerPolicy for: self
]

{ #category : #'private - accessing' }
PeopleRESTfulController >> providePaginationPolicy [

	^ RESTfulControllerDoNotPaginateCollectionsPolicy for: self
]

{ #category : #specification }
PeopleRESTfulController >> specification [
	^ PeopleRESTfulControllerSpecification new
]
