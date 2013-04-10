*ID3Reader-Core
last: n
	"Return the last n elements in the stream"
	
	self setToEnd.
	^ self previous: n