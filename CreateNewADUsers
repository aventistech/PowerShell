#Create a New OU called O365
If (Get-ADOrganizationalUnit -Filter 'Name -like "O365"') {
    write-host "OU existed"
}
else {
    New-ADOrganizationalUnit -Name O365 
}

#Define OU Path and Password
$OU = (Get-ADOrganizationalUnit -Filter 'Name -like "O365"').DistinguishedName
$Password = "P@ssw0rd!@#$"

#Provision 5 x New Users with UAT1 to UAT5
$i = 1
Do {

    $UserName = "UAT" + $i 

    New-ADUser -Name $UserName -DisplayName $UserName -UserPrincipalName $UserName'@yongkw.com' -GivenName $UserName -Surname TEST `
        -AccountPassword (ConvertTo-SecureString -AsPlainText $Password -Force) -Path $OU `
        -SamAccountName $UserName -ChangePasswordAtLogon $false -Enabled $true

    $i++
}
While ($i -le 5)
