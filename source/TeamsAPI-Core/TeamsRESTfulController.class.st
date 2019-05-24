Class {
	#name : #TeamsRESTfulController,
	#superclass : #ResourceRESTfulController,
	#category : #'TeamsAPI-Core-Controllers'
}

{ #category : #initialization }
TeamsRESTfulController >> initialize [
	super initialize.
	
]

{ #category : #specification }
TeamsRESTfulController >> specification [

	^ TeamsRESTfulControllerSpecification new
]
