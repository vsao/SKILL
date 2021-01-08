procedure( CCScheckParamValue8(param)
   let( (paramError value)
      paramError=nil
      value=cdfFindParamByName(cdfgData symbolToString(param))->value
      case( param
         (w
            cond(
               (value<0.1
                  paramError=t
                  value=0.1
               ) ;0.1
                (value>10.0
                  paramError=t
                  value=10.0
               ) ;10.0
            ) ;cond
         ) ;w
         (l
            cond(
               (value<0.1
                  paramError=t
                  value=0.1
               ) ;0.1
                (value>50.0
                  paramError=t
                  value=50.0
               ) ;50.0
            ) ;cond
         ) ;l
      ) ;case
            
      cdfFindParamByName(cdfgData symbolToString(param))->value=value
      when(paramError
         case( param
            (w error("Value of w must be within the range [0.1u,10.0u]"))
            (l error("Value of l must be within the range [0.1u,50.0u]"))
         ) ;case
      ) ;when
   ) ;let
) ;procedure
