Class {
	#name : #TeamsRESTfulController,
	#superclass : #ResourceRESTfulController,
	#category : #'TeamsAPI-Core'
}

{ #category : #initialization }
TeamsRESTfulController >> initialize [
	super initialize.
	
]

{ #category : #specification }
TeamsRESTfulController >> specification [

	^ TeamsRESTfulControllerSpecification new
]
