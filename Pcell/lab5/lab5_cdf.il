let( ( lib cell view libId cellId cdfId )
   lib="TestSkill"
   cell="pcell5"
   view="layout"

   unless( ddGetObj(lib cell view)
      dbOpenCellViewByType(lib cell view "maskLayout" "w")
   ) ;unless

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
       ?callback       "CCScheckParamValue5('l)"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "w"
       ?prompt         "w"
       ?defValue       0.2
       ?type           "float"
       ?callback       "CCScheckParamValue5('w)"
   ) ;cdfCreateParam

    cdfSaveCDF( cdfId )
) ;let
