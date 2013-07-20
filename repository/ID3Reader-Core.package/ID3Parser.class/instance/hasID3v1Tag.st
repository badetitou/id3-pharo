testing
hasID3v1Tag

	^ [ (self id3v1Bytes first: self id3v1TagIdentifierSize) asString = self id3v1TagIdentifier ]
		on: Error
		do: [ :exc | false ]