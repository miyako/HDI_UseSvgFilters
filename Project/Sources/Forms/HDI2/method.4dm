Case of 
	: (Form event code:C388=On Load:K2:1)
		
		C_PICTURE:C286(<>pict)
		<>pict:=<>pict*0
		
		ARRAY TEXT:C222(blurSource; 2)
		blurSource{1}:="SourceGraphic"
		blurSource{2}:="SourceAlpha"
		blurSource:=2
		
		ARRAY LONGINT:C221(Deviation; 6)
		Deviation{1}:=0
		Deviation{2}:=2
		Deviation{3}:=3
		Deviation{4}:=4
		Deviation{5}:=5
		Deviation{6}:=6
		
		Deviation:=4
		
		
		ARRAY LONGINT:C221(OffsetX; 5)
		ARRAY LONGINT:C221(OffsetY; 5)
		
		OffsetX{1}:=2
		OffsetX{2}:=4
		OffsetX{3}:=6
		OffsetX{4}:=8
		OffsetX{5}:=10
		COPY ARRAY:C226(OffsetX; OffsetY)
		
		OffsetX:=3
		OffsetY:=3
		
		ARRAY TEXT:C222(BlendMode; 5)
		BlendMode{1}:="normal"
		BlendMode{2}:="multiply"
		BlendMode{3}:="screen"
		BlendMode{4}:="darken"
		BlendMode{5}:="lighten"
		
		BlendMode:=1
		
		
		SET DATABASE PARAMETER:C642(Direct2D status:K37:61; Direct2D software:K37:66)
		
		//----------------------------------------------------------------
		
		C_PICTURE:C286(<>pict)
		
		$root:=SVG_New(460; 460; "filters test"; "direct2D"; True:C214)
		
		
		$rect:=SVG_New_rect($root; 20; 20; 400; 400; 0; 0; "darkblue"; "white"; 1)
		
		$g:=SVG_New_group($root)
		SVG_SET_FILL_BRUSH($g; "orange")
		$textAreaRef:=SVG_New_textArea($g; "Hello World!"; 40; 40; 360; 360; "arial"; 120; Plain:K14:1; Align center:K42:3)
		
		<>pict:=SVG_Export_to_picture($root)
		
		//----------------------------------------------------------------
		
End case 