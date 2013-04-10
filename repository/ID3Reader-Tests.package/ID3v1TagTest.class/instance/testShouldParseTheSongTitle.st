fields
testShouldParseTheSongTitle

	| tag |
	tag := self tagTitled: 'Confesiones de invierno'.
	
	self assert: tag title equals: 'Confesiones de invierno'