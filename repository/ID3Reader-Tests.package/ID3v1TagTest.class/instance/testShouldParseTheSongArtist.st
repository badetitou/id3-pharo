fields
testShouldParseTheSongArtist

	| tag |
	tag := self tagWithArtist: 'Serú Girán'.
	
	self assert: tag artist equals: 'Serú Girán'