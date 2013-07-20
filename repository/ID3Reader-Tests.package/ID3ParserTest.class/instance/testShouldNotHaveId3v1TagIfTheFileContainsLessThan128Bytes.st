id3v1
testShouldNotHaveId3v1TagIfTheFileContainsLessThan128Bytes

	| parser |
	parser := ID3Parser on: ('TAG' asByteArray , (ByteArray new: 100)) readStream.

	self deny: parser hasID3v1Tag