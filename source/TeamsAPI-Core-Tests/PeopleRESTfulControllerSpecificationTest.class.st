Class {
	#name : #PeopleRESTfulControllerSpecificationTest,
	#superclass : #TestCase,
	#category : #'TeamsAPI-Core-Tests'
}

{ #category : #'*TeamsAPI-Core-Tests' }
PeopleRESTfulControllerSpecificationTest >> testTemplate [

	| spec |

	spec := PeopleRESTfulControllerSpecification new.

	self
		assert: spec addTemplate equals: '/people/<identifier:IsInteger>';
		assert: spec listTemplate equals: '/people';
		assert: spec detailTemplate equals: '/people/<identifier:IsInteger>'
]