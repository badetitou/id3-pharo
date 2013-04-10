id3v1
testShouldNotHaveId3v1TagIfTheLast128BytesFragmentDoNotStartWithTAG

	| parser |
	parser := ID3Parser on: (ByteArray new: 128) readStream.
	
	self deny: parser hasID3v1Tag