# Overview

Parameterized cells (PCells) is powerful way of creating automation using SKILL.

You can create PCells by:
- SKILL programming
- Using [PCell Designer](https://www.cadence.com/content/dam/cadence-www/global/en_US/documents/services/cadence-vcad-pcell-ds.pdf)
- PCell menu from GUI but this is obsolete

Main principles of PCell SKILL coding:
- Using the pcDefinePCell function
- Creating PCell constructor functions
- Creating CDF parameters and callbacks
- Encrypting PCell codes

Coding is necessity for CAD engineers but can also enable to circuit designers to do complex activities efficiently.
For example:
Instead of drawing shapes for an in-house custom device and risk re-doing the whole device if any shape dimensions need to be changed, the layout designer can simply code it as a PCell and easily change the device layout as the parameters are updated.
Circuit designers can code schematic PCells that can change pin configurations as needed.
Parasitic techfile developers can code parallel line test structures as PCells so that the width and spacing of the test structures can be easily modified.

As basic knowledge of SKILL programming is required to follow this guide.

# PCell Supermaster and Submaster

The following points illustrate the concept of a PCell supermaster and submaster:

![PCell Compiler Flow](images/PCellCompiler.png)

When you compile a SKILL PCell code (that is, load a SKILL file with the call of pcDefinePCell in CIW), a master/superMaster cell is created for it. The compiler attaches the compiled code to the master cell. The master cell contains the SKILL code of the cell’s definition along with the cell’s parameters and their default values.

A **SuperMaster** is the cell which is created with default parameters in the `Lib -> Cell -> View` format after the code is compiled and loaded. It resides on the hard disk as a `layout.oa` file.

If one or more parameters are modified, a copy of the supermaster with the modified parameters is created in the virtual memory. This is termed as a **submaster**. One submaster is created for every unique parameter combination.
Submasters are created in memory and are available for use by all cellViews. When parameters on an instance are modified, Virtuoso first checks if there is an existing submaster that contains the same unique set of modified parameters. If such a submaster is available, it will be reused. Otherwise, a new submaster will be created.

![SubMaster](images/subMaster.png)

Submaster cell 1 represents a unique parameter combination of `L=10u` and `W=20u`. Instances I1 and I2 point to the same submaster. Similarly, submaster cell 2 is another unique parameter combination of `L=20u` and `W=30u`. Instances I3, I4, and I5 point to the same submaster.

# Basic PCell

Regardless of the complexity, all SKILL PCell code starts with the `pcDefinePCell` command, as shown below. Each call to `pcDefinePCell` creates one PCell master/superMaster cellview. You can create one source code file for each PCell or define several PCells in one file.

## lab1.il
```skill
;   Description   : Program to create a pcell that consists of a single rectangle with two parameters ‘w’ and ‘l’.

pcDefinePCell(
   list( ddGetObj("TestSkill") "pcell1" "layout")
   list((w 0.2) (l 0.1)) 
   let( (cv)
      cv=pcCellView
      dbCreateRect(cv list("MET1" "drawing") list(0:0 w:l))
   ) ;let
) ;pcDefineCell
```
The above SKILL code defines a simple PCell with the following features:
- PCell will be created in TestSkill/pcell1/layout.
- It consists of only a single rectangle.
- The Properties form of the PCell contains two parameters, w and l, which can be used to modify the size of the rectangle.

```
list( ddGetObj("TestSkill") "pcell1" "layout")
```
- This is a fixed syntax. Specify string inputs for library, cell, and view arguments. The `ddGetObj` command is only required for the library name. The "TestSkill" library should have already been pre-created in Library Manager.
```
list((w 0.2) (l 0.1))
```
- This is the list of PCell formal parameters and their default values.
```
let( (cv)
```
- The "let" command allows the declaration of local variables. As in all programming languages, usage of global variables should be minimized.
```
cv=pcCellView
```
- pcCellView is an internal variable automatically created by `pcDefinePCell`. pcCellView contains the dbId (database identification) of the cell you are creating. Assigning pcCellView to "cv" is to simply shorten the name of the variable so that it can be used more conveniently.
```
dbCreateRect(cv list("MET1" "drawing") list(0:0 w:l))
```
- PCell parameters `w` and `l` are used in the dbCreateRect command so that the PCell layout can be modified according to the values defined in the Properties form. bBox (bounding box) of the rectangle will be defined by the coordinates 0:0 (lowerLeft) and w:l (upperRight).

The codes can be used as follows:
- Start Virtuoso:
```bash
Linux> xt18-618
Linux> cdproj
Linux> cadstart
```
Compile the PCell by loading the SKILL script in CIW:
```
load("./scripts/lab1.il")
```
The following messages appear in CIW and the PCell myCell1 layout is generated in the myLib library.
```
Generating Pcell for 'pcell1 layout'.
t
```
The newly generated PCell can be tested as follows:

Click on  `CIW: File > Open > Cellview`, and open the cell named `lab` in myLib library. Place an instance of TestSkill/pcell1/layout in it. Modify w and l in the Properties form and note the changes in the PCell layout. For example, change w from 0.2 to 0.3.

The next step is to create CDF information for the PCell. Advantages of creating CDF include:
- Allows more variety in the input parameters (for example, instead of just a numeric field, radio fields and cyclic fields can also be used)
- Allows the specification of callbacks for each parameter
- Callback is a SKILL procedure which can do error checking, etc. when a parameter is modified
- Allows specification of default values for each parameter

Although the creation of CDF can be done using the Edit CDF form with `CIW: Tools > CDF > Edit`, this is usually done using SKILL commands in batch mode because of the large number of CDF parameters to be created.

A typical SKILL script for creating CDF is as shown below. It can be used as follows:
- Load the script in CIW:
```
load("./scripts/lab1_cdf.il")
```
## lab1_cdf.il
```
;   Description   : Program to create cdf information for the pcell.

let( ( lib cell libId cellId cdfId )
   lib="TestSkill"
   cell="pcell1"
   unless( cellId=ddGetObj(lib cell) error("Could not get cell %s." cell))
   when( cdfId=cdfGetBaseCellCDF(cellId) cdfDeleteCDF(cdfId))
   cdfId=cdfCreateBaseCellCDF(cellId)

   cdfCreateParam( cdfId
       ?name           "l"
       ?prompt         "l"
       ?defValue       0.1
       ?type           "float"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "w"
       ?prompt         "w"
       ?defValue       0.2
       ?type           "float"
   ) ;cdfCreateParam

    cdfSaveCDF( cdfId )
) ;let
```
Go to CIW: `Tools > CDF> Edit` and display CDF information for pcell1. It should now have two parameters.
This completes the creation of the basic PCell.

![CDF Edit](images/cdfEdit.png)

# Adding Parameters to a PCell

Additional parameters can be easily added to the basic PCell by modifying the parameter line in the previous code. In the earlier SKILL code example (lab1.il), the rectangle uses a fixed layer (“MET1” “drawing”).
In the following SKILL codes, the layer of the rectangle has been parameterized so that it can be modified in the Properties form.

## lab2.il
```
;   Description   : Program to create a pcell that consists of a single rectangle with three parameters ‘w’, ‘l’ and 'layer'.

pcDefinePCell(
   list( ddGetObj("TestSkill") "pcell2" "layout")
   list((w 0.2) (l 0.1) (layer "MET1")) 
   let( (cv)
      cv=pcCellView
      dbCreateRect(cv list(layer "drawing") list(0:0 w:l))
   ) ;let
) ;pcDefineCell
```
The corresponding CDF creation script is:

## lab2_cdf.il
```
;   Description   : Program to create cdf information for the pcell.

let( ( lib cell libId cellId cdfId )
   lib="TestSkill"
   cell="pcell2"
   unless( cellId=ddGetObj(lib cell) error("Could not get cell %s." cell))
   when( cdfId=cdfGetBaseCellCDF(cellId) cdfDeleteCDF(cdfId))
   cdfId=cdfCreateBaseCellCDF(cellId)

   cdfCreateParam( cdfId
       ?name           "layer"
       ?prompt         "layer"
       ?defValue       "MET1"
       ?type           "string"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "l"
       ?prompt         "l"
       ?defValue       0.1
       ?type           "float"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
       ?name           "w"
       ?prompt         "w"
       ?defValue       0.2
       ?type           "float"
   ) ;cdfCreateParam

    cdfSaveCDF( cdfId )
) ;let
```
The new PCell and CDF codes can be used as follows:
Load the following scripts in CIW:
```
load("./scripts/lab2.il")
load("./scripts/lab2_cdf.il")
```
Create or open the layout cell "lab2" and place an instance of pcell2 in it. Select the instance, open the Edit Instance Properties form, and note the addition of the "layer" parameter.

![Edit Instance Property](images/editInstProp.png)

A simple improvement to the PCell is to enhance the CDF parameters so that they allow users to input the values easily.

![CDF Modification](images/CDFmod.jpg)

For example, instead of using a simple string field, which is prone to typos from users, a cyclic field can be used for layer input. This can be done by modifying the CDF codes as shown below and reloading the lab2_cdf.il file in CIW.


# Constructor Functions

Instead of putting all the required codes within the pcDefinePCell command, it is more common to use a SKILL procedure within pcDefinePCell to create the required shapes. This SKILL procedure is termed as a *constructor/wrapper* function because it "constructs" or “wraps” the body of the SKILL PCell. This is also referred to as PCell code encapsulation.

## lab3_constructor.il
```
procedure( CCScreatePcell3(cv w l layer)
   let( ()
  	dbCreateRect(cv list(layer "drawing") list(0:0 w:l))
   ) ;let
) ;procedure
```
## lab3.il
```
pcDefinePCell(
    list(ddGetObj("TestSkill") "pcell3" "layout")
    list((w 0.2) (l 0.1) (layer "MET1"))
    let((cv)
     	cv=pcCellView
     	CCScreatePcell3(cv w l layer)
   	)
)    
```
## lab3_cdf.il
```
let( ( lib cell libId cellId cdfId )
   lib="TestSkill"
   cell="pcell3"

   unless( cellId=ddGetObj(lib cell) error("Could not get cell %s." cell))
   when( cdfId=cdfGetBaseCellCDF(cellId) cdfDeleteCDF(cdfId))
   cdfId=cdfCreateBaseCellCDF(cellId)

   cdfCreateParam( cdfId
   	?name       	"layer"
   	?prompt     	"layer"
   	?defValue   	"MET1"
   	?choices    	'("MET1" "MET2" "MET3")
   	?type       	"cyclic"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
   	?name       	"l"
   	?prompt     	"l"
   	?defValue   	0.1
   	?type       	"float"
   ) ;cdfCreateParam

   cdfCreateParam( cdfId
   	?name       	"w"
   	?prompt     	"w"
   	?defValue   	0.2
   	?type       	"float"
   ) ;cdfCreateParam

	cdfSaveCDF( cdfId )
) ;let
```

Advantages of using constructor functions include:
- Modularize the codes and makes debugging easier
- Allows debugging for the constructor function to be done independently from the PCell itself
- Avoids repeated compilation of the PCell which can take significant time for complex PCells in advanced-node PDKs (The developer can now simply reload the constructor function which is usually placed in a separate file.)

The file containing the constructor functions can be encrypted as a context file to protect the PCell codes.

The new codes with constructor function can be tested by executing the following commands in CIW:
```
load("./scripts/lab3_constructor.il")
load("./scripts/lab3_cdf.il")
load("./scripts/lab3.il")
```
Next, create or open the layout cell "lab3" and place an instance of myCell3 to test it.

The file containing the constructor functions should be loaded first so that they can be used in the subsequent PCell compilation. Otherwise, there will be a PCell evaluation error during compilation.

As the codes that create the PCell are now separated from the pcDefinePCell function and hence, are not compiled directly into the PCell layout, they need to be always loaded once before the PCell can be used.

# CDF Callback Procedure
## lab5_constructor.il
```
procedure( CCScreatePcell5(cv w l layer)
   let( ()
      dbCreateRect(cv list(layer "drawing") list(0:0 w:l))
   ) ;let
) ;procedure
```

## lab5_callback.il
```
procedure( CCScheckParamValue5(param)
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
               (value<0.1
                  paramError=t
                  value=0.1
               ) ;0.1
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
            (l error("Value of l must be within the range [0.1u,0.5u]"))
         ) ;case
      ) ;when
   ) ;let
) ;procedure
```

- ```cdfFindParamByName(g_cdfDataId t_name)```: Returns the parameter ID for the specified parameter name on the specified CDF description, if it exists. If not, it returns nil.  
- ```symbolToString(s_symbolName)```: It converts a symbol to a string of the same name.  

## lab5_cdf.il
```
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
```

## lab5.il
```
lib="TestSkill"
cell="pcell5"
cdf=cdfGetBaseCellCDF(ddGetObj(lib cell))

pcDefinePCell( 
   list( ddGetObj(lib) cell "layout")
   list(
      (w "float" cdf->w->defValue)
      (l "float" cdf->l->defValue)
      (layer "string" cdf->layer->defValue)
   ) ;list
   let( (cv)
      cv=pcCellView
      CCScreatePcell5(cv w l layer)
   ) ;let
) ;pcDefinePCell

lib=nil
cell=nil
cdf=nil 
```
Load the files in CIW in the following order:
```
load("./constructor.il")
load("./callback.il")
load("./cdf.il")
load("./pcell.il")
```
Next, create or open the layout cell "lab5" and place an instance of pcell5 to test it. callback procedure is called whenever user places an instance of pcell5 and trys to change the w, l value of the cell. The callback procedure sets the minimum and maximum value of the w and l parameters. In this case value of w is in between 0.2 to 2, whereas l can be in between 0.1 to 1. Change w, l parameter and check the whether w and l values are in between the desired range.

 
