param(
  [ValidateSet('QA_Servers', 'PROD_Servers')]
   [Parameter(Mandatory = $true, 
    HelpMessage = 'Select one of the valid servers by typing one of these names: QA_Servers, PROD_Servers')]
  [string]$ServerGroup
)
$servers = @{
  QA_Servers      = ('192.168.1.1','192.168.1.2','192.168.1.3')
  PROD_Servers      = ('192.168.10.1','192.168.10.2','192.168.10.3')
}[$ServerGroup]
Write-Output "The user chose $ServerGroup"

#this is what I don't know how to implement - download file from nas storage on remote machine

$sourcefiles = '\\C:\Users\actions-runner\_work\output\_PublishedWebsites\'

foreach($server in $servers) {
    
  # Destination UNC path changes based on server name 

  $destinationPath = "\\$server\C:\inetpub\wwwroot\dev\"

  # Check that full folder structure exists and create if it doesn't

  if(!(Test-Path $destinationPath)) {
    New-Item -ItemType Directory -Force -Path $destinationPath
  }
  
invoke-command -computername "$server" -scriptblock {iisreset /STOP}
# Copy the file across
  
Copy-Item $sourcefiles $destinationPath


invoke-command -computername "$server" -scriptblock {iisreset /START}
#list of packages to install  
  $msiList = @(
            'Microsoft-ODBCDriver-11-SQLServer-x64\msodbcsql.msi'
            'Microsoft-ODBCDriver-17-SQLServr-x64\msodbcsql_17.2.0.1_x64.msi'
            'Microsoft-OLEDBDriver-SQL Server-x64\msoledbsql_18.1.0.0_x64.msi'

        )
#now I'm trying to install on remote machine
        foreach ($msi in $msiList) {
            $install = Join-Path -Path $destinationPath -ChildPath $msi
            Start-Process "msiexec.exe" -ArgumentList "/I $install",'/qn' -Wait
            
        }
}
