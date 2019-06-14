"
All ID3v2 frames consists of one frame header followed by one or more
   fields containing the actual information. The header is always 10
   bytes and laid out as follows:

     Frame ID      $xx xx xx xx  (four characters)
     Size      4 * %0xxxxxxx
     Flags         $xx xx
"
Class {
	#name : #ID3v24FrameHeader,
	#superclass : #ID3v24TagFragment,
	#instVars : [
		'header'
	],
	#category : 'ID3Reader-Core'
}

{ #category : #'instance creation' }
ID3v24FrameHeader class >> withHeader: aFrameHeader andContentBytes: aByteArray [ 

	^ (self withBytes: aByteArray) initializeWithHeader: aFrameHeader
]

{ #category : #private }
ID3v24FrameHeader >> flagsBytes [

	^ bytes copyFrom: 9 to: 10
]

{ #category : #fields }
ID3v24FrameHeader >> id [

	^ self idBytes asString
]

{ #category : #private }
ID3v24FrameHeader >> idBytes [

	^ bytes first: 4
]

{ #category : #fields }
ID3v24FrameHeader >> initializeWithHeader: aFrameHeader [ 

	header := aFrameHeader
]

{ #category : #fields }
ID3v24FrameHeader >> size [
	^ header unsynchronizationFlag ifTrue: [ self synchsafeDecode: self sizeBytes ] ifFalse: [ self synchunsafeDecode: self sizeBytes ]
]

{ #category : #private }
ID3v24FrameHeader >> sizeBytes [

	^ bytes copyFrom: 5 to: 8
]
