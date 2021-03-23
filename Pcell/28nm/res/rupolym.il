lib="myskill"
cell="myres"
cdf=cdfGetBaseCellCDF(ddGetObj(lib cell))

pcDefinePCell(
   list(ddGetObj(lib) cell "layout")
   list(
      (w "float" cdf->w->defValue)
      (l "float" cdf->l->defValue)
   ) ;list
   let( (cv)
      cv=pcCellView
      CCScreatePcell1(cv w l)
   ) ;let
) ;pcDefinePCell

lib=nil
cell=nil
cdf=nil
