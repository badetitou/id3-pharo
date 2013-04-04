private
createFrameHeader: aFrameID

	^ ID3v24FrameHeader withBytes: aFrameID asByteArray , (self stream next: 6)