id3v1
id3v1Tag

	^ ID3v1Tag withBytes: (self stream last: 128)