id3v2
testIfDoesNotStartWithID3ShouldNotHaveAID3v2Tag

	|parser|
	parser := ID3Parser on: 'AAAAID3' asByteArray readStream.
	
	self deny: parser hasID3v2Tag.