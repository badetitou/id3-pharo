id3v2
testShouldFailToReturnHeaderIfItDoesNotStartWithID3

	|parser|
	parser := ID3Parser on: ('XXX' asByteArray , #[4 0 0 0 0 0 0]) readStream.
	
	self
		should: [ parser header ]
		raise: ID3InvalidTagError
		withExceptionDo: [ :exception |
			self
				assert: exception messageText
				equals: 'cannot find a ID3v2 tag' ]