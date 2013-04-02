testing
hasID3v2Tag

	^ (self stream reset; next: 3) = self id3v2TagIdentifier asByteArray