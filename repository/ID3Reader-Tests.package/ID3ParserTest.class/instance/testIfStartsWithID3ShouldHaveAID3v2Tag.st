header
testIfStartsWithID3ShouldHaveAID3v2Tag

	|parser|
	parser := ID3Parser on: 'ID3' asByteArray readStream.
	
	self assert: parser hasID3v2Tag.