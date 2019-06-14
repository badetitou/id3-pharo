Class {
	#name : #ID3v24FrameTest,
	#superclass : #ID3Test,
	#category : 'ID3Reader-Tests'
}

{ #category : #header }
ID3v24FrameTest >> testShouldAnswerThatItIsIdentifiedWithAnId [

	self assert: (self validFrame isIdentifiedWith: 'TIT2')
]

{ #category : #header }
ID3v24FrameTest >> testShouldAnswerThatItIsNotIdentifiedWithAnId [

	self deny: (self validFrame isIdentifiedWith: 'TALB')
]

{ #category : #content }
ID3v24FrameTest >> testShouldReturnTheContent [

	self assert: self validFrame content equals: 'Hoodoo'
]

{ #category : #content }
ID3v24FrameTest >> testShouldReturnTheContentEncoding [

	self assert: self validFrame contentEncoding equals: 'ISO-8859-1'
]

{ #category : #header }
ID3v24FrameTest >> testShouldReturnTheFrameId [

	self assert: self validFrame id equals: 'TIT2'
]

{ #category : #header }
ID3v24FrameTest >> testShouldReturnTheSizeDecodedAsA32BitSynchsafeInteger [

	self assert: self validFrame size equals: 7
]

{ #category : #helpers }
ID3v24FrameTest >> validFrame [

	^ ID3v24Frame
		withHeader: (ID3v24FrameHeader withHeader: (ID3v24Header withBytes: self validUnsynchronisationHeader) andContentBytes:  #[84 73 84 50 0 0 0 7 0 0])
		andContentBytes: #[0 72 111 111 100 111 111]
]
