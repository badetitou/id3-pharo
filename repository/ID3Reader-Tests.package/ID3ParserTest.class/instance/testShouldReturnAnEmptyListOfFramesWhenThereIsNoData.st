frames
testShouldReturnAnEmptyListOfFramesWhenThereIsNoData

	| parser |
	parser := ID3Parser on: self validHeader readStream.
	
	self assert: parser frames isEmpty.