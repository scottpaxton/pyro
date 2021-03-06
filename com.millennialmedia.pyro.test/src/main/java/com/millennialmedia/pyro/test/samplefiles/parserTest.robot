# A test space-separated file to exercise the Robot parser in Pyro.  This will serve as a test of the 
# core parser functionality as well as the model post-processors in the core plugin.

# comment line before any tables
A meaningless non-commented line before any tables, to be ignored

*** Settings ***

Test Setup  test setup keyword

Documentation  some words
  ...  some more words

Force Tags  hello world
Library  something  WITH NAME  foo
# a bogus setting
Bad setting name  foo

# a bogus table name       this should be ignored, and be treated as a single segment despite the tabs
***FOO***

# this line should still belong to the previous Settings table
Resource  foo


*** Variables ***
| $foo   | bar   |
| @list  | item1 | item2 | item3 |
|  ...   | item4 | item5 | item6 |


*** Test Cases ***
Setup
  [Documentation]  some documentation  spread across  different cells
  # and with a comment in between
  ...  and also  appearing on  different lines
        
  Run Keyword If  ${True}  test keyword

TestATemplate  [Template]  test keyword
  arg1  arg2  arg3

***     Keywords *    # extraneous comment
test setup keyword
  @collection=  create list
  :FOR  $item  IN  @collection
    log  Test
  Pass execution

test keyword
  Pass execution

# this last line has no terminating linefeed