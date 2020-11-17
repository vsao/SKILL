;   Description   : This code will generate layout of schematic views present inside the Library given by user
;
;   How to Run      : In CIW load the file GenLayout.il:
;            	      e.g. load("GenLayout.il")
;                     SITautoGenLib("testlib")
;                     where testLib   - library name

procedure( SITautoGenCell(myLibName myCellName cellViewName @optional (view "mylayout"))
   prog( ()
	schCount = 0								                    ; Initialising a count variable
	     
	foreach(cellView cellViewName
		if(cellView == "schematic"                                                          ; if schematic view exits
		   then
                   	++schCount                                                                  ; then increament count variable
		  )                                                                                 ; endif
		   
		if(cellView == "mylayout"                                                           ; if layout view("mylayout") exits 
		   then
		   	ddDeleteObj(ddGetObj(myLibName myCellName "mylayout"))                      ; then delete it 
		  )                                                                                 ; endif
		)                                                                                   ; endforeach

	if(schCount==1                                                                              ; if schematic exists then
          then
	  	schView = dbOpenCellViewByType(myLibName myCellName "schematic" "" "a")                    
	  	lxGenFromSource(schView ?layViewName "Newlayout")                                   ; generate layout from source lxGenFromSource()
	  	layView = dbOpenCellViewByType(myLibName myCellName "Newlayout" "" "a")             ; Open layout view
		foreach(term layView~>terminals
			pin = car(term~>pins)
			figure = car(pin~>figs)
			figure~>lpp = list("MET1" "pin")
			unless(figure~>children                                                     ; when no attached text Display, let us create one (not a label, even if similar)
				disp=dbCreateTextDisplay( term term '(text drawing) t centerBox(figure~>bBox) "centerCenter" "R0" "roman" 0.5 nil nil t nil t "name" nil)
				disp~>parent=pin~>fig 
			      )
			)
	  	dbSave(layView)                                                                     ; save the layout
	  	dbClose(layView)                                                                    ; close the layout
	  	dbClose(schView)	                                                            ; close the schematic
	else
		println("Error: Schamatic view does not exist")                                     ; show the error if schematic view does not exist 
	  )                                                                                         ; endif 
      return(t)
   )                                                                                                ;prog
)                                                                                                   ;procedure

procedure( SITautoGenLib(myLib @optional (view "mylayout"))
   prog( ()
	libObj = ddGetObj(myLib)                                                                    ;get Library object ddGetObj()
        foreach(cell libObj~>cells                                                                  ;loop thought each cell LibObj~>cells
		myCellName=cell~>name
		cellViewName=cell~>views~>name
        	SITautoGenCell(myLib myCellName cellViewName)                                       ;SITautoGenCell()
		)
        return(t)
   )                                                                                                ;prog
)                                                                                                   ;procedure



