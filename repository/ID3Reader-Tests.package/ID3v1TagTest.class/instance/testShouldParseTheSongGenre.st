fields
testShouldParseTheSongGenre

	| tag |
	tag := self tagWithGenre: 93.
	
	self assert: tag genreCode equals: 93.
	self assert: tag genre equals: 'Psychedelic Rock'