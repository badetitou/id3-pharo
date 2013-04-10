fields
testShouldParseTheSongYear

	| tag |
	tag := self tagWithYear: 2005.
	
	self assert: tag year equals: 2005