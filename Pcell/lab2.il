;   Description   : Program to create a pcell that consists of a single rectangle with three parameters ‘w’, ‘l’ and 'layer'.

pcDefinePCell(
   list( ddGetObj("TestSkill") "pcell2" "layout")
   list((w 0.2) (l 0.1) (layer "MET1")) 
   let( (cv)
      cv=pcCellView
      dbCreateRect(cv list(layer "drawing") list(0:0 w:l))
   ) ;let
) ;pcDefineCell
