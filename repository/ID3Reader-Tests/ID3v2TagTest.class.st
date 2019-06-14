Class {
	#name : #ID3v2TagTest,
	#superclass : #TestCase,
	#category : 'ID3Reader-Tests'
}

{ #category : #fields }
ID3v2TagTest >> testGetAFieldInexistentInTheTag [

	| titleFrameHeader titleFrame tag |
	titleFrameHeader := ID3v24FrameHeader withBytes: 'TIT2' asByteArray , #[0 0 0 14 0 0 3].
	titleFrame := ID3v24Frame withHeader: titleFrameHeader andContentBytes: '0Barro Tal Vez' asByteArray.
	tag := ID3v2Tag withHeader: nil andFrames: (Array with: titleFrame).

	self should: [ tag artist ] raise: FrameNotFoundError withExceptionDo: [ :frameNotFoundError |
		self
			assert: frameNotFoundError messageText
			equals: 'Frame ''TPE1'' not found' ]
]

{ #category : #fields }
ID3v2TagTest >> testGetTheAlbumOfATag [

	| titleFrameHeader titleFrame tag |
	titleFrameHeader := ID3v24FrameHeader withBytes: 'TALB' asByteArray , #[0 0 0 14 0 0 3].
	titleFrame := ID3v24Frame withHeader: titleFrameHeader andContentBytes: '0Kamikaze' asByteArray.
	tag := ID3v2Tag withHeader: nil andFrames: (Array with: titleFrame).

	self assert: tag album equals: 'Kamikaze'
]

{ #category : #fields }
ID3v2TagTest >> testGetTheArtistOfATag [

	| titleFrameHeader titleFrame tag |
	titleFrameHeader := ID3v24FrameHeader withBytes: 'TPE1' asByteArray , #[0 0 0 14 0 0 3].
	titleFrame := ID3v24Frame withHeader: titleFrameHeader andContentBytes: '0Luis Alberto Spinetta' asByteArray.
	tag := ID3v2Tag withHeader: nil andFrames: (Array with: titleFrame).

	self assert: tag artist equals: 'Luis Alberto Spinetta'
]

{ #category : #fields }
ID3v2TagTest >> testGetTheTitleOfATag [

	| titleFrameHeader titleFrame tag |
	titleFrameHeader := ID3v24FrameHeader withBytes: 'TIT2' asByteArray , #[0 0 0 14 0 0 3].
	titleFrame := ID3v24Frame withHeader: titleFrameHeader andContentBytes: '0Barro Tal Vez' asByteArray.
	tag := ID3v2Tag withHeader: nil andFrames: (Array with: titleFrame).

	self assert: tag title equals: 'Barro Tal Vez'
]
