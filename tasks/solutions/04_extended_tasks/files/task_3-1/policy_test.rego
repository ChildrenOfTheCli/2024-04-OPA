package play
import rego.v1

test_docowner_allowed if {
	allow with input as {"documentId": "Doc_9006", "requesterId": "Cus_9006"}
}

test_under14_allowed if {
	allow with input as {"documentId": "Doc_9007", "requesterId": "Cus_9005"}
}

test_over14_denied if {
	not allow with input as {"documentId": "Doc_9006", "requesterId": "Cus_9005"}
}
