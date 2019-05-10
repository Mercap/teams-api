Class {
	#name : #ManifestTeamsAPISystem,
	#superclass : #PackageManifest,
	#category : #'TeamsAPI-Core'
}

{ #category : #'class initialization' }
ManifestTeamsAPISystem class >> initialize [
	<ignoreForCoverage>
	Kepler
		registerInterfaceAt: #PersonSystemInterface
			named: 'Person Management'
			declaring: #(#startManagingPerson: #stopManagingPerson: #people);
		registerInterfaceAt: #TeamSystemInterface
			named: 'Team Management'
			declaring: #(#startManagingTeam: #stopManagingTeam: #teams)
]
