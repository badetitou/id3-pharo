testing
hasID3v1Tag

	^ [((self stream last: 128) first: 3) asString = 'TAG'] on: Error do: [ :exc | false ]