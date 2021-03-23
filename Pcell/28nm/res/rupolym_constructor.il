procedure( CCScreatePcell1(cv w l)
   let( (polyRod ppRod rpoRod pmRod rpdmyRod rhRod polydmRod t1MetRod t2MetRod)
      rpdmyRod=rodCreateRect(
         ?cvId cv
         ?layer "RPDMY"
         ?bBox list(0:0 l:w)
      ) ;rodCreateRect

      polyRod=rodCreateRect(
         ?cvId cv
         ?layer "PO"
         ?bBox list(-0.18:0 (l+0.18):w)
      ) ;rodCreateRect

      ppRod=rodCreateRect(
         ?cvId cv
         ?layer "PP"
         ?bBox list((-0.245):(-0.375) (l+0.245):(w+0.375))
      ) ;rodCreateRect

      pmRod=rodCreateRect(
         ?cvId cv
         ?layer list("PM" "drawing1")
         ?bBox list((-0.23):(-0.36) (l+0.23):(w+0.36))
      ) ;rodCreateRect

      rhRod=rodCreateRect(
         ?cvId cv
         ?layer list("RH" "drawing2")
         ?bBox list((-0.37):(-0.53) (l+0.37):(w+0.53))
      ) ;rodCreateRect

      polydm1Rod=rodCreateRect(
         ?cvId cv
         ?layer list("PO" "dummy1")
         ?bBox list((-0.18):(-0.31) (l+0.18):(-0.16))
      ) ;rodCreateRect

      polydm2Rod=rodCreateRect(
         ?cvId cv
         ?layer list("PO" "dummy1")
         ?bBox list((-0.18):(w+0.16) (l+0.18):(w+0.31))
      ) ;rodCreateRect

      rpoRod=rodCreateRect(
         ?cvId cv
         ?layer "RPO"
         ?bBox list(0:(-0.53) l:(w+0.53))
      ) ;rodCreateRect


arrayOfCon0  = rodCreateRect( ?cvId cv
				  ?name "arrayOfCon0" 
				  ?layer "CO" 
				  ?width 0.04
				  ?length 0.04
            			  ?elementsX 1 
                                  ?elementsY 18 
				  ?spaceY 0.07 )

arrayOfCon1  = rodCreateRect( ?cvId cv
				  ?name "arrayOfCon1" 
				  ?layer "CO" 
				  ?width 0.04
				  ?length 0.04
            			  ?elementsX 1 
                                  ?elementsY 18 
				  ?spaceY 0.07 )

      t1MetRod=rodCreateRect(
         ?cvId cv
         ?layer "M1"
         ?bBox list(0:0 0.05:1.97)
         ?netName "t1"
         ?pin t
      ) ;rodCreateRect

      t2MetRod=rodCreateRect(
         ?cvId cv
         ?layer "M1"
         ?bBox list(0:0 0.05:1.97)
         ?netName "t1"
         ?pin t
      ) ;rodCreateRect

      rodAlign(
         ?alignObj t1MetRod
         ?alignHandle "lowerLeft"
         ?refObj polyRod
         ?refHandle "lowerLeft"
         ?xSep 0.015
         ?ySep 0.015
      ) ;rodAlign

      rodAlign(
         ?alignObj t2MetRod
         ?alignHandle "lowerRight"
         ?refObj polyRod
         ?refHandle "lowerRight"
         ?xSep -0.015
         ?ySep 0.015
      ) ;rodAlign

a="arrayOfCon0."
b="arrayOfCon1."
for(i 0 18 c=pcExprToString(i+1) d=strcat(a c) e=strcat(b c)

      rodAlign(
         ?alignObj rodGetObj(d cv)
         ?alignHandle "lowerCenter"
         ?refObj t1MetRod
         ?refHandle "lowerCenter"
         ?xSep 0.0
         ?ySep (0.03 + (i*(0.04+0.07)))
      ) ;rodAlign


      rodAlign(
         ?alignObj rodGetObj(e cv)
         ?alignHandle "lowerCenter"
         ?refObj t2MetRod
         ?refHandle "lowerCenter"
         ?xSep 0.0
         ?ySep (0.03 + (i*(0.04+0.07)))
      ) ;rodAlign
   ) ;for
   ) ;let
) ;procedure
