[CmdletBinding()]
param (
    [Parameter(Mandatory= $false)]
    [string]
    $InitiativeName = "AzSecure",
    [Parameter(Mandatory = $true)]
    [string]
    $managementGroupId
    
)

$policies = Get-AzPolicyDefinition -Custom | Where-Object { $_.properties.Metadata.category -match 'AzSecure' }

$groupNames = $policies.properties.Metadata.category | %{ ($_ -split '-')[1] } | Select-Object -Property @{ label='name'; expression={$_}} | convertto-json

$policyDefinitions = @()
$initiativeParameters = New-Object -type psobject

foreach ($policy in $policies) {
    $policyParameterNames = $policy.Properties.Parameters.PSObject.Properties

    $policyParameters = New-Object -type psobject

    $policyParameterNames | %{
        $policyParameters | Add-Member -MemberType NoteProperty -Name $_.Name -Value @{ "value"="[parameters('$($policy.Properties.DisplayName)-$($_.Name)')]" }
        $updatedValue = $_.Value
        $updatedValue.Metadata.DisplayName =  "[$($policy.Properties.DisplayName)] $($_.Name)"
        $initiativeParameters | Add-Member -MemberType NoteProperty -Name "$($policy.Properties.DisplayName)-$($_.Name)" -Value $updatedValue
    }

    $policyDefinitions += @{ "policyDefinitionId"= $policy.PolicyDefinitionId; "groupNames"= @( $policy.Properties.Metadata.category | %{ ($_ -split '-')[1] } ); "parameters" = $policyParameters}
}

$metadata = @{ "category"= "AzSecure"; "version"="1.0.0" }


New-AzPolicySetDefinition -Name 'AzSecure' -DisplayName 'AzSecure' -Description 'Azure Policies from https://github.com/wilfriedwoivre/azure-policies' -Metadata ($metadata | ConvertTo-Json) -PolicyDefinition ($policyDefinitions | ConvertTo-Json -Depth 10) -Parameter ($initiativeParameters | ConvertTo-Json -Depth 5) -GroupDefinition $groupNames -ManagementGroupName $managementGroupId
