lib="TestSkill"
cell="pcell5"
cdf=cdfGetBaseCellCDF(ddGetObj(lib cell))

pcDefinePCell( 
   list( ddGetObj(lib) cell "layout")
   list(
      (w "float" cdf->w->defValue)
      (l "float" cdf->l->defValue)
      (layer "string" cdf->layer->defValue)
   ) ;list
   let( (cv)
      cv=pcCellView
      CCScreatePcell5(cv w l layer)
   ) ;let
) ;pcDefinePCell

lib=nil
cell=nil
cdf=nil
