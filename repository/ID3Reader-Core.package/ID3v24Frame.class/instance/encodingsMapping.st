private
encodingsMapping
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