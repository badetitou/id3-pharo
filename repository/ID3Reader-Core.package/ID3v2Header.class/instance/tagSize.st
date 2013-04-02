tag size
tagSize
	"Returns the tag size by decoding the last 4 bytes of the header as a 32-bit synchsafe integer.
	See http://phoxis.org/2010/05/08/synch-safe/ for more details."

	^Integer
		readFrom: 
			('' join: ((self tagSizeBytes asOrderedCollection
				collect: [ :byte | byte bitString last: 8 ])
					collect: [ :bitString | bitString allButFirst ]))
		base: 2