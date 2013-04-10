id3v1
testShouldHaveId3v1Tag

	| parser |
	parser := ID3Parser on: ((ByteArray new: 500), 'TAG' asByteArray, (ByteArray new: 125)) readStream.
	
	self assert: parser hasID3v1Tag.