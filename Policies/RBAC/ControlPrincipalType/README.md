# Policy to control principal type of an assignment

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwilfriedwoivre%2Fazure-policies%2Fmain%2FPolicies%2FRBAC%2FControlPrincipalType%2Fazurepolicy.json)

## Parameters

| Name | Type | Allowed Values |
| -- | -- | -- |
| allowedPrincipalType | array | <ul><li>User</li><li>Group</li><li>ServicePrincipal</li></ul> |
| effect | string | <ul><li>Audit</li><li>Deny</li></ul> |