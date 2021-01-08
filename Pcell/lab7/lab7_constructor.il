procedure( CCScreatePcell7(cv w l)
   let( (drainRod sourceRod bodyRod gateRod drainMetRod sourceMetRod)
      drainRod=rodCreateRect(
         ?cvId cv
         ?layer "DIFF"
         ?bBox list(0:0 0.48:w)
         ?netName "D"
         ?termName "D"
         ?termIOType "inputOutput"
         ?pin t
      ) ;rodCreateRect

      sourceRod=rodCreateRect(
         ?cvId cv
         ?layer "DIFF"
         ?bBox list(0:0 0.48:w)
         ?netName "S"
         ?termName "S"
         ?termIOType "inputOutput"
         ?pin t
      ) ;rodCreateRect

      bodyRod=rodCreateRect(
         ?cvId cv
         ?layer "DIFF"
         ?bBox list(0:0 l:w)
      ) ;rodCreateRect

      gateRod=rodCreateRect(
         ?cvId cv
         ?layer "POLY1"
         ?bBox list(0:0 l:(w+0.44))
      ) ;rodCreateRect

dist = 0
i = 0
while(dist < (w-0.2)
	dist = dist + 0.22 + 0.31
	i = i+1
     )


arrayOfDiffCon0  = rodCreateRect( ?cvId cv
				  ?name "arrayOfDiffCon0" 
				  ?layer "CONT" 
				  ?width 0.22
				  ?length 0.22
            			  ?elementsX 1 
                                  ?elementsY i 
				  ?spaceY 0.225 )

arrayOfDiffCon1  = rodCreateRect( ?cvId cv
				  ?name "arrayOfDiffCon1" 
				  ?layer "CONT" 
				  ?width 0.22
				  ?length 0.22
            			  ?elementsX 1 
                                  ?elementsY i 
				  ?spaceY 0.225 )

      nimpRod=rodCreateRect(
         ?cvId cv
         ?layer "NIMP"
         ?bBox list(0:0 (1.48+l):(w+0.70))
      ) ;rodCreateRect

      drainMetRod=rodCreateRect(
         ?cvId cv
         ?layer "MET1"
         ?bBox list(0:0 0.34:(w-0.08))
         ?netName "D"
         ?pin t
      ) ;rodCreateRect

      sourceMetRod=rodCreateRect(
         ?cvId cv
         ?layer "MET1"
         ?bBox list(0:0 0.34:(w-0.08))
         ?netName "S"
         ?pin t
      ) ;rodCreateRect

      rodAlign(
         ?alignObj drainRod
         ?alignHandle "lowerRight"
         ?refObj bodyRod
         ?refHandle "lowerLeft"
      ) ;rodAlign

      rodAlign(
         ?alignObj sourceRod
         ?alignHandle "lowerLeft"
         ?refObj bodyRod
         ?refHandle "lowerRight"
      ) ;rodAlign

      rodAlign(
         ?alignObj gateRod
         ?alignHandle "centerCenter"
         ?refObj bodyRod
         ?refHandle "centerCenter"
      ) ;rodAlign

      rodAlign(
         ?alignObj nimpRod
         ?alignHandle "centerCenter"
         ?refObj gateRod
         ?refHandle "centerCenter"
      ) ;rodAlign

      rodAlign(
         ?alignObj drainMetRod
         ?alignHandle "centerCenter"
         ?refObj drainRod
         ?refHandle "centerCenter"
      ) ;rodAlign

      rodAlign(
         ?alignObj sourceMetRod
         ?alignHandle "centerCenter"
         ?refObj sourceRod
         ?refHandle "centerCenter"
      ) ;rodAlign

for(j 1 i
	contName0 = sprintf(nil "arrayOfDiffCon0.%d" j)
	rodAlign(
         ?alignObj rodGetObj(contName0 cv)
         ?alignHandle "lowerCenter"
         ?refObj drainMetRod
         ?refHandle "lowerCenter"
         ?xSep 0.0
         ?ySep (0.06 + 0.53*(j-1))
        ) ;rodAlign
      
      contName1 = sprintf(nil "arrayOfDiffCon1.%d" j)
      rodAlign(
         ?alignObj rodGetObj(contName1 cv)
         ?alignHandle "lowerCenter"
         ?refObj sourceMetRod
         ?refHandle "lowerCenter"
         ?xSep 0.0
         ?ySep (0.06 + 0.53*(j-1))
      ) ;rodAlign
   );for

   ) ;let
) ;procedure

      
