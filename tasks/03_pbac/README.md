# ☑️ TASK 3 - PBAC 
## Description
Finally we've reached pbac.

In comparison to rbac, where roles (or single attributes) are used to authorized and abac, where conjunctions or roles and attributes are used, pbac focusses on even more data-related properties.

A "somewhat" realistic example for a pbac use-case might be the following setting:
- In a imaginary swedish enterprise, employees tended to do much overtime. This led to serious health-issues where employees called in sick for several weeks or even months.
- To counteract the overtime-trend, the swedish enterprise implemented a policy where working after 18:00 (both onsite and remote) wasn't possible anymore.
- As a general measure, this might be appropriate, but there will still be break-glass scenarios in terms of on-call service.
- This means that if the user had the job-role of a system-engineer, and the property of 'active on-call' this user was allowed to connect after 18:00.

Can you see how this conjunction of differet properties like roles, properties and even dynamic information (time) could create a policy? That's one sort of pbac.

Other kinds often include a more data-centric approach. So instead of a policy-based approach whitelisting whole "API endpoints", you would specify much more concise on a data-product level (where each property of the data-product influences the policy). Check the **further-reading** sections if you want to know more about [data-centric-security](../README.md).

## Task 3.1 - Real-world insurance pbac-example
Following the examle from [abac task 2.1](../02_abac/README.md), a policy holds 1-n documents, whereas a policy is held by a policyHolder and has additionalInsured.

Now in Switzerland, there are very speific laws about which policy-consumer (holder or additional inusred) can view which documents.

Suppose the following:
* A parent is the polidyHolder for a policy whereas her 2 children are in the very same policy as additionalInsured.
* Now one of the children is already 14 years old.
* In a insurance-context, a child of age 14 is legally allowed to 'own' her policy-documents, whereas the policyHolder (in this example, the parent) is *no longer allowed* to check the documents.
* This means that with the child aging to 14, the parent loses the access to the document itself (but still has to pay the bill ;)).

Implement a policy which:
* Allows the parent to check the documents for her policy, including the documents of her children (a policy-owner to check their own documents and the documents of their additionalInsured)
* Allows to check the policy-document of her child aged < 14 years (additionalInsured + < 14 years)
* Doesn't allow the parent to check the policy-document of her > 14 years aged child. (additionalInsured + > 14 years)
* Allows the child > 14 years to check it's documents (allow a documentOwner to check their documents)

Use the family `South` with `Cus_9005, Cus_9006, Cus_9007`, their Policy `Pol_9005` and their documents `Doc_9005, Doc_9006, Doc_9007` to develop your policy --> https://play.openpolicyagent.org/p/TNpiSXW5Rb ! But then again, you can test your final policy against any user, or feel free to modify the data.

## Task 3.2 - Be creative
This task might be up to you! In the presentation we've mentioned some potential applications where rbac / abac isn't enough and instead a policy-based approach is needed. Can you come up with any examples which need policy-based-access-control? Feel free to try them out (but please don't write any confidential data to the playground... :)). Or if you want to know more about testing, have a look at the [extended section](../04_extended_tasks/README.md).

# Summary
--> What have we done here:
- We've implemented a policy-based access-policy
- By using dynamic information (age) and data-centric information (who owns the document) we defined a policy

Open-Policy-Agent could even fetch real-time data using http.send! This allows to fetch real-time data from a policy-information-point (i.e. besondere Lage nach EpG Artikel 6).

A word of caution: While everything can be modelled using policies, doesn't imply everything should :) The strength of pbac (and OPA) lies in well-defined areas of application. So if you have a use-case for fine-grained policy-based access, use a corresponding tool. But if you want to use LDAP-Groups in your on-prem gitlab, use a corresponding tool ;).

# Next steps
If you are finished, have a look at the proposed [pbac solution](../solutions/03_pbac/README.md)