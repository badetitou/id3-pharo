Class {
	#name : #FrameNotFoundError,
	#superclass : #Error,
	#category : 'ID3Reader-Core'
}

{ #category : #'instance creation' }
FrameNotFoundError class >> signal: aFrameId [

	^ super signal: 'Frame ', aFrameId printString , ' not found'
]
