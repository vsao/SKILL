let( ( lib cell view libId cellId cdfId )
   lib="TestSkill"
   cell="pcell7"
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
       ?defValue       0.18
       ?type           "float"
       ?callback       "CCScheckParamValue7('l)"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "w"
       ?prompt         "w"
       ?defValue       2.0
       ?type           "float"
       ?callback       "CCScheckParamValue7('w)"
   ) ;cdfCreateParam

    cdfSaveCDF( cdfId )
) ;let
