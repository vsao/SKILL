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

|   Data Type    | Syntax Example          |
|----------------|-------------------------|
| integer        | 5                       |   
| floating point | 5.3                     |
| text string    | "Mary had a little lamb"|

### Calling a Function
Function names are case sensitive. Function name with its arguments inside parentheses is stated to call a function.  
Example: `strname("My" "name" "is" "akhil")`

### SKILL Operators

| Operators in Descending Precedence |     Underlying Function    |      Operation         |
|------------------------------------|----------------------------|------------------------|
|               **                   |  expt                      |   arithmetic           |
|               *, /                 |  times, quotient           |   arithmetic           |                                      
|               +, –                 |  plus,  difference         |   arithmetic           |                                     
|               ++s, s++             |  preincrement,postincrement|   arithmetic           |
|               ==                   |  equal                     |   tests for equality   |
|               !=                   |  nequal                    |   tests for inequality |
|               =                    |  setq                      |   assignment           | 

## SKILL List
SKILL List is the ordered collection of the SKILL data objects.  
Sample general lists:
|    List         |             Explanation                             |
|-----------------|-----------------------------------------------------|
| (1 2 3)         | A list containing the integer constants 1, 2, and 3 |
| (1)             | A list containing the single element 1              |
| ()              | An empty list (same as the special atom nil)        |
| (1 (2 3) 4)     | A list containing another list as its second element|

### Buliding SKILL List
- List can be created either using single qoute operator(') or list function.  
```
'(1 2 3)        => (1 2 3)  
list(1 2 3)     => (1 2 3) 
```
- Adding an element to the front of a list using `cons` function
```
result = '(2 3)             => (2 3)
result = cons( 1 result)    => (1 2 3)
```
- Merging two lists using `append` function
```
list1 = '(1 2 3)                    => (1 2 3)
list2 = '(4 5 6)                    => (4 5 6)
list_final = append(list1 list2)    => (1 2 3 4 5 6)
```
- Retrieving 1st element of a list using `car` function
```
numbers = '(1 2 3)
car(numbers)         => 1
```
- Retrieving tail of the list using `cdr` function
```
numbers = '(1 2 3)
cdr(numbers)        => (2 3)
```
- Retriving an element given an index using `nth` function
```
numbers = '(1 2 3)
nth(1 numbers)       => 2
```
- Member function
```
numbers = '(1 2 3)
member(4 numbers)    => nil
member(2 numbers)    => (2 3)   ; it finds where 2 is present in the list and prints all the elements from 2 till last element.
```
- length function
```
numbers = '(1 2 3)
length(numbers)      => 3      ; it gives the length of the list.
```

## File Input/Output
This section introduces how to
- Display values using default formats and application-specific formats
- Write UNIX text files
- Read UNIX text files

### Displaying Data
- Using `print` function
```
for(i 1 3 print("hello"))

=> "hello" "hello" "hello"
```
- Using `println` function
```
for(i 1 3 println("hello"))

=> "hello"
   "hello"
   "hello"
```
- Using `printf` function
```
aList = '(1 2 3)
printf("\n This is a list: %L" aList)

=> This is a list: (1 2 3) 
```
### Writing data to a file

To write text data to a file  
1. Use the outfile function to obtain an output port on a file.  
2. Use an optional output port parameter to the print and println functions and/or use a required port parameter to the fprintf function.  
3. Close the output port with the close function.  

```
myPort = outfile("/home/vsao/myfile")
for(i 1 3
    println(list("Number:" i) myport)
    )
close(myport)

=> ("Number:" 1)
   ("Number:" 2)
   ("Number:" 3)

```
### Reading Data from a file

To read a text file
1. Use the infile function to obtain an input port.
2. Use the gets function to read the file a line at a time and/or
use the fscanf function to convert text fields upon input.
3. Close the input port with the close function.

```
inPort = infile( "~/.cshrc" )
when( inPort
  while( gets( nextLine inPort )
    println( nextLine )
       )
  close( inPort )
)
```
**Note:** We can use fprintf() for printing insted of println() and fscanf() in place of gets() for reading the data.

## Flow of Control

This section introduces you to
- Relational Operators: <, <=, >, >=, ==, !=
- Logical Operators: !, &&, ||
- Branching: if, when, unless
- Multi-way Branching: case
- Iteration: for, foreach
 
### Relational Operators  
Relational operators are used to compare data values and returns `t` or `nil` value accordingly.  
Examples:
1. 3 < 5           => t
2. 10 > 2          => nil
3. "abc" != "ABc"  => t
