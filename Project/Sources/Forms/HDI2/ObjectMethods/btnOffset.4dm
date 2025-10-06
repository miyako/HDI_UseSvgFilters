C_PICTURE:C286(<>pict)

Case of 
	: (Form event code:C388=On Mouse Enter:K2:33)
		<>Infos:="The offset filter “moves” the objects horizontaly and verticaly according to “Offset X” and “Offset Y” parameters"
	: (Form event code:C388=On Mouse Leave:K2:34)
		<>Infos:=""
	: (Form event code:C388=On Clicked:K2:4)
		
		$root:=SVG_New(460; 460; "filters test"; "direct2D"; True:C214)
		
		
		$filter:=SVG_Define_filter($root; "Offset")  //;0;0;400;400)
		SVG_Filter_Offset($filter; OffsetX{OffsetX}; OffsetY{OffsetY})
		
		
		
		$rect:=SVG_New_rect($root; 20; 20; 400; 400; 0; 0; "darkblue"; "white"; 1)
		
		$g:=SVG_New_group($root)
		SVG_SET_FILL_BRUSH($g; "orange")
		$textAreaRef:=SVG_New_textArea($g; "Hello World!"; 40; 40; 360; 360; "arial"; 120; Plain:K14:1; Align center:K42:3)
		
		SVG_SET_FILTER($textAreaRef; "Offset")
		
		
		<>pict:=SVG_Export_to_picture($root)
		
End case 
