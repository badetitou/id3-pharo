fields
testGetTheArtistOfATag

	| titleFrameHeader titleFrame tag |
	titleFrameHeader := ID3v24FrameHeader withBytes: 'TPE1' asByteArray , #[0 0 0 14 0 0 3].
	titleFrame := ID3v24Frame withHeader: titleFrameHeader andContentBytes: '0Luis Alberto Spinetta' asByteArray.
	tag := ID3v2Tag withHeader: nil andFrames: (Array with: titleFrame).

	self assert: tag artist equals: 'Luis Alberto Spinetta'