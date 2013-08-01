helpers
headerWithFlags: aCollectionOfFlags

	^ ID3v24Header withBytes:
		'ID3' asByteArray ,
		#[4 0] ,
		(Integer readFrom: aCollectionOfFlags base: 2) asByteArray ,
		#[0 0 0 0]