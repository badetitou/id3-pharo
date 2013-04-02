header
header

	| headerBytes |
	self hasID3v2Tag
		ifFalse: [ ID3InvalidTagError signal: 'cannot find a ID3v2 tag' ].
	headerBytes := self stream reset; next: 10.
	headerBytes size < 10
		ifTrue: [ ID3InvalidTagError signal: 'the ID3v2 header should have at least 10 bytes' ].
	^ ID3v2Header withBytes: headerBytes