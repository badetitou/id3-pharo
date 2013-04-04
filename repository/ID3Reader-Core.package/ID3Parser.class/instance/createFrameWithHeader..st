private
createFrameWithHeader: aFrameHeader

	| frameContentBytes |
	frameContentBytes := self stream next: aFrameHeader size.
	^ ID3v24Frame withHeader: aFrameHeader andContentBytes: frameContentBytes