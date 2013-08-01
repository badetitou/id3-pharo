fields
testGetTheTitleOfATag

	| titleFrameHeader titleFrame tag |
	titleFrameHeader := ID3v24FrameHeader withBytes: 'TIT2' asByteArray , #[0 0 0 14 0 0 3].
	titleFrame := ID3v24Frame withHeader: titleFrameHeader andContentBytes: '0Barro Tal Vez' asByteArray.
	tag := ID3v2Tag withHeader: nil andFrames: (Array with: titleFrame).

	self assert: tag title equals: 'Barro Tal Vez'