# ☑️ TASK 2 - ABAC 
## Description
This task will consists of multiple subtasks, where for each we will be focussing on a abac-setting.

Please use [this playground link](https://play.openpolicyagent.org/p/a7FzHQsV2U) for this task. Also study the data-section to the right-side (it can be extended by dragging with your mouse). Note that you can use print() statements which are printed to the f12-console.

## Task 2.1 - documents belong to policies belonging to customers
As seen in [rbac-task](../01_rbac/README.md), a policy is held by one or multiple customers. Moreover a policy holds 1 to n documents, and each document is mapped to exactly 1 policy.

Write a policy, which only returns a document (returns true), if the requesting-user is either policy-owner or additional-insured of the corresponding policy.

## Task 2.2 - Maturity
Extending on task 2.1, allow a request for a given requesterId *and* documentId (https://play.openpolicyagent.org/p/EmZAq8EVGM) 

if 
- the requesterId is either the policyHolder 
- *or* 
- additonalInsured *and* the requester is at least 18 years old.

:exclamation: This one is quite tough, so feel free to check out the solution! :-)

# Summary
--> What have we done here:
- We've solved examples where basic-roles (i.e. being a policyHolder) isn't enough anymore. 
- Instead we need a series of roles and attributes to allow access.


# Next steps
If you are finished have a look at the proposed [abac solution](../solutions/02_abac/README.md) or continue with the [pbac exercise](../03_pbac/README.md)