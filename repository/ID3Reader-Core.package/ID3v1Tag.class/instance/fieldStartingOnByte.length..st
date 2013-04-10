private
fieldStartingOnByte: anIndex length: aNumber

	^ ((bytes copyFrom: anIndex to: anIndex + aNumber) copyUpTo: 0) asString