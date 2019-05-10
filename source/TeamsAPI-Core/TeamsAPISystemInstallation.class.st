Class {
	#name : #TeamsAPISystemInstallation,
	#superclass : #SystemInstallation,
	#instVars : [
		'modules'
	],
	#category : #'TeamsAPI-Core'
}

{ #category : #'instance creation' }
TeamsAPISystemInstallation class >> installing: aModuleCollection [

	^self new initializeInstalling: aModuleCollection
]

{ #category : #installing }
TeamsAPISystemInstallation >> beAwareOfShutDownOf: aCompositeSystem [ 


]

{ #category : #accessing }
TeamsAPISystemInstallation >> modulesToInstall [
	^ OrderedCollection new
		add: PersonModule;
		add: TeamModule;
		yourself
]

{ #category : #accessing }
TeamsAPISystemInstallation >> name [
	^ 'TeamsAPI'
]
