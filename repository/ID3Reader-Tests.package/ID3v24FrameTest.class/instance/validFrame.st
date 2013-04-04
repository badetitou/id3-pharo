helpers
validFrame

	^ ID3v24Frame
		withHeader: (ID3v24FrameHeader withBytes: #[84 73 84 50 0 0 0 7 0 0])
		andContentBytes: #[0 72 111 111 100 111 111]