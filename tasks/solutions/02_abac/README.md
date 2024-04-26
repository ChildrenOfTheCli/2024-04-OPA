# Simple Rego Policy Solution


## Task 2.1 - solution
* https://play.openpolicyagent.org/p/2QLvKWPqZ4 

## Explanation
additonalInsured is a string, so we can't use `some` or `_`. 
The easiest way to work around this, is to check whether the requesterId is a substring of any additonalInsureds with the keyword `contains`.

## Task 2.2 - solution
* https://play.openpolicyagent.org/p/p8WlUCDWC5

## Explanation
The heavy-part of this exercise is the conjunction of AGE >= 18 and additionalInsured. While the additionalInsured can be taken from the previous exercise, we need the built in `time` module to parse and check the age of the requester.

Feel free to play around with the solution, try different requesterIds or even change the underlying data (i.e. what happens if an additional insured isn't > 18 anymore, does the solution actually return false?)

# Wrap-up
Once you've fiddled around enough, go on with the next task [pbac](../../03_pbac/README.md).