Extension { #name : #PositionableStream }

{ #category : #'*ID3Reader-Core' }
PositionableStream >> last: n [
	"Return the last n elements in the stream"
	
	self setToEnd.
	^ self previous: n
]

{ #category : #'*ID3Reader-Core' }
PositionableStream >> previous: n [
	"Return the previous n elements in the stream"

	| previousElements |
	previousElements := OrderedCollection new.
	n timesRepeat: [ previousElements addFirst: self back ].
	self setToEnd.
	^ collection species withAll: previousElements
]
