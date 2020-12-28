;   Description   : Program to create cdf information for the pcell.

let( ( lib cell libId cellId cdfId )
   lib="TestSkill"
   cell="pcell2"
   unless( cellId=ddGetObj(lib cell) error("Could not get cell %s." cell))
   when( cdfId=cdfGetBaseCellCDF(cellId) cdfDeleteCDF(cdfId))
   cdfId=cdfCreateBaseCellCDF(cellId)

   cdfCreateParam( cdfId
       ?name           "layer"
       ?prompt         "layer"
       ?defValue       "MET1"
       ?choices        '("MET1" "MET2" "MET3")
       ?type           "cyclic"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "l"
       ?prompt         "l"
       ?defValue       0.1
       ?type           "float"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "w"
       ?prompt         "w"
       ?defValue       0.2
       ?type           "float"
   ) ;cdfCreateParam

    cdfSaveCDF( cdfId )
) ;let
