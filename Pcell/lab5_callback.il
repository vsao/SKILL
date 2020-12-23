procedure( CCScheckParamValue5(param)
   let( (paramError value)
      paramError=nil
      value=cdfFindParamByName(cdfgData symbolToString(param))->value
      print("vishal1")
      case( param
         (w
            cond(
               (value<0.2
                  paramError=t
                  value=0.2
                  print("vishal2")
               ) ;0.2
                (value>2.0
                  paramError=t
                  value=2.0
                  print("vishal3")
               ) ;2.0
            ) ;cond
         ) ;w
         (l
            cond(
               (value<0.1
                  paramError=t
                  value=0.1
                  print("vishal3")
               ) ;0.1
                (value>0.5
                  paramError=t
                  value=0.5
                  print("vishal4")
               ) ;0.5
            ) ;cond
         ) ;l
      ) ;case
            
      cdfFindParamByName(cdfgData symbolToString(param))->value=value
      when(paramError
         print("vishal5")
         case( param
            (w error("Value of w must be within the range [0.2u,2.0u]"))
            (l error("Value of l must be within the range [0.1u,0.5u]"))
            print("vishal6")
         ) ;case
      ) ;when
   ) ;let
) ;procedure
