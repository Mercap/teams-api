Class {
	#name : #PeopleManagementSystem,
	#superclass : #SubsystemImplementation,
	#instVars : [
		'people',
		'uuidProvider'
	],
	#category : #'TeamsAPI-Core-Systems'
}

{ #category : #installing }
PeopleManagementSystem >> dependencies [
	^ #()
]

{ #category : #installing }
PeopleManagementSystem >> getNewUUID [

	| newId |

	newId := uuidProvider.
	uuidProvider := newId + 1.
	^ newId
]

{ #category : #installing }
PeopleManagementSystem >> implementedInterfaces [
	^ #(#PersonSystemInterface)
]

{ #category : #installing }
PeopleManagementSystem >> initialize [

	super initialize.
	uuidProvider := 1.
	people := OrderedCollection new
]

{ #category : #accessing }
PeopleManagementSystem >> name [

	^ 'People Management System'
]

{ #category : #accessing }
PeopleManagementSystem >> people [
	^ people
]

{ #category : #accessing }
PeopleManagementSystem >> personIdentifiedBy: anUUID ifFound: aFoundBlock ifNone: aNoneFoundBlock [

	^ people
		detect: [ :person | person uuid = anUUID ]
		ifFound: aFoundBlock
		ifNone: aNoneFoundBlock
]

{ #category : #accessing }
PeopleManagementSystem >> startManagingPerson: aPerson [

	AssertionChecker
		enforce: [ people
				noneSatisfy: [ :person | person emailAddress = aPerson emailAddress ] ]
		because:
			('There''s already a person registered in our system with the email address: <1s>.'
				expandMacrosWith: aPerson emailAddress).
	aPerson uuid: self getNewUUID.
	people add: aPerson
]

{ #category : #accessing }
PeopleManagementSystem >> stopManagingPerson: aPerson [
	AssertionChecker
		enforce: [ people anySatisfy: [ :person | person = aPerson ] ]
		because:
			'TStop managing person failed because it does not exist in the system.'.
	people remove: aPerson
]
