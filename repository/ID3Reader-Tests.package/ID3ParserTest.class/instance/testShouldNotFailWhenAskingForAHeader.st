id3v2
testShouldNotFailWhenAskingForAHeader

	|parser|
	parser := ID3Parser on: ('ID3' asByteArray , #[4 0 0 0 0 0 0]) readStream.
	
	self shouldnt: [ parser header ] raise: ID3InvalidTagError.