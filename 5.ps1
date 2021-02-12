$file_path = "D:\Learn\SPO\"
$file_path2 = $file_path+"*"
$file_name = "5.txt"
$file_path_and_name = $file_path+$file_name
if (Test-Path $file_path2 -Include $file_name) {
   Write-host "We have file with name 5.txt"
}
else {
   New-Item -Name "5.txt" -Path $file_path
}
$adreesInternet=(Get-NetIPAddress -InterfaceIndex "6")
$ipv4=$adreesInternet.IPv4Address
"IPv4: "+$ipv4 | Out-File $file_path_and_name
$subnet_mask=(gwmi -computer .  -class "win32_networkadapterconfiguration" | Where-Object {$_.defaultIPGateway -ne $null}).IPSubnet[0]
"Subnet Mask: "+$subnet_mask | Out-File $file_path_and_name -Append
$gateway=$adreesInternet.IPv6Address
"Gateway: "+$gateway | Out-File $file_path_and_name -Append
Start notepad $file_path_and_name