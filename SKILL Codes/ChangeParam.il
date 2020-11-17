;   Description   : This code will find an instance CDF parameter
;                   for a given instance cellName and change to a new value
;
;   How to Run    : In CIW load the file ChangeParam.il:
;                   e.g. load("ChangeParam.il")
;                   SITchangeParam("testLib" "testCell" "schematic" "cap" "model" "CAP")
;                   where testLib   - library name
;                   testCell  - cell name
;                   schematic - view name
;                   cap        - instance cellName
;                   model     - parameter name
;                   CAP        - new value
;
; **NOTE** This change of parameter will not change the layout or netlist output
; until CDF callbacks are executed.
;
procedure( SITchangeParam( libName cellName viewName findInstCellName paramName newValue)
  prog( ()
   schView = dbOpenCellViewByType(libName cellName viewName "" "a")				; open cell view; 
   foreach( instance schView~>instances								; for each instances (cellview~>instances)
	instCellName = instance~>cellName
	if(instCellName == findInstCellName then 						; if instance cellname matches given name (findInstCellName)
		 foreach(parameter cdfGetInstCDF(instance)~>parameters 				; for each CDF parameter; cdfGetInstCDF(instance)~>parameters
			if(parameter~>name == paramName then					; if parameter~>name == paramName
				parameter~>value = newValue      				; param~>value = newValue
				dbSave(schView)              					; save schematic 
				dbClose(schView)             					; close schematic
			   )
			)
	   )
	  )			
  return(t)
  ) 												; prog
)												; end procedure SITchangeParam
