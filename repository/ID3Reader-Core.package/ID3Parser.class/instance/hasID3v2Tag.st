testing
hasID3v2Tag

	self stream reset.
	^ (self stream next: 3) = self id3v2TagIdentifier asByteArray