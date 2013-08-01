id3v2
id3v2Tag

	^ ID3v2Tag
		withHeader: self header
		andFrames: self frames