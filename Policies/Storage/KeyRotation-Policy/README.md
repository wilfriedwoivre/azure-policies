# Policy to control key rotation configuration

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#blade/Microsoft_Azure_Policy/CreatePolicyDefinitionBlade/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fwilfriedwoivre%2Fazure-policies%2Fmain%2FPolicies%2FStorage%2FKeyRotation-Policy%2Fazurepolicy.json)

## Parameters

| Name | Type | Allowed Values |
| -- | -- | -- |
| maxAllowedPeriodInDays | int |
| effect | string | <ul><li>Audit</li><li>Deny</li></ul> |
