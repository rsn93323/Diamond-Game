#Generate list of all licensed user's MFA status

Connect-MsolService

Echo "Generate list of all licensed user's MFA status"
$folderName = (Get-Date).tostring("MM-dd-yyyy-hh-mm-ss")  
#Connect-MsolService
Get-MsolUser -all | Where {$_.islicensed -like "True"} | Select DisplayName,UserPrincipalName,@{Name='MFAStatus'; Expression= {If($_.StrongAuthenticationRequirements.Count -ne 0) {$_.StrongAuthenticationRequirements[0].State} Else {'Disabled'}}} | Export-Csv -NoTypeInformation C:\export\MFAStatus-$folderName.csv

start C:\export