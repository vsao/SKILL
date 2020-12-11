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

d_associateId 



