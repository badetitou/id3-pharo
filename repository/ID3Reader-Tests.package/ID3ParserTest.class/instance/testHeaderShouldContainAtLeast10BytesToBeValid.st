id3v2
testHeaderShouldContainAtLeast10BytesToBeValid

	|parser|
	parser := ID3Parser on: ('ID3' asByteArray , #[4 0 0 0 0 0]) readStream.
	
	self
		should: [ parser header ]
		raise: ID3InvalidTagError
		withExceptionDo: [ :exception |
			self
				assert: exception messageText
				equals: 'the ID3v2 header should have at least 10 bytes' ]