frames
frames

	| frames isThereFrames |
	frames := OrderedCollection new.
	self positionToReadFrames.
	"start to read frames"
	isThereFrames := true.
	[ isThereFrames ] whileTrue: [
		self detectNextFrameIfSuccess: [ :frameHeader |
			frames add: (self createFrameWithHeader: frameHeader) ]
			ifFail: [ isThereFrames := false ] ].
	^ frames