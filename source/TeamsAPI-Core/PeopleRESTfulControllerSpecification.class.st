Class {
	#name : #PeopleRESTfulControllerSpecification,
	#superclass : #ResourceRESTfulControllerSpecification,
	#category : #'TeamsAPI-Core'
}

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> addTemplate [
	
	^'<1s>/%<<2s>:IsInteger>' expandMacrosWith: self endpoint with: self identifierKey
]

{ #category : #accessing }
PeopleRESTfulControllerSpecification >> detailTemplate [

	^ '<1s>/%<<2s>:IsInteger>' expandMacrosWith: self endpoint with: self identifierKey
]

{ #category : #'private - accessing' }
PeopleRESTfulControllerSpecification >> endpoint [
	
	^'/people'
]

{ #category : #'private - accessing' }
PeopleRESTfulControllerSpecification >> identifierKey [
	
	^#identifier
]

{ #category : #acccessing }
PeopleRESTfulControllerSpecification >> listTemplate [
	
	^self endpoint
]
