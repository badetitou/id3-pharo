private
isIdentifiedAsFrameHeader: supposedFrameId

	^ supposedFrameId notEmpty and: [
		supposedFrameId allSatisfy: [ :byte |
			'[A-Z0-9]' asRegex matches: byte asString ] ]