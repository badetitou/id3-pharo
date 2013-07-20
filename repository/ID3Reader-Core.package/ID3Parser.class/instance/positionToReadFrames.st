private
positionToReadFrames

	self stream
		reset;
		next: self headerSize "skip header"