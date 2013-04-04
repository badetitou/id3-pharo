synchsafe decoding
synchsafeDecode: aByteArray
	"Returns the number decoded as a 32-bit synchsafe integer using the argument bytes.
	See http://phoxis.org/2010/05/08/synch-safe/ for more details."

	| bits |
	bits := '' join: (
		(aByteArray asOrderedCollection
			collect: [ :byte | byte bitString last: 8 ])
				collect: #allButFirst).
	^ Integer readFrom: bits base: 2