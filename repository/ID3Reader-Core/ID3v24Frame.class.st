Class {
	#name : #ID3v24Frame,
	#superclass : #ID3v24TagFragment,
	#instVars : [
		'header'
	],
	#category : 'ID3Reader-Core'
}

{ #category : #'instance creation' }
ID3v24Frame class >> withHeader: aFrameHeader andContentBytes: aByteArray [ 

	^ (self withBytes: aByteArray) initializeWithHeader: aFrameHeader
]

{ #category : #content }
ID3v24Frame >> content [
	^ (self contentEncodingByte = 1 or: [ self contentEncodingByte = 2 ])
		ifTrue: [ UTF16TextConverter new convertFromSystemString: self contentBytes asString ]
		ifFalse: [ self contentEncodingByte = 3 ifTrue: [ UTF8TextConverter new convertFromSystemString: self contentBytes asString ] ifFalse: [ self contentBytes asString ] ]
]

{ #category : #private }
ID3v24Frame >> contentBytes [

	^ bytes allButFirst
]

{ #category : #content }
ID3v24Frame >> contentEncoding [

	^ self encodingsMapping at: self contentEncodingByte
]

{ #category : #private }
ID3v24Frame >> contentEncodingByte [

	^ bytes first
]

{ #category : #private }
ID3v24Frame >> encodingsMapping [
	"from http://id3.org/id3v2.4.0-structure
	
     $00   ISO-8859-1 [ISO-8859-1]. Terminated with $00.
     $01   UTF-16 [UTF-16] encoded Unicode [UNICODE] with BOM. All
           strings in the same frame SHALL have the same byteorder.
           Terminated with $00 00.
     $02   UTF-16BE [UTF-16] encoded Unicode [UNICODE] without BOM.
           Terminated with $00 00.
     $03   UTF-8 [UTF-8] encoded Unicode [UNICODE]. Terminated with $00."

	^ Dictionary
		with: 0 -> 'ISO-8859-1'
		with: 1 -> 'UTF-16'
		with: 2 -> 'UTF-16BE'
		with: 3 -> 'UTF-8'
]

{ #category : #header }
ID3v24Frame >> header [

	^ header
]

{ #category : #header }
ID3v24Frame >> id [

	^ self header id
]

{ #category : #initialization }
ID3v24Frame >> initializeWithHeader: aFrameHeader [ 

	header := aFrameHeader
]

{ #category : #header }
ID3v24Frame >> isIdentifiedWith: aFrameId [

	^ header id = aFrameId
]

{ #category : #header }
ID3v24Frame >> size [

	^ self header size
]
