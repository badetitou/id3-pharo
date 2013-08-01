instance creation
signal: aFrameId

	^ super signal: 'Frame ', aFrameId printString , ' not found'