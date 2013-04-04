header
header

	| headerBytes |
	self hasID3v2Tag	ifFalse: [ ID3InvalidTagError signal: 'cannot find a ID3v2 tag' ].
	self stream reset.
	headerBytes := self stream next: 10.
	headerBytes size < 10
		ifTrue: [ ID3InvalidTagError signal: 'the ID3v2 header should have at least 10 bytes' ].
	^ ID3v24Header withBytes: headerBytes