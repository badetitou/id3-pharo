helpers
validFrame

	^ ID3v24Frame
		withHeader: (ID3v24FrameHeader withHeader: (ID3v24Header withBytes: self validUnsynchronisationHeader) andContentBytes:  #[84 73 84 50 0 0 0 7 0 0])
		andContentBytes: #[0 72 111 111 100 111 111]