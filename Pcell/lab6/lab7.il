lib="TestSkill"
cell="pcell7"
cdf=cdfGetBaseCellCDF(ddGetObj(lib cell))

pcDefinePCell(
   list(ddGetObj(lib) cell "layout")
   list(
      (w "float" cdf->w->defValue)
      (l "float" cdf->l->defValue)
   ) ;list
   let( (cv)
      cv=pcCellView
      CCScreatePcell7(cv w l)
   ) ;let
) ;pcDefinePCell

lib=nil
cell=nil
cdf=nil
