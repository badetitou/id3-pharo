Class {
	#name : #ID3Test,
	#superclass : #TestCase,
	#category : 'ID3Reader-Tests'
}

{ #category : #helpers }
ID3Test >> validSynchronisationHeader [

	^ 'ID3' asByteArray , #[4 0 0 0 0 0 0]
]

{ #category : #helpers }
ID3Test >> validUnsynchronisationHeader [

	^ 'ID3' asByteArray , #[4 0 128 0 0 0 0]
]
