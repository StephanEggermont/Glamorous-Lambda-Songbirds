Class {
	#name : #SongbirdsGUI,
	#superclass : #Object,
	#instVars : [
		'blocSpace',
		'pannable',
		'sb'
	],
	#category : #'LambdaSongBirds-GUI'
}

{ #category : #deprecated }
SongbirdsGUI >> addCardinal [

| sb |

sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a b c . a c b )  ) .

sb relocate: 900 atRandom @ 700 atRandom  .

sb 	addEventHandler: BlPullHandler new.

pannable addChild: sb .

^ sb
]

{ #category : #deprecated }
SongbirdsGUI >> addIdiot [
	| sb |
	"
sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a . a ) ) ."
	sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'idiot').
	sb relocate: 900 atRandom @ 800 atRandom.
	sb addEventHandler: BlPullHandler new.
	pannable addChild: sb.
	^ sb
]

{ #category : #adding }
SongbirdsGUI >> addJay [

| sb |

sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a b c d . a b #( a c b ) ) ) .

"sb relocate: 20 atRandom @ 60 atRandom  ."

sb 	addEventHandler: BlPullHandler new.

pannable addChild: sb .

^ sb
]

{ #category : #adding }
SongbirdsGUI >> addKestrel [

| sb |

sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a b . a ) ) .

sb relocate: 900 atRandom @ 600 atRandom  .

sb 	addEventHandler: BlPullHandler new.

pannable addChild: sb .

^ sb
]

{ #category : #adding }
SongbirdsGUI >> addKite [

| sb |

sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a b . b ) ) .

sb relocate: 900 atRandom @ 800 atRandom  .

sb 	addEventHandler: BlPullHandler new.

pannable addChild: sb .

^ sb
]

{ #category : #adding }
SongbirdsGUI >> addKx [

| sb |

sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a b . a ) ) .

sb relocate: 900 atRandom @ 600 atRandom  .

sb 	addEventHandler: BlPullHandler new.

pannable addChild: sb .

^ sb
]

{ #category : #adding }
SongbirdsGUI >> addMockingbird [

| sb |

sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a . a a ) ) .

"sb relocate: 500 atRandom @ 200 atRandom  ."

sb 	addEventHandler: BlPullHandler new.

pannable addChild: sb .

^ sb
]

{ #category : #deprecated }
SongbirdsGUI >> addRightclickMenu [

| model |
model := BrWithContextMenuModel new
		stencil: [ BrAnchoredElement new
				look:
					(BrGlamorousContextMenuLook new
						content:
							(BrGlamorousSimpleContextMenuContent new
								items:

{('cardinal'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'cardinal').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

('kite'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'kite').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

('kestrel'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'kestrel').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

('mockingbird'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'mockingbird').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

('jay'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'jay').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

('thrush'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'thrush').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

('idiot'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: 'idiot').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

};

								yourself);
						yourself);
				yourself ];
		yourself.	
	
	
	
	
	blocSpace root viewModel: model.
	blocSpace root look: BrWithContextMenuLook new .
]

{ #category : #deprecated }
SongbirdsGUI >> addThrush [

| sb |

sb := BirdGlob new initFromModel: ( SongbirdModel new parse: #( \ a b . b a ) ) .

sb relocate: 700 atRandom @ 600 atRandom  .

sb 	addEventHandler: BlPullHandler new.

pannable addChild: sb .

^ sb
]

{ #category : #adding }
SongbirdsGUI >> cardinalHearThrush [

| thrushModel cardinalModel cardinal thrush |
blocSpace root removeChildren .

thrushModel := SongbirdModel new parse: #( \ a b . b a ) .
cardinalModel := SongbirdModel new parse: #( \ a b c . a c b ) .

thrush := BirdGlob new initFromModel: thrushModel .
cardinal := BirdGlob new initFromModel: cardinalModel .

thrush relocate: 300 "atRandom" @ 500 "atRandom"  .
thrush 	addEventHandler: BlPullHandler new.
blocSpace addChild: thrush .

blocSpace addChild: cardinal .


cardinal hearSong: thrush .
]

{ #category : #initialization }
SongbirdsGUI >> initialize [
	| st |
	super initialize.
	st := '
addRightclickMenu

| model |
model := BrWithContextMenuModel new
		stencil: [ BrAnchoredElement new
				look:
					(BrGlamorousContextMenuLook new
						content:
							(BrGlamorousSimpleContextMenuContent new
								items:

{'.
	SongbirdModel birdNameToBirdModelObjectDictionary
		keysAndValuesDo: [ :name :model | 
			| tmp |
			tmp := '(' , '''' , name , ''''
				,
					'-> [ :e | 
sb := BirdGlob new initFromModel: (SongbirdModel newModelOf: ' , ''''
				, name , ''''
				,
					').
sb addEventHandler: BlPullHandler new.
pannable addChild: sb.
]).

'.
			st := st , tmp ].
	st := st
		,
			'};

								yourself);
						yourself);
				yourself ];
		yourself.	
	
	
	
	
	blocSpace root viewModel: model.
	blocSpace root look: BrWithContextMenuLook new .'.
	self class compile: st
]

{ #category : #'instance creation' }
SongbirdsGUI >> open [
	blocSpace := BlSpace new
		extent: 1400 @ 800;
		title: 'Songbirds'.
	blocSpace root background: Color black.
	pannable := BlCanvassableElement new. "BlZoomableElement"
	pannable
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].
	pannable clipChildren: false.
	self addRightclickMenu.
	blocSpace root
		addEventHandler:
			(BlEventHandler
				on: BlMouseWheelEvent
				do: [ :evt | 
					evt isScrollDown
						ifTrue: [ pannable zoomIn ]
						ifFalse: [ pannable zoomOut ] ]).
	blocSpace root addChild: pannable.
	blocSpace show maximize
]

{ #category : #deprecated }
SongbirdsGUI >> startConnectMode [

" startConnectMode"
]

{ #category : #deprecated }
SongbirdsGUI >> startEatMode [

" startEatMode"
]

{ #category : #deprecated }
SongbirdsGUI >> startSingMode [

" startSingMode"
]
