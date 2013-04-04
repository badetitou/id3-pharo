private
isIdentifiedAsFrameHeader: supposedFrameId

	^ supposedFrameId notEmpty &
		(supposedFrameId allSatisfy: [ :byte | '[A-Z0-9]' asRegex matches: byte asString ])