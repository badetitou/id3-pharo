Class {
	#name : #ID3v24TagFragment,
	#superclass : #Object,
	#instVars : [
		'bytes'
	],
	#category : 'ID3Reader-Core'
}

{ #category : #'instance creation' }
ID3v24TagFragment class >> withBytes: aByteArray [ 

	^ self new initializeWithBytes: aByteArray
]

{ #category : #initialization }
ID3v24TagFragment >> initializeWithBytes: aByteArray [ 

	bytes := aByteArray
]

{ #category : #'synchsafe decoding' }
ID3v24TagFragment >> synchsafeDecode: aByteArray [
	"Returns the number decoded as a 32-bit synchsafe integer using the argument bytes.
	See http://phoxis.org/2010/05/08/synch-safe/ for more details."

	| bits |
	bits := '' join: (
		(aByteArray asOrderedCollection
			collect: [ :byte | byte bitString last: 8 ])
				collect: #allButFirst).
	^ Integer readFrom: bits base: 2
]

{ #category : #'synchsafe decoding' }
ID3v24TagFragment >> synchunsafeDecode: aByteArray [
	"Returns the number decoded as a 32-bit synchsafe integer using the argument bytes.
	See http://phoxis.org/2010/05/08/synch-safe/ for more details."

	| bits |
	bits := '' join: (aByteArray asOrderedCollection collect: [ :byte | byte bitString last: 8 ]).
	^ Integer readFrom: bits base: 2
]
