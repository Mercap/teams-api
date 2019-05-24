Class {
	#name : #PeopleRESTfulControllerSpecification,
	#superclass : #ResourceRESTfulControllerSpecification,
	#category : #'TeamsAPI-Core-Controllers'
}

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> addJsonPeopleVersion1dot0dot0MappingIn: aBuilder [

	self
		addJsonPeopleVersion1dot0dot0MappingIn: aBuilder
		withHypermediaFrom: [ :resource :context :mapping | 
			mapping
				mapAsHypermediaControls: [ :period | context hypermediaControlsFor: period ] ]
		encoding: self peopleMappingKey
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> addJsonPeopleVersion1dot0dot0MappingIn: aBuilder withHypermediaFrom: hypermediaControlsMapping encoding: aMappingKey [

	aBuilder
		addDefaultRuleToEncode: aMappingKey
		to: self personVersion1dot0dot0MediaType
		using: [ :resource :context | 
			String
				streamContents: [ :stream | 
					(NeoJSONWriter on: stream)
						for: Person
							do: [ :mapping | 
							mapping mapAccessors: #(#name #lastName #email).
							hypermediaControlsMapping
								value: resource
								value: context
								value: mapping ];
						nextPut: resource ] ]
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> addJsonPersonVersion1dot0dot0DecoderMappingIn: aBuilder [

	aBuilder
		addDefaultRuleToDecode: self personVersion1dot0dot0MediaType
		to: self personMappingKey
		using: [ :json :context | 
			| raw |

			raw := NeoJSONObject fromString: json.
			Person
				named: raw name
				surnamed: raw lastName
				withEmailAddress: raw email ]
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> addJsonPersonVersion1dot0dot0MappingIn: aBuilder [

	self
		addJsonPeopleVersion1dot0dot0MappingIn: aBuilder
		withHypermediaFrom:
			[ :resource :context :mapping | mapping mapHypermediaControlsIn: context ]
		encoding: self personMappingKey
]

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
PeopleRESTfulControllerSpecification >> peopleMappingKey [

	^ 'people'
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> personMappingKey [

	^ 'person'
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> personVersion1dot0dot0MediaType [

	^ 'application/vnd.stargate.person+json;version=1.0.0' asMediaType
]
