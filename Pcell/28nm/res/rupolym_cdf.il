let( ( lib cell view libId cellId cdfId )
   lib="myskill"
   cell="myres"
   view="layout"

   unless( ddGetObj(lib cell view)
      dbOpenCellViewByType(lib cell view "maskLayout" "w")
   ) ;unless

   unless( cellId=ddGetObj(lib cell) error("Could not get cell %s." cell))
   when( cdfId=cdfGetBaseCellCDF(cellId) cdfDeleteCDF(cdfId))
   cdfId=cdfCreateBaseCellCDF(cellId)

   cdfCreateParam( cdfId
       ?name           "l"
       ?prompt         "l"
       ?defValue       10
       ?type           "float"
       ?callback       "CCScheckParamValue5('l)"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "w"
       ?prompt         "w"
       ?defValue       2
       ?type           "float"
       ?callback       "CCScheckParamValue5('w)"
   ) ;cdfCreateParam

    cdfSaveCDF( cdfId )
) ;let

