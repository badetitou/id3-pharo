testing
hasID3v2Tag

	self stream reset.
	^ (self stream next: self id3v2TagIdentifierSize) asString = self id3v2TagIdentifier