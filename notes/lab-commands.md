# Lab Commands — WN10-AU-000500

Environment: Windows 10 Virtual Machine accessed via Azure Bastion with administrative PowerShell.

This file documents the commands executed during validation, remediation, and compliance verification of Windows 10 STIG control **WN10-AU-000500**.

## Baseline Validation
```powershell
.\baseline-check.ps1
```

## Remediaton Execution
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force
.\WN10-AU-000500.ps1
```

## Independent Validation
```powershell
reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application" /v MaxSize
```

## Expected Compliant Output
```powershell
MaxSize    REG_DWORD    0x8000 (32768)
```
