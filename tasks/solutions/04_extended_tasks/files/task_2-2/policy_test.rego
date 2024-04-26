package play
import rego.v1

test_policyholder_allowed if {
	allow with input as {"documentId": "Doc_49193", "requesterId": "Cus_8793"}
}

test_over17_allowed if {
	allow with input as {"documentId": "Doc_49193", "requesterId": "Cus_2970"}
}

test_under17_denied if {
	not allow with input as {"documentId": "Doc_49193", "requesterId": "Cus_5176"}
}
