Clear-Host
write-host "Starting script at $(Get-Date)"

Set-PSRepository -Name PSGallery -InstallationPolicy Trusted
Install-Module -Name Az.Synapse -Force

# Setting Sql usn&pwd
$sqlUser = "SQLUser"
$sqlPassword = "Dp500@12345"

# Choose a random region
#$Region = "westus"

#Rg creation
#[string]$suffix =  -join ((48..57) + (97..122) | Get-Random -Count 7 | % {[char]$_})
#$resourceGroupName = "dp500-$suffix"
$resourceGroupName = (Get-AzResourceGroup | Where-Object { $_.ResourceGroupName -like "lab01-rg*" }).ResourceGroupName
$DeploymentID =  (Get-AzResourceGroup -Name $resourceGroupName).Tags["DeploymentId"]
#New-AzResourceGroup -Name $resourceGroupName -Location $Region | Out-Null

# Create Synapse workspace

$synapseWorkspace = "workspace$DeploymentID"
$dataLakeAccountName = "datalake$DeploymentID"
$sqlDatabaseName = "sqldb$DeploymentID"

(Get-Content -Path "C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\01\parameters.json") | ForEach-Object {$_ -Replace "GET-DEPLOYMENT-ID", "$DeploymentID"} | Set-Content -Path "C:\LabFiles\DP-500-Azure-Data-Analyst\Allfiles\01\parameters.json"

write-host "Creating $synapseWorkspace Synapse Analytics workspace in $resourceGroupName resource group..."
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateFile ".\setup.json" -TemplateParameterFile ".\parameters.json"

# Make the current user and the Synapse service principal owners of the data lake blob store
write-host "Granting permissions on the $dataLakeAccountName storage account..."
write-host "(you can ignore any warnings!)"
$subscriptionId = (Get-AzContext).Subscription.Id
$userName = ((az ad signed-in-user show) | ConvertFrom-JSON).UserPrincipalName
$id = (Get-AzADServicePrincipal -DisplayName $synapseWorkspace).id
New-AzRoleAssignment -Objectid $id -RoleDefinitionName "Storage Blob Data Owner" -Scope "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$dataLakeAccountName" -ErrorAction SilentlyContinue;
New-AzRoleAssignment -SignInName $userName -RoleDefinitionName "Storage Blob Data Owner" -Scope "/subscriptions/$subscriptionId/resourceGroups/$resourceGroupName/providers/Microsoft.Storage/storageAccounts/$dataLakeAccountName" -ErrorAction SilentlyContinue;

# Create database
write-host "Creating the $sqlDatabaseName database..."
sqlcmd -S "$synapseWorkspace.sql.azuresynapse.net" -U $sqlUser -P $sqlPassword -d $sqlDatabaseName -I -i setup.sql

# Load data
write-host "Loading data..."
Get-ChildItem "./data/*.txt" -File | Foreach-Object {
    write-host ""
    $file = $_.FullName
    Write-Host "$file"
    $table = $_.Name.Replace(".txt","")
    bcp dbo.$table in $file -S "$synapseWorkspace.sql.azuresynapse.net" -U $sqlUser -P $sqlPassword -d $sqlDatabaseName -f $file.Replace("txt", "fmt") -q -k -E -b 5000
}

# Pause SQL Pool
write-host "Pausing the $sqlDatabaseName SQL Pool..."
Suspend-AzSynapseSqlPool -WorkspaceName $synapseWorkspace -Name $sqlDatabaseName -AsJob

# Upload solution script
write-host "Uploading script..."
$solutionScriptPath = "Solution.sql"
Set-AzSynapseSqlScript -WorkspaceName $synapseWorkspace -DefinitionFile $solutionScriptPath -sqlPoolName $sqlDatabaseName -sqlDatabaseName $sqlDatabaseName

write-host "Script completed at $(Get-Date)"
