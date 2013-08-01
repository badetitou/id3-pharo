private - frames
frameIdentifiedWith: aFrameId

	^ frames
		detect: [ :frame | frame isIdentifiedWith: aFrameId ]
		ifNone: [ FrameNotFoundError signal: aFrameId ]