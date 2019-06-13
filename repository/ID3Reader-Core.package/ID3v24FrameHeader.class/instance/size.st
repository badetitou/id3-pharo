fields
size
	^ header unsynchronizationFlag ifTrue: [ self synchsafeDecode: self sizeBytes ] ifFalse: [ self synchunsafeDecode: self sizeBytes ]