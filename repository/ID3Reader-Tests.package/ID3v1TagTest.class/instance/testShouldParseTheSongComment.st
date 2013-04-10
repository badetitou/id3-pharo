fields
testShouldParseTheSongComment

	| tag |
	tag := self tagWithComment: 'my favourite song'.
	
	self assert: tag comment equals: 'my favourite song'