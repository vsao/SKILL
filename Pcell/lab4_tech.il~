lib="TestSkill"
cell="pcell4"
cv=dbOpenCellViewByType(lib cell "layout")
tf=techGetTechFile(cv)
cdf=cdfGetBaseCellCDF(ddGetObj(lib cell))

pcDefinePCell( 
   list( ddGetObj(lib) cell "layout")
   list(
      (w "float" cdf->w->defValue)
      (l "float" cdf->l->defValue)
      (layer "string" cdf->layer->defValue)
      (spacingM1 "float" techGetSpacingRule(tf "minSpacing" "MET1"))
   ) ;list
   let( (cv)
      cv=pcCellView
      CCScreatePcell4(cv w l layer)
   ) ;let
) ;pcDefinePCell

lib=nil
cell=nil
cdf=nil
tf=nil
