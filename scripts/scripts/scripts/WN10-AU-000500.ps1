# WN10-AU-000500 Remediation
# Ensure Application Event Log MaxSize >= 32768 KB

$RegPath   = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$ValueName = "MaxSize"
$MinKB     = 32768

if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force | Out-Null
}

$current = (Get-ItemProperty -Path $RegPath -Name $ValueName -ErrorAction SilentlyContinue).$ValueName

if ($null -eq $current -or $current -lt $MinKB) {
    New-ItemProperty -Path $RegPath -Name $ValueName -PropertyType DWord -Value $MinKB -Force | Out-Null
    Write-Output "Remediated: MaxSize set to $MinKB KB"
} else {
    Write-Output "Already compliant: MaxSize = $current KB"
}

$final = (Get-ItemProperty -Path $RegPath -Name $ValueName).$ValueName
Write-Output "Verified MaxSize: $final KB"
