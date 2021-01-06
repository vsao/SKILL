let( ( lib cell view libId cellId cdfId )
   lib="TestSkill"
   cell="pcell8"
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
       ?defValue       100.0
       ?type           "float"
       ?callback       "CCScheckParamValue8('l)"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "w"
       ?prompt         "w"
       ?defValue       1.0
       ?type           "float"
       ?callback       "CCScheckParamValue8('w)"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "sep"
       ?prompt         "Spacing"
       ?defValue       1.0
       ?type           "float"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "botLay"
       ?prompt         "Bottom Layer"
       ?defValue       "MET1"
       ?type           "cyclic"
       ?choices        '("MET1" "MET2" "MET3")
   ) ;cdfCreateParam

    cdfSaveCDF( cdfId )
) ;let
