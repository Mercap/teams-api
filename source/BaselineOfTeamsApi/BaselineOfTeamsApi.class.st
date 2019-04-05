Class {
	#name : #BaselineOfTeamsApi,
	#superclass : #BaselineOf,
	#category : #BaselineOfTeamsApi
}

{ #category : #accessing }
BaselineOfTeamsApi >> baseline: spec [
	<baseline>
	spec
		for: #pharo
		do: [ self
				setUpDependencies: spec;
				baselineTeamsApi: spec.
			spec
				group: 'CI' with: 'Tests';
				group: 'Development' with: #('Tests') ]
]

{ #category : #accessing }
BaselineOfTeamsApi >> baselineTeamsApi: spec [
	
]

{ #category : #accessing }
BaselineOfTeamsApi >> projectClass [

	^ MetacelloCypressBaselineProject
]

{ #category : #accessing }
BaselineOfTeamsApi >> setUpDependencies: spec [
	spec
		baseline: 'Stargate'
			with: [ spec repository: 'github://ba-st/Stargate:v1/source' ];
		project: 'Stargate-Deployment'
			copyFrom: 'Stargate'
			with: [ spec loads: 'Deployment' ];
		project: 'Stargate-Tools'
			copyFrom: 'Stargate'
			with: [ spec loads: 'Tools' ]
]
