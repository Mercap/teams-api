Class {
	#name : #PersonModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #'instance creation' }
PersonModule class >> toInstallOn: aCompositeSystem [ 

	^ self new initializeToInstallOn: aCompositeSystem 
]

{ #category : #initialization }
PersonModule >> initializeToInstallOn: aCompositeSystem [
	rootSystem := aCompositeSystem.
	self registerSystemInterface
]

{ #category : #initialization }
PersonModule >> name [
	^ 'Person'
]

{ #category : #'registering ' }
PersonModule >> registerPersonManagementSystemForInstallationIn: systems [
	^ self register: [ PersonSystem new ] in: systems
]

{ #category : #initialization }
PersonModule >> registerSystemInterface [
	[ Kepler
		registerInterfaceAt: #PersonSystemInterface
		named: 'Person System Interface'
		declaring: #(#startManagingPerson: #stopManagingPerson: #people) ]
		on: ConflictingObjectFound
		do: [ :signal | signal return ]
]

{ #category : #initialization }
PersonModule >> rootSystem [
	^ rootSystem
]

{ #category : #initialization }
PersonModule >> systemInterfacesToInstall [
	^ #(#PersonSystemInterface)
]
