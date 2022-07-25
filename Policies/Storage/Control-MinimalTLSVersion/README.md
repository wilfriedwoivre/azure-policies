# Policy to control minimal TLS Version configuration

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwilfriedwoivre%2Fazure-policies%2Fmain%2FPolicies%2FStorage%2FControl-MinimalTLSVersion%2Fazurepolicy.json)
## Parameters

| Name | Type | Allowed Values |
| -- | -- | -- |
| effect | string | <ul><li>Audit</li><li>Deny</li></ul> |
| minimalTLSVersion | string | <ul><li>TLS1_0</li><li>TLS1_1</li><li>TLS1_2</li></ul>
