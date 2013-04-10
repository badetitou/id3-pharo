fields
testShouldParseTheSongAlbum

	| tag |
	tag := self tagWithAlbum: 'Piano Bar'.
	
	self assert: tag album equals: 'Piano Bar'