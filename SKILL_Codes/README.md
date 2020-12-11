# SKILL Codes:
1. `ChangeParam.il` : This code will find an instance CDF parameter for a given instance cellName and change to a new value.
2. `Pin2Label.il`   : This code will generate labels from pins.
3. `GenLayout.il`   : This code will generate layout of schematic views present inside the Library given by user.
4. `lab1.il`        : Program to create a pcell that consists of a single rectangle with two parameters ‘w’ and ‘l’.
5. `lab1_cdf.il`    : Program to create cdf information for the pcell.

## SKILL Functions

### dbOpenCellViewByType
```
dbOpenCellViewByType(
  { gt_lib | nil }
  t_cellName
  lt_viewName
  [ t_viewTypeName
  [ t_mode
  [ d_contextCellView ] ] ]
)
```
- Description  
Opens a cellview.  
The cellview can be opened for read, append, write, or scratch mode. If you open the cellview for the read mode, the cellview must exist. if you open the cellview for other modes, the cellview is created if it does not exist.  
- Arguments  
  - `gt_lib | nil`: Specifies the ddId of a library, the name of a library t_lib, or nil. If it is nil, then a search is made for the library of context cellview d_contextCellView. If the name of a library is given, the library must exist in the libList.  
  - `t_cellName`: Specifies the cell name.  
  - `lt_viewName`: Specifies view name of a cell such as: schematic, layout.  
  - `t_viewTypeName`: Specifies the view type. If it is omitted or entered as nil or “*.cdb”, the cellview must exist.  
  - `t_mode`: Specifies the access mode to the cellview. The mode can be one of the following values:  
  ```
  r    Opens the cellview in read mode. The cellview must already exist.
  a    Opens the existing cellview in append mode. If the cellview does not exist, it is created.
  w    Opens the cellview in write mode. If the cellview does not exist, it is created. If the cellview already exists, its contents is truncated in virtual memory.
  s    Opens the existing cellview in scratch mode. If the cellview does not exist, it is created. A cellview opened in “s” modecannot be saved to disk using dbSave.
  wc   Same as “w,” except that the cellview is not created as the master. This mode creates the cellview even if there is already a master under the cell and view.
  wd   Same as “wc,” except that the context cellview must be specified. LibName is ignored if specified. The library is derived from the context cellview.
  ac   Same as “a” if the cellview already exists. If the cellview does not exist, this mode is the same as “wc” mode.
  ad   Same as “a” if the cellview already exists. If the cellview does not exist, this mode is the same as “wd” mode.
  sc   Same as “s” if the cellview already exists. If the cellview does not exist, this mode is the same is “wc” mode, except the cellview cannot be saved to disk.
  sd   Same as “s” if the cellview already exists. If the cellview does not exist, this mode is the same as “wd” mode, except the cellview cannot be saved to disk.
  ```
  - `d_contextCellView`: Specifies the context cellview. The context cellview specification is preserved for compatibility with earlier versions of the software.  

Examples  
1. If cell “cellA” with view “layout” exists in library “test,” open the cellview for read.  
```cellview = dbOpenCellViewByType(“test” "cellA" "layout")```  
2. Open cell “cellA” with view “layout” in library “test” for "append" mode. Create the cellview if it does not exist.  
```cellview = dbOpenCellViewByType("test" "cellA" "layout" "maskLayout" "a")```  
3. Open cell "cellA" with view "layout" in library "test" for "append" mode only if the cellview already exists.  
```cellview = dbOpenCellViewByType("test" "cellA" "layout" "" "a")```

### dbCreateTextDisplay
```
dbCreateTextDisplay(
  d_associateId
  d_ownerId
  ( tx_layer [ t_purpose ] )
  l_displayFlags
  l_point
  t_just
  t_orient
  t_font
  x_height
  [ g_isDrafted [ g_isOverbar [ g_isVisable [ g_isNameVisible [
  g_isValueVisible [ t_attrOrParamName [ g_isParamAssoc ] ] ] ] ] ] ]
)
```
- Description  
Creates a text display object.

- Arguments  
  - `d_associateId`: Associate of the text display. This can be a label in a master cellview, a property, or a dbObject whose attribute t_attrName is to be displayed.
  - `d_ownerId`: Owner of the text display. This can be any database object except properties or groups.
  - `tx_layer`: Either the layer name or number.
  - `t_purpose`: Purpose of the text display. The default is all.
  - `l_displayFlags`: For properties and for attribute associates, every display characteristic must be specified; therefore, t must be specified here.
  - `l_point`: Origin of the text display. This must be specified for properties and for object attribute associates.  
  - `t_just`:  Justification string for the text display. This must be specified for properties and for object attribute associates.
  - `t_orient`: Orientation string for the text display. This must be specified for properties and for object attribute associates.
  - `t_font`: Font style string for the text display. This must be specified for properties and for object attribute associates.
  - `x_height`: Height of the text display that must be given as a positive number. This must be specified for properties and for object attribute associates.
  - `g_isDrafted`: Specifies whether or not drafting is set for the text display. The default is nil.
  - `g_isOverbar`: Specifies whether or not overbar is set for the text display. The default is nil.
  - `g_isVisible`: Specifies whether or not the text display is visible. The default is t.
  - `g_isNameVisible`: Specifies whether or not the property or attribute name is visible. The default is t. This argument applies only to a text display with a property or attribute as its associate. 
  - `g_isValueVisible`: Specifies whether or not the property or attribute value is visible. The default is t. This argument applies only to a text display with a property or attribute as its associate.
  - `t_attrOrParamName`: Name of the attribute or the CDF parameter of the associate object specified in d_associateId.
  - `g_isParamAssoc`: Specifies whether or not t_attrOrParamName is a CDF parameter name. The default is nil.

Examples:
```
dbCreateTextDisplay(label inst list("instance" "label") list("justify" "orient") list(0 0) "centerCenter" "R0" "roman" 2)
dbCreateTextDisplay(net net list("wire" "label") t list(0 0) "centerCenter" "R0" "roman" 2 nil nil t t t "name")
dbCreateTextDisplay(prop net list("wire" "label") t list(0 0) "centerCenter" "R0" "roman" 2)
dbCreateTextDisplay(inst inst list("instance" "label") t list(0 0) "centerCenter" "R0" "roman" 2 nil nil t t t "name" t)
```




 



