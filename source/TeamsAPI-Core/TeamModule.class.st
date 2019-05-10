Class {
	#name : #TeamModule,
	#superclass : #SystemModule,
	#instVars : [
		'rootSystem'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #'instance creation' }
TeamModule class >> toInstallOn: aCompositeSystem [ 

	^ self new initializeToInstallOn: aCompositeSystem 
]

{ #category : #initialization }
TeamModule >> initializeToInstallOn: aCompositeSystem [
	rootSystem := aCompositeSystem.
	self registerSystemInterface
]

{ #category : #private }
TeamModule >> name [
	^ 'Team'
]

{ #category : #initialization }
TeamModule >> registerSystemInterface [
	[ Kepler
		registerInterfaceAt: #TeamSystemInterface
		named: 'Team System Interface'
		declaring: #(#startManagingTeam: #stopManagingTeam: #teams) ]
		on: ConflictingObjectFound
		do: [ :signal | signal return ]
]

{ #category : #private }
TeamModule >> registerTeamManagementSystemForInstallationIn: systems [
	^ self register: [ TeamSystem new ] in: systems
]

{ #category : #private }
TeamModule >> rootSystem [
	^ rootSystem
]

{ #category : #private }
TeamModule >> systemInterfacesToInstall [
	^ #(#TeamSystemInterface)
]
