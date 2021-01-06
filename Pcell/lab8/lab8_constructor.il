procedure( CCScreatePcell8(cv w l sep botLay)
   let( (metNum midLay topLay)

      pcreMatchp("MET(\\d)" botLay)
      metNum=atoi(pcreSubstitute("\\1"))
      midLay=sprintf(nil "MET%d" metNum+1)
      topLay=sprintf(nil "MET%d" metNum+2)

      rodCreatePath(
         ?cvId cv
         ?layer midLay
         ?width w
         ?pts list(0:0 0:l)
         ?offsetSubPath list(
            list(?layer midLay ?width w ?sep sep+w)
            list(?layer midLay ?width w ?sep 2*(sep+w))
         ) ;list
      ) ;rodCreatePath
 
      rodCreateRect(
         ?cvId cv
         ?layer botLay
         ?bBox list(-2*(w+sep)-w/2.0:0 w/2.0:l)
      ) ;rodCreateRect

      rodCreateRect(
         ?cvId cv
         ?layer topLay
         ?bBox list(-2*(w+sep)-w/2.0:0 w/2.0:l)
      ) ;rodCreateRect
   ) ;let
) ;procedure

      
