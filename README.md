# SKILL User Guide 
SKILL Codes, PCell Creation

## Introduction  
SKILL programming language is based on artificial intelligence laanguage Lisp. SKILL lets us quickly and easily customize existing CAD applications and helps us develop new applications. This document describes basics of SKILL and its applications.

## SKILL Programming Notations
- Notation by other languages: `fun( arg1 arg2 .....)`
- Notation by Lisp language  : `(fun arg1 arg2 .....)`

## Cadence SKILL language at a glance
SKILL is command language of cadence environment. Whenever we use menus, bindkyes etc. the cadence software triggers SKILL functions to complete the tasks. Other SKILL functions compute or retrieve data from designs. We can enter SKILL functions directly on a command line insted of gui mode.
  

### Invoking a SKILL Function

![SKILL_Invocation](https://github.com/vsao/SKILL/blob/main/SKILL_Invocation.png)
Figure1: SKILL Invocation

### Terms and Definitions

|         Term             |          Definition                                                                         |
|--------------------------|---------------------------------------------------------------------------------------------|
| Bindkeys                 |   A bindkey associates a SKILL function with a keyboard event.                              |
| CIW                      |   Command Interpreter Window                                                                |
| SKILL function           |   A named, parameterizable body of one or more SKILL expressions.                           |
| SKILL procedure          |   This term is used interchangeably with the term SKILL function.                           |
| SKILL interpreter        |   The SKILL interpreter executes SKILL programs within the Cadence environment.             |
| SKILL Process            |   A separate UNIX process that can submit SKILL functions directly to the SKILL interpreter.|

### SKILL Data
The simplest SKILL expression is a data item. SKILL data is case sensitive.  
Sample SKILL Data items:

|   Data Type    | Syntax Example
|----------------|-------------------------|
| integer        | 5                       |   
| floating point | 5.3                     |
| text string    | "Mary had a little lamb"|

### Calling a Function
Function names are case sensitive. Function name with its arguments inside parentheses is stated to call a function.  
Example: `strname("My" "name" "is" "akhil")`



