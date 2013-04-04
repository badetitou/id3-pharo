frames
testShouldReturnMultipleFramesParsedCorrectly

	| parser frameBytes titleFrame albumFrame yearFrame |
	titleFrame := #[84 73 84 50 0 0 0 7 0 0 0 72 111 111 100 111 111].
	albumFrame := #[84 65 76 66 0 0 0 28 0 0 0 66 108 97 99 107 32 72 111 108 101 115 32 97 110 100 32 82 101 118 101 108 97 116 105 111 110 115].
	yearFrame := #[84 68 82 67 0 0 0 5 0 0 0 50 48 48 54].
	frameBytes := titleFrame , albumFrame , yearFrame.
	parser := ID3Parser on: (self validHeader , frameBytes) readStream.

	self assert: parser frames size == 3.
	self assert: parser frames first id = 'TIT2'.
	self assert: parser frames first content = 'Hoodoo'.
	self assert: parser frames second id = 'TALB'.
	self assert: parser frames second content = 'Black Holes and Revelations'.
	self assert: parser frames third id = 'TDRC'.
	self assert: parser frames third content = '2006'