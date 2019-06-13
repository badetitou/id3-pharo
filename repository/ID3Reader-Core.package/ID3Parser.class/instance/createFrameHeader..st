private
createFrameHeader: aFrameID

	^ ID3v24FrameHeader withHeader: self header andContentBytes: aFrameID asByteArray , (self stream next: 6)