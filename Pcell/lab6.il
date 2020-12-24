lib="TestSkill"
cell="pcell6"
cdf=cdfGetBaseCellCDF(ddGetObj(lib cell))

pcDefinePCell(
   list(ddGetObj(lib) cell "layout")
   list(
      (w "float" cdf->w->defValue)
      (l "float" cdf->l->defValue)
   ) ;list
   let( (cv)
      cv=pcCellView
      CCScreatePcell6(cv w l)
   ) ;let
) ;pcDefinePCell

lib=nil
cell=nil
cdf=nil
