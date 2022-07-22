[CmdletBinding()]
param (
    [Parameter(Mandatory= $false)]
    [string]]
    $InitiativeName = "AzSecure"
)

$policies = Get-AzPolicyDefinition -Custom | Where-Object { $_.properties.Metadata.category -match 'AzSecure' }

