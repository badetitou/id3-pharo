Class {
	#name : #ID3Parser,
	#superclass : #Object,
	#instVars : [
		'stream',
		'header'
	],
	#category : 'ID3Reader-Core'
}

{ #category : #'instance creation' }
ID3Parser class >> on: aStream [

	^ self new initializeOn: aStream
]

{ #category : #private }
ID3Parser >> createFrameHeader: aFrameID [

	^ ID3v24FrameHeader withHeader: self header andContentBytes: aFrameID asByteArray , (self stream next: 6)
]

{ #category : #private }
ID3Parser >> createFrameWithHeader: aFrameHeader [

	| frameContentBytes |
	frameContentBytes := self stream next: aFrameHeader size.
	^ ID3v24Frame withHeader: aFrameHeader andContentBytes: frameContentBytes
]

{ #category : #private }
ID3Parser >> detectNextFrameIfSuccess: aSuccessBlock ifFail: aFailBlock [

	| supposedFrameId |
	supposedFrameId := (self stream next: 4) asString.
	(self isIdentifiedAsFrameHeader: supposedFrameId)
		ifTrue: [ aSuccessBlock value: (self createFrameHeader: supposedFrameId) ]
		ifFalse: aFailBlock
]

{ #category : #frames }
ID3Parser >> frames [

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
]

{ #category : #testing }
ID3Parser >> hasID3v1Tag [

	^ [ (self id3v1Bytes first: self id3v1TagIdentifierSize) asString = self id3v1TagIdentifier ]
		on: Error
		do: [ :exc | false ]
]

{ #category : #testing }
ID3Parser >> hasID3v2Tag [

	self stream reset.
	^ (self stream next: self id3v2TagIdentifierSize) asString = self id3v2TagIdentifier
]

{ #category : #header }
ID3Parser >> header [

	| headerBytes |
	header ifNotNil: [ ^ header ].
	self hasID3v2Tag	ifFalse: [ ID3InvalidTagError signal: 'cannot find a ID3v2 tag' ].
	self stream reset.
	headerBytes := self stream next: self headerSize.
	headerBytes size < self headerSize
		ifTrue: [ ID3InvalidTagError signal: 'the ID3v2 header should have at least 10 bytes' ].
	header := ID3v24Header withBytes: headerBytes.
	^ header
]

{ #category : #private }
ID3Parser >> headerSize [

	^ 10
]

{ #category : #private }
ID3Parser >> id3v1Bytes [

	^ self stream last: self id3v1TagSize
]

{ #category : #id3v1 }
ID3Parser >> id3v1Tag [

	^ ID3v1Tag withBytes: self id3v1Bytes
]

{ #category : #private }
ID3Parser >> id3v1TagIdentifier [

	^ 'TAG'
]

{ #category : #private }
ID3Parser >> id3v1TagIdentifierSize [

	^ self id3v1TagIdentifier size
]

{ #category : #private }
ID3Parser >> id3v1TagSize [

	^ 128
]

{ #category : #id3v2 }
ID3Parser >> id3v2Tag [

	^ ID3v2Tag
		withHeader: self header
		andFrames: self frames
]

{ #category : #private }
ID3Parser >> id3v2TagIdentifier [

	^ 'ID3'
]

{ #category : #private }
ID3Parser >> id3v2TagIdentifierSize [

	^ self id3v2TagIdentifier size
]

{ #category : #initialization }
ID3Parser >> initializeOn: aStream [

	stream := aStream
]

{ #category : #private }
ID3Parser >> isIdentifiedAsFrameHeader: supposedFrameId [

	^ supposedFrameId notEmpty and: [
		supposedFrameId allSatisfy: [ :byte |
			'[A-Z0-9]' asRegex matches: byte asString ] ]
]

{ #category : #private }
ID3Parser >> positionToReadFrames [

	self stream
		reset;
		next: self headerSize "skip header"
]

{ #category : #stream }
ID3Parser >> stream [

	^ stream
]
