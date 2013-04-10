*ID3Reader-Core
previous: n
	"Return the previous n elements in the stream"

	| previousElements |
	previousElements := OrderedCollection new.
	n timesRepeat: [ previousElements addFirst: self back ].
	self setToEnd.
	^ collection species withAll: previousElements