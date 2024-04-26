# Welcome to the OPA 2024 - ERFA Edition

In this tutorial, you will learn about many interesting concepts and technologies, focussing on role-based-access-control, attribute-based-access-control and policy-based-access-control :sunglasses:.

# Content
We are going to explore different use-cases from a real-world insurance example.
The use-cases will focus on different kind of access-policies, and how those can be implemented using Open-Poliy-Agent in a real world setting. Namely we'll be focussing in our usecases on a subset of [csa's blog'](https://ipt.ch/de/impuls/mit-dem-open-policy-agent-deine-datenzugange-im-griff-haben).

Further we will incrementally develop an understanding which access-policy serves which use case, and when it doesn't suffice anymore.

# Infrastructure
We'll be using just the online playground of OPA.

# Getting Started
1. Find the repository https://github.com/iptch/2024-04-OPA
1. Follow the [setup-intructions](./00_setup/README.md)
1. Start completing the exercises starting with [RBAC](./01_rbac/README.md), then [ABAC](./02_abac/README.md) and finally [PBAC](./03_pbac/README.md).
1. Each exercise has a corresponding solution-section, which contains a sample-solution-implementation [solution](./solutions)

# Questions
If you happen to have any questions, just let the tutors know. We are happy to help :).

Also if need some examples for further understanding of REGO (policy language of OPA), you might find just the right thing in the Examples from https://play.openpolicyagent.org/ or at least a versatile playground for trying out different things!

Or you can have a sneak-peek at the [solutions](./solutions) trying to find it out yourself :).


[✔️ please start now by adjusting your setup](./00_setup/README.md)

# Further Readings
- Data-Centric-Security: https://www.gartner.com/en/documents/3953491 
    - While we called this policy-based-access-control, sometimes it is also called data-centric-security (dcs, i.e. check Gartner link above) . The idea of DCS is, that the data itself defines who should get access, and espcially under which conditions (thus data-centric); This in turn is a much morn dynamic and precise approach compared to traditional RBAC / ABAC.
- P*-Services (PIP, PEP, PDP, PAP): https://ipt.ch/de/impuls/sensitive-daten-microservice-architekturen-konsistenten-policies-schutzen
    - For the start of the workshop, a somewhat understanding of the different P*-Services (i.e. Policy Enforcement Point / Policy Decision Point) is advised. While we will briefly present the concept, you might additionaly want to read this blog or as always, ask the tutors.
- More real world examples: https://ipt.ch/de/impuls/mit-dem-open-policy-agent-deine-datenzugange-im-griff-haben
    - This blog illustrates more real-world examples, where traditional role-based acccess-controll and attribute-based-access-control won't suffice to fulfill the usecase.
- OPA / REGO Playground: https://play.openpolicyagent.org/
    - Within the REGO Playground, you can checkout different examples with real-time execution (i.e. you can modify and resend the request); which allows for great exploration.