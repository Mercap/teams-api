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

{ #category : #initialization }
TeamsAPISystemInstallation >> initializeInstalling: aModuleCollection [

	modules := aModuleCollection 
]

{ #category : #accessing }
TeamsAPISystemInstallation >> modulesToInstall [
	^ modules
]

{ #category : #accessing }
TeamsAPISystemInstallation >> name [
	^ 'TeamsAPI'
]
