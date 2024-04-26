# ☑️ TASK 1 - RBAC 
## Description
This task will consists of multiple subtasks, where for each we will be focussing on a rbac-setting.

Please use [this playground link](https://play.openpolicyagent.org/p/a7FzHQsV2U) for this task. Also study the data-section to the right-side (it can be extended by dragging with your mouse). Note that you can use print() statements which are printed to the f12-console.

## Task 1.1 - customer-endpoint
We'll start with a very simple RBAC scenario. 

The data-section provides information about customers, policies and documents. A customer does have a customerId, firstname, lastname and dateOfBirth
At the moment without any security-measures, these information are returned to anyone! So any user can request any user-information!

Implement a rego-policy which only returns `true` customer-object if the requesting customerId matches with an existing customerId in data.

## Task 1.2 - policyHolder
As seen in the data-section, an InsurancePolicy always has exactly 1 policyHolder, and some additional insured customers (any customers, which also belong to this policy).

Let's apply the same rbac, in this scenario! Only allow the access (return true) to a policy through the policies-endpoint only if the requesting customer is the policy holder.

# Summary
--> What have we done here:
- we've modelled some rbac use-cases to allow/deny requests to sensual data

While you are on the REGO Playground take your time and have a look at the other examples, especially the one for abac an rbac.

You are free to experiment with your policy! In some other use-cases the INPUT section might actually contain a requesterId and a requestedSource (or requestedDocumentId); try to think a policy to solve these requests.

# Next steps
If you are finished have a look at the proposed [rbac solution](../solutions/01_rbac/README.md) or continue directly with the [abac exercise](../02_abac/README.md)