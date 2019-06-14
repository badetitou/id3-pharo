Class {
	#name : #ID3ParserTest,
	#superclass : #ID3Test,
	#category : 'ID3Reader-Tests'
}

{ #category : #id3v2 }
ID3ParserTest >> testHeaderShouldContainAtLeast10BytesToBeValid [

	|parser|
	parser := ID3Parser on: ('ID3' asByteArray , #[4 0 0 0 0 0]) readStream.
	
	self
		should: [ parser header ]
		raise: ID3InvalidTagError
		withExceptionDo: [ :exception |
			self
				assert: exception messageText
				equals: 'the ID3v2 header should have at least 10 bytes' ]
]

{ #category : #id3v2 }
ID3ParserTest >> testIfDoesNotStartWithID3ShouldNotHaveAID3v2Tag [

	|parser|
	parser := ID3Parser on: 'AAAAID3' asByteArray readStream.

	self deny: parser hasID3v2Tag
]

{ #category : #id3v2 }
ID3ParserTest >> testIfStartsWithID3ShouldHaveAID3v2Tag [

	|parser|
	parser := ID3Parser on: 'ID3' asByteArray readStream.

	self assert: parser hasID3v2Tag.
]

{ #category : #id3v2 }
ID3ParserTest >> testShouldFailToReturnHeaderIfItDoesNotStartWithID3 [

	|parser|
	parser := ID3Parser on: ('XXX' asByteArray , #[4 0 0 0 0 0 0]) readStream.
	
	self
		should: [ parser header ]
		raise: ID3InvalidTagError
		withExceptionDo: [ :exception |
			self
				assert: exception messageText
				equals: 'cannot find a ID3v2 tag' ]
]

{ #category : #id3v1 }
ID3ParserTest >> testShouldHaveId3v1Tag [

	| parser |
	parser := ID3Parser on: ((ByteArray new: 500), 'TAG' asByteArray, (ByteArray new: 125)) readStream.

	self assert: parser hasID3v1Tag
]

{ #category : #id3v2 }
ID3ParserTest >> testShouldNotFailWhenAskingForAHeader [

	|parser|
	parser := ID3Parser on: ('ID3' asByteArray , #[4 0 0 0 0 0 0]) readStream.

	self shouldnt: [ parser header ] raise: ID3InvalidTagError
]

{ #category : #id3v1 }
ID3ParserTest >> testShouldNotHaveId3v1TagIfTheFileContainsLessThan128Bytes [

	| parser |
	parser := ID3Parser on: ('TAG' asByteArray , (ByteArray new: 100)) readStream.

	self deny: parser hasID3v1Tag
]

{ #category : #id3v1 }
ID3ParserTest >> testShouldNotHaveId3v1TagIfTheLast128BytesFragmentDoNotStartWithTAG [

	| parser |
	parser := ID3Parser on: (ByteArray new: 128) readStream.

	self deny: parser hasID3v1Tag
]

{ #category : #frames }
ID3ParserTest >> testShouldReturnASingleFrameParsedCorrectly [

	| parser frameBytes |
	frameBytes := #[84 73 84 50 0 0 0 7 0 0 0 72 111 111 100 111 111].
	parser := ID3Parser on: (self validHeader , frameBytes) readStream.

	self
		assert: parser frames size equals: 1;
		assert: parser frames first id equals: 'TIT2';
		assert: parser frames first content equals: 'Hoodoo'
]

{ #category : #id3v1 }
ID3ParserTest >> testShouldReturnAValidID3v1Tag [

	| parser music title artist album year comment genre |
	music := ByteArray new: 10000.
	title := 'Echoes' asByteArray , (ByteArray new: 24).
	artist := 'Pink Floyd' asByteArray , (ByteArray new: 20).
	album := 'Meddle' asByteArray , (ByteArray new: 24).
	year := '1971' asByteArray.
	comment := 'this is a comment' asByteArray , (ByteArray new: 13).
	genre := #[93]. "Psychedelic Rock :)"
	parser := ID3Parser on: music , 'TAG' asByteArray , title , artist , album , year , comment , genre.
	
	self
		assert: parser id3v1Tag title equals: 'Echoes';
		assert: parser id3v1Tag artist equals: 'Pink Floyd';
		assert: parser id3v1Tag album equals: 'Meddle';
		assert: parser id3v1Tag year equals: 1971;
		assert: parser id3v1Tag comment equals: 'this is a comment';
		assert: parser id3v1Tag genre equals: 'Psychedelic Rock'
]

{ #category : #id3v2 }
ID3ParserTest >> testShouldReturnAValidID3v2Tag [

	| bytes parser tag |
	bytes := 'ID3' asByteArray , #[4 0 0 0 0 111 118]
		, 'TALB' asByteArray , #[0 0 0 9 0 0 3] , 'Kamikaze' asByteArray
		, 'TPE1' asByteArray , #[0 0 0 22 0 0 3] , 'Luis Alberto Spinetta' asByteArray
		, 'TIT2' asByteArray , #[0 0 0 14 0 0 3] , 'Barro Tal Vez' asByteArray.
	parser := ID3Parser on: bytes readStream.
	tag := parser id3v2Tag.
	
	self
		assert: tag title equals: 'Barro Tal Vez';
		assert: tag artist equals: 'Luis Alberto Spinetta';
		assert: tag album equals: 'Kamikaze'
]

{ #category : #frames }
ID3ParserTest >> testShouldReturnAnEmptyListOfFramesWhenThereIsNoData [

	| parser |
	parser := ID3Parser on: self validHeader readStream.

	self assert: parser frames isEmpty
]

{ #category : #frames }
ID3ParserTest >> testShouldReturnMultipleFramesParsedCorrectly [

	| frames parser frameBytes titleFrame albumFrame yearFrame |
	titleFrame := #[84 73 84 50 0 0 0 7 0 0 0 72 111 111 100 111 111].
	albumFrame := #[84 65 76 66 0 0 0 28 0 0 0 66 108 97 99 107 32 72 111 108 101 115 32 97 110 100 32 82 101 118 101 108 97 116 105 111 110 115].
	yearFrame := #[84 68 82 67 0 0 0 5 0 0 0 50 48 48 54].
	frameBytes := titleFrame , albumFrame , yearFrame.
	parser := ID3Parser on: (self validHeader , frameBytes) readStream.
	frames := parser frames .
	self
		assert: parser frames size equals: 3;
		assert: parser frames first id equals: 'TIT2';
		assert: parser frames first content equals: 'Hoodoo';
		assert: parser frames second id equals: 'TALB';
		assert: parser frames second content equals: 'Black Holes and Revelations';
		assert: parser frames third id equals: 'TDRC';
		assert: parser frames third content equals: '2006'
]

{ #category : #helpers }
ID3ParserTest >> validHeader [

	^ self validUnsynchronisationHeader
]
