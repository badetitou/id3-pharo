id3v1
testShouldReturnAValidID3v1Tag

	| parser music title artist album year comment genre |
	music := ByteArray new: 10000.
	title := 'Echoes' asByteArray , (ByteArray new: 24).
	artist := 'Pink Floyd' asByteArray , (ByteArray new: 20).
	album := 'Meddle' asByteArray , (ByteArray new: 24).
	year := '1971' asByteArray.
	comment := 'this is a comment' asByteArray , (ByteArray new: 13).
	genre := #[93]. "Psychedelic Rock :)"
	parser := ID3Parser on: music , 'TAG' asByteArray , title , artist , album , year , comment , genre.
	
	self assert: parser id3v1Tag title equals: 'Echoes'.
	self assert: parser id3v1Tag artist equals: 'Pink Floyd'.
	self assert: parser id3v1Tag album equals: 'Meddle'.
	self assert: parser id3v1Tag year equals: 1971.
	self assert: parser id3v1Tag comment equals: 'this is a comment'.
	self assert: parser id3v1Tag genre equals: 'Psychedelic Rock'.