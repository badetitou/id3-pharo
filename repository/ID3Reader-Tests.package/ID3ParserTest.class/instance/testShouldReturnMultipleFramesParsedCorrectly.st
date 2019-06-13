frames
testShouldReturnMultipleFramesParsedCorrectly

	| frames parser frameBytes titleFrame albumFrame yearFrame |
	titleFrame := #[84 73 84 50 0 0 0 7 0 0 0 72 111 111 100 111 111].
	albumFrame := #[84 65 76 66 0 0 0 28 0 0 0 66 108 97 99 107 32 72 111 108 101 115 32 97 110 100 32 82 101 118 101 108 97 116 105 111 110 115].
	yearFrame := #[84 68 82 67 0 0 0 5 0 0 0 50 48 48 54].
	frameBytes := titleFrame , albumFrame , yearFrame.
	parser := ID3Parser on: (self validHeader , frameBytes) readStream.
	frames := parser frames .
	self
		assert: parser frames size equals: 3;
		assert: parser frames first id equals: 'TIT2';
		assert: parser frames first content equals: 'Hoodoo';
		assert: parser frames second id equals: 'TALB';
		assert: parser frames second content equals: 'Black Holes and Revelations';
		assert: parser frames third id equals: 'TDRC';
		assert: parser frames third content equals: '2006'