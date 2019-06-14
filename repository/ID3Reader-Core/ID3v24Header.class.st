Class {
	#name : #ID3v24Header,
	#superclass : #ID3v24TagFragment,
	#category : 'ID3Reader-Core'
}

{ #category : #flags }
ID3v24Header >> experimentalFlag [

	^ self flagAt: 3
]

{ #category : #flags }
ID3v24Header >> extendedHeaderFlag [

	^ self flagAt: 2
]

{ #category : #private }
ID3v24Header >> flagAt: anIndex [

	^ ((self flagsByte bitString last: 8) at: anIndex) = $1
]

{ #category : #private }
ID3v24Header >> flagsByte [

	^ bytes sixth
]

{ #category : #flags }
ID3v24Header >> footerFlag [

	^ self flagAt: 4
]

{ #category : #'version info' }
ID3v24Header >> majorVersion [
	
	^ bytes fourth
]

{ #category : #'version info' }
ID3v24Header >> revision [

	^ bytes fifth
]

{ #category : #'tag size' }
ID3v24Header >> tagSize [

	^ self synchsafeDecode: self tagSizeBytes
]

{ #category : #private }
ID3v24Header >> tagSizeBytes [

	^ bytes last: 4
]

{ #category : #flags }
ID3v24Header >> unsynchronizationFlag [

	^ self flagAt: 1
]
