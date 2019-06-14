Class {
	#name : #ID3v2HeaderTest,
	#superclass : #TestCase,
	#category : 'ID3Reader-Tests'
}

{ #category : #helpers }
ID3v2HeaderTest >> headerWithFlags: aCollectionOfFlags [

	^ ID3v24Header withBytes:
		'ID3' asByteArray ,
		#[4 0] ,
		(Integer readFrom: aCollectionOfFlags base: 2) asByteArray ,
		#[0 0 0 0]
]

{ #category : #'version info' }
ID3v2HeaderTest >> testShouldReturnItsMajorVersionNumber [

	| header |
	header := ID3v24Header withBytes: 'ID3' asByteArray , #[4 0 0 0 0 0 0].
	
	self assert: header majorVersion = 4
]

{ #category : #'version info' }
ID3v2HeaderTest >> testShouldReturnItsRevisionNumber [

	| header |
	header := ID3v24Header withBytes: 'ID3' asByteArray , #[4 0 0 0 0 0 0].
	
	self assert: header revision = 0
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheExperimentalFlagSetAsFalse [

	self deny: (self headerWithFlags: '00000000') experimentalFlag
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheExperimentalFlagSetAsTrue [

	self assert: (self headerWithFlags: '00100000') experimentalFlag
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheExtendedHeaderFlagSetAsFalse [

	self deny: (self headerWithFlags: '00000000') extendedHeaderFlag
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheExtendedHeaderFlagSetAsTrue [

	self assert: (self headerWithFlags: '01000000') extendedHeaderFlag
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheFooterFlagSetAsFalse [

	self deny: (self headerWithFlags: '00000000') footerFlag
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheFooterFlagSetAsTrue [

	self assert: (self headerWithFlags: '00010000') footerFlag
]

{ #category : #'tag length' }
ID3v2HeaderTest >> testShouldReturnTheTagSizeDecodingAs32BitSynchsafeInteger [

	| header tagSizeBytes |
	tagSizeBytes := #[0 0 8 44].
	header := ID3v24Header withBytes: 'ID3' asByteArray , #[4 0] , #[0] , tagSizeBytes.
	
	self assert: header tagSize = 1068
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheUnsynchronizationFlagSetAsFalse [

	self deny: (self headerWithFlags: '00000000') unsynchronizationFlag
]

{ #category : #flags }
ID3v2HeaderTest >> testShouldReturnTheUnsynchronizationFlagSetAsTrue [

	self assert: (self headerWithFlags: '10000000') unsynchronizationFlag
]
