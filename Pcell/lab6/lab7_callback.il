procedure( CCScheckParamValue7(param)
   let( (paramError value)
      paramError=nil
      value=cdfFindParamByName(cdfgData symbolToString(param))->value
      case( param
         (w
            cond(
               (value<0.2
                  paramError=t
                  value=0.2
               ) ;0.2
                (value>2.0
                  paramError=t
                  value=2.0
               ) ;2.0
            ) ;cond
         ) ;w
         (l
            cond(
               (value<0.18
                  paramError=t
                  value=0.18
               ) ;0.18
                (value>0.5
                  paramError=t
                  value=0.5
               ) ;0.5
            ) ;cond
         ) ;l
      ) ;case
            
      cdfFindParamByName(cdfgData symbolToString(param))->value=value
      when(paramError
         case( param
            (w error("Value of w must be within the range [0.2u,2.0u]"))
            (l error("Value of l must be within the range [0.18u,0.5u]"))
         ) ;case
      ) ;when
   ) ;let
) ;procedure
