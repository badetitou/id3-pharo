helpers
tagWithAlbum: anAlbumName

	^ self
		tagTitled: ''
		artist: ''
		album: anAlbumName
		year: 1900
		comment: ''
		genre: 0