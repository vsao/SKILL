;   Description   : This code will generate labels from pins
;   How to Run    : In CIW load the file Pin2Label.il




procedure( SITpin2label( libName cellName viewName)
	prog( ()
	   cv = dbOpenCellViewByType(libName cellName viewName "" "a")
	   foreach(term cv~>terminals                  ; For loop with variable as terminals 
		p1=car(term~>pins)                     ; Select the 1st pin
		f1=car(p1~>figs)                       ; f1 is the figure of the selected pin 
		unless(f1~>children                    ; when no attached text Display to the figure
			disp=dbCreateTextDisplay(term term '(text drawing) t centerBox(f1~>bBox) "centerCenter" "R0" "roman" 0.5 nil nil t nil t "name" nil)  ;Creates the text display for labels and place it on the pins with properties given
			disp~>parent=p1~>fig           ; makes the text moving with the rect pin
			)
		  )
	 return(t)
	 ) ; end of prog
) ; end of procedure

SITpin2label("TestSkill" "Inverter1" "layout")        ; Funcution call with the arguments
