cv=geGetWindowCellView()                       ;Select the current cell view window
foreach(term cv~>terminals                     ;For loop with variable as terminals 
	p1=car(term~>pins)                     ;let supose term has only one pin
	f1=car(p1~>figs)                       ;let supose p1 has only objType "rect" 
	unless(f1~>children                    ;when no attached text Display, let us create one (not a label, even if similar)
		disp=dbCreateTextDisplay( term term '(text drawing) t centerBox(f1~>bBox) "centerCenter" "R0" "roman" 0.5 nil nil t nil t "name" nil)
		disp~>parent=p1~>fig           ;makes the text moving with the rect pin
		                               ; and now f1~>children is not nil => so a can re-run the script
		)
	)
