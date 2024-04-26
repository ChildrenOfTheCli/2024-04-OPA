package play

import future.keywords.if

# Welcome to the Rego playground! Rego (pronounced "ray-go") is OPA's policy language.
#
# You can navigate around and check out other examples! But please mind, that for our exercises,
# there are permanent links in the github-readme, so you always can come back.

default allow := false

# Here goes your policy :-)
allow {
	some customer
	contains(data.policies[customer][documents], input.documentId) # Check if documentId exists

	# if it exists, customer is set to the customer-entry in the policies-data
	# finally check if this customer-policyHolder matches the requester.
	input.requesterId == data.policies[customer][policyHolder]
}

# OR over the age of 18 and additonalInsured
allow {
	# Find the customers' age
    # To find the age, we first have to find the right customers entry
	some customer
	input.requesterId == data.customers[customer][customerId]
    # Once above condition matches, we have the right customer object
	print(customer)
    # for testing purposes, we print the dateOfBirth
    print(data.customers[customer].dateOfBirth)
    # check https://www.openpolicyagent.org/docs/latest/policy-reference/#time 
    age := time.parse_ns("2006-01-02", data.customers[customer][dateOfBirth])
    print(age)
    # again, check https://www.openpolicyagent.org/docs/latest/policy-reference/#time for time diff
    [years, months, days, hours, minutes, seconds] = time.diff(age, time.now_ns())
    print(years)
    # years must be bigger than 17, so at least 18
    max([years, 17]) == years
	# Once we reach here, we know the person is at least 18 years old.
  
  	# Now we need to check that the very same person is in the 
    # additionalInsured of the referenced documentId
    some policy
    contains(data.policies[policy].additionalInsured, input.requesterId)
 }
