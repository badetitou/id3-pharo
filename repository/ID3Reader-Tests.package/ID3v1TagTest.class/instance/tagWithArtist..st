helpers
tagWithArtist: anArtistName

	^ self
		tagTitled: ''
		artist: anArtistName
		album: ''
		year: 1900
		comment: ''
		genre: 0