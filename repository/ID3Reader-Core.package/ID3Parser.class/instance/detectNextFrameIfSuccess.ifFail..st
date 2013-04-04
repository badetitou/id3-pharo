private
detectNextFrameIfSuccess: aSuccessBlock ifFail: aFailBlock

	| supposedFrameId |
	supposedFrameId := (self stream next: 4) asString.
	(self isIdentifiedAsFrameHeader: supposedFrameId)
		ifTrue: [ aSuccessBlock value: (self createFrameHeader: supposedFrameId) ]
		ifFalse: [ aFailBlock value ]