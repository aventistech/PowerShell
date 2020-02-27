#Office 365 - MSOnline Module

#Download and install Microsoft Online Services Sign-In Assistant for IT Professionals RTW
#Install MSOnline Module 
Install-Module MSOnline

#Preapration of Credential 
$UserName = "admin@M365x098489.onmicrosoft.com"
$Password = "xpZjbQ5Q2F" | ConvertTo-SecureString -AsPlainText -Force 

#Specify Credential with password 
$Credential = new-object -typename System.Management.Automation.PSCredential -ArgumentList $UserName,$Password

#Login to Office 365
Connect-MsolService -Credential $Credential

#Login to Exchange Online
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
-Credential $Credential -Authentication  Basic -AllowRedirection

Import-PSSession $Session

#To remove all demo account provisioned 
Get-MsolUser | ? UserPrincipalName -NotLike "admin@*" | Remove-MsolUser -Force

#Add New Domain 
$Domain = "Aventislab.com"
New-MsolDomain -Name $Domain
Get-MsolDomainVerificationDNS -DomainName $Domain

# Add MS=msxxxxxx to public DNS Server

Confirm-MsolDomain -DomainName $Domain

#Set it as default 
Set-MsolDomain -Name $Domain -IsDefault
#Verify 
Get-MsolDomain | Select Name, isDefault

#Enable ADSync
Get-MsolCompanyInformation | Select-Object DirectorySynchronizationEnabled 
Set-MsolDirSyncEnabled -EnableDirSync $true 


