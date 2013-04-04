private
flagAt: anIndex

	^ ((self flagsByte bitString last: 8) at: anIndex) = $1