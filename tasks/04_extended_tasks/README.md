# ☑️ TASK 4 - To new shores
## Description
Congrats if you've made it this far!

In conclusion, up until now, we've learned about pbac, abac and rbac and even did some sample-tasks in the playground. This section here covers two additional aspects of a possible opa-lifecycle, one being *unit-testing* and the other one *integration-testing*.

## Task 4.0 - Preparations
Playground doesn't offer a possibility to create unit-/regression-tests, so we'll have to follow a local setup.

For this, please download the OPA executable according to your OS: https://www.openpolicyagent.org/docs/latest/#running-opa and make sure to add it's executable to your system-/environment-path!

Once you can call `opa version` from your shell, you're good to go further.

## Task 4.1 - Unit-Testing
Policies are cool, but in order to have a real enterprise-feeling, we need unit-tests! Fortunately, opa-cli offers a built-in possibility for unit-testing.
[Have a read](https://www.openpolicyagent.org/docs/latest/policy-testing/)

For this task, you will now write tests for the policies written in the previous sessions 2-2 and 3-1. For this we prepared two folders with a policy and data file each as well as test stubs. Write at least three tests (owner allowed, age allowed, age not allowed) in the stub files.
* [task_2-2 stub](files/task_2-2/policy_test.rego)
* [task_3-1 stub](files/task_3-1/policy_test.rego)

You can test this by using your shell.

```bash
# switch to your task under test
cd tasks/04_extended_tasks/files/task_<task-number>
# execute the test
opa test . -v

# expected output similar to
# ...
# PASS: 3/3
```

A possible solution can be found here:
* [task_2-2 solution](../solutions/04_extended_tasks/files/task_2-2/policy_test.rego)
* [task_3-1 solution](../solutions/04_extended_tasks/files/task_3-1/policy_test.rego)

## Task 4.2 - Integration-Testing
While we were able to create / run unit-tests from cli, locally, another approach is to use a HTTP-Client, which actually sends the requests to the opa server.
The opa cli offers the possibility to run a server, which exposes a REST API. This REST API allows to send requests, which are then evaluated against the policy.
[Have a read](https://www.openpolicyagent.org/docs/latest/rest-api/)

Naturally we could use Postman (or any HTTP-Client IDE extension) to write tests! This allows to test the integration of Open-Policy-Agent with other components (i.e. if we have runtime requests in OPA, or the K8s service, or Openshift Route). As a matter of fact, we could even automate this process for a nifty set of regression-tests, i.e. using postman/newman.

For this task, you will write some integration tests for the rest api. For the sake of simplicity we still work locally on our machines.
First try to start the opa server.

```bash
# switch to your task under test
cd tasks/04_extended_tasks/files/task_<task-number>
# start the server
opa run data.json policy.rego -s

# expected output similar to
# ...
# ... OPA is running on a public (0.0.0.0) network interface.
# ... localhost:8181
```

Now you can test your policy with a http client like curl.

```bash
# call the opa server (input data example from task 2.2)
curl -X POST http://localhost:8181/v1/data/play/allow -H 'Content-Type: application/json' -d '{"input": {"documentId": "Doc_49193", "requesterId": "Cus_5176"}}'

# expected output similar to
# ...
# {"result":false}
```

You can replace the input values according to your rego tests from task 4.1 and check what happens.

### Create Bruno Integration Tests

Bruno is an open source Postman replacement which comes with a handy frontend and CLI. For this task, we need only the Bruno CLI.
* [Bruno Homepage](https://www.usebruno.com/)
* [CLI Installation](https://docs.usebruno.com/bru-cli/overview)

**For this task, we assume you have a running opa server for the desired task-number.**

You will now write bruno tests for the policies written in the previous sessions 2-2 and 3-1. For this we prepared two folders with test stubs. Write at least three tests (owner allowed, age allowed, age not allowed) with the stub files.
* [task_2-2 stub](files/task_2-2/bruno/test1.bru)
* [task_3-1 stub](files/task_3-1/bruno/test1.bru)

You can open the file also in the Bruno UI or install the Bruno VSCode Extension ;-)

**Be aware that for Bruno, each test has to be its own file.**

You can test this by using your shell.

```bash
# switch to your task under test
cd tasks/04_extended_tasks/files/task_<task-number>/bruno
# run the bruno tests
bru run .

# expected output similar to
# ...
# Requests:    3 passed, 3 total
# Tests:       6 passed, 6 total
# Assertions:  0 passed, 0 total
```

A possible solution can be found here:
* [task_2-2 solution](../solutions/04_extended_tasks/files/task_2-2/bruno)
* [task_3-1 solution](../solutions/04_extended_tasks/files/task_3-1/bruno)

# Summary
--> What have we done here:
- We've implemented tests for our policy-based access-policies
- By using the opa cli or any http cli tool, we can run **unit tests** and **integration tests** inside ci/cd pipelines.

With this testing capabilities, risks of breaking access control mechanisms should be considerabely low.
Using large amount of tests and test data, breaking changes can be easely found during regression tests.

So considering an architecture where this policies are enforced everywhere at any time with a central governance, the journey to zero trust
will make a great step forward.
