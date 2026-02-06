$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$Name    = "MaxSize"

if (Test-Path $RegPath) {
  $val = (Get-ItemProperty -Path $RegPath -Name $Name -ErrorAction SilentlyContinue).$Name
  Write-Output "Current MaxSize: $val"
} else {
  Write-Output "Registry path does not exist"
}
