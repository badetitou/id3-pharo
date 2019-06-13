instance creation
withHeader: aFrameHeader andContentBytes: aByteArray 

	^ (self withBytes: aByteArray) initializeWithHeader: aFrameHeader