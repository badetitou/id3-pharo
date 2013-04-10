private
genreNameFor: aGenreCode

	^ (aGenreCode between: 0 and: 125)
		ifTrue: [ self knownGenreCodesMapping at: aGenreCode ]
		ifFalse: [ 'Unknown' ]