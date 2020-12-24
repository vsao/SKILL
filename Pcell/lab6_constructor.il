procedure( CCScreatePcell6(cv w l)
   let( (drainRod sourceRod bodyRod gateRod drainMetRod sourceMetRod)
      drainRod=rodCreateRect(
         ?cvId cv
         ?layer "DIFF"
         ?bBox list(0:0 l:w)
         ?netName "D"
         ?termName "D"
         ?termIOType "inputOutput"
         ?pin t
      ) ;rodCreateRect

      sourceRod=rodCreateRect(
         ?cvId cv
         ?layer "DIFF"
         ?bBox list(0:0 l:w)
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
         ?bBox list(0:0 l:w*1.4)
      ) ;rodCreateRect

      contRod1=rodCreateRect(
         ?cvId cv
         ?layer "CONT"
         ?bBox list(0:0 0.05:0.05)
      ) ;rodCreateRect

      contRod2=rodCreateRect(
         ?cvId cv
         ?layer "CONT"
         ?bBox list(0:0 0.05:0.05)
      ) ;rodCreateRect

      nimpRod=rodCreateRect(
         ?cvId cv
         ?layer "NIMP"
         ?bBox list(0:0 3.6*l:w*1.2)
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

      drainMetRod=rodCreateRect(
         ?cvId cv
         ?layer "MET1"
         ?bBox list(0:0 l*0.8:w*0.8)
         ?netName "D"
         ?pin t
      ) ;rodCreateRect

      sourceMetRod=rodCreateRect(
         ?cvId cv
         ?layer "MET1"
         ?bBox list(0:0 l*0.8:w*0.8)
         ?netName "S"
         ?pin t
      ) ;rodCreateRect

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

      rodAlign(
         ?alignObj contRod1
         ?alignHandle "centerCenter"
         ?refObj drainMetRod
         ?refHandle "centerCenter"
      ) ;rodAlign

      rodAlign(
         ?alignObj contRod2
         ?alignHandle "centerCenter"
         ?refObj sourceMetRod
         ?refHandle "centerCenter"
      ) ;rodAlign

   ) ;let
) ;procedure

      
