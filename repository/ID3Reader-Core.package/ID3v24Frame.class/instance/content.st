content
content
	^ (self contentEncodingByte = 1 or: [ self contentEncodingByte = 2 ])
		ifTrue: [ UTF16TextConverter new convertFromSystemString: self contentBytes asString ]
		ifFalse: [ self contentEncodingByte = 3 ifTrue: [ UTF8TextConverter new convertFromSystemString: self contentBytes asString ] ifFalse: [ self contentBytes asString ] ]