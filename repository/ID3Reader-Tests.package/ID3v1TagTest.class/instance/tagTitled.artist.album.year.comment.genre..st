helpers
tagTitled: aTitle artist: anArtistName album: anAlbumName year: aYear	comment: aComment genre: aGenreCode

	| title artist album year comment genre |
	title := aTitle asByteArray , (ByteArray new: 30 - aTitle size).
	artist := anArtistName asByteArray , (ByteArray new: 30 - anArtistName size).
	album := anAlbumName asByteArray , (ByteArray new: 30 - anAlbumName size).
	year := aYear asString asByteArray , (ByteArray new: 4 - aYear asString size).
	comment := aComment asByteArray , (ByteArray new: 30 - aComment size).
	genre := ByteArray with: aGenreCode.
	^ ID3v1Tag withBytes: 'TAG' asByteArray , title , artist , album , year , comment , genre