lib="TestSkill"
cell="pcell8"
cdf=cdfGetBaseCellCDF(ddGetObj(lib cell))

pcDefinePCell(
   list(ddGetObj(lib) cell "layout")
   list(
      (w "float" cdf->w->defValue)
      (l "float" cdf->l->defValue) 
      (sep "float" cdf->sep->defValue)
      (botLay "string" cdf->botLay->defValue)
   ) ;list
   let( (cv)
      cv=pcCellView
      CCScreatePcell8(cv w l sep botLay)
   ) ;let
) ;pcDefinePCell

lib=nil
cell=nil
cdf=nil
