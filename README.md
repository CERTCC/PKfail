# PKfail
Mitigations &amp; detection tools for VU#455367 and #VU943302


## Introduction
This document provides instructions on how to update the UEFI Secure Boot Platform Key (PK) on devices which contain the AMI Test key. The PowerShell script provided below can be used to update the PK to Windows OEM Devices PK key (Windows OEM PK). This can be used as a temporary solution until a firmware update is available to fix this vulnerability. Please check for OEM updates prior to using these scripts. 

The guidance contains the following files:
- Updateamipk.ps1
- Ami-windowspk_content.bin
- \Ami-windowspk_signatures
  - AmiTestPk00.p7
  - AmiTestPk01.p7
  - AmiTestPk02.p7
  - AmiTestPk03.p7

## Who does this guidance apply to?
This guidance applies to devices that are Secure Boot capable and where an AMI Test key is being used as its PK. OEMs are free to edit the scripts to use their own Platform Key in place of the Microsoft PK. Follow the steps below to determine if the UEFI PK update is needed on the target device:
1. Open an admin PowerShell window,
2. Run `Confirm-SecureBootUEFI`. If the cmdlet displays “Cmdlet not supported on this platform” then it means the device is not Secure Boot capable and this guidance doesn’t apply.
3. Otherwise, copy `Updateamipk.ps1` to any directory.
4. `cd` to the directory above and run `Updateamipk.ps1 -confirm`.
5. If the cmdlet displays “AMI Test cert not found in PK. No need for update.”, then this guidance doesn’t apply.
6. If the device is both Secure Boot capable and AMI Test key is detected, then follow this guidance to update UEFI PK.

## What is the Windows OEM Devices PK and what does it do?
Windows OEM Devices PK is a certificate created and managed by Microsoft. The cert will only be used by Microsoft to update the Secure Boot UEFI Key Exchange Key (KEK) when it’s necessary.

## What does the Platform Key (PK) Update Script do?
`Updateamipk.ps1` will be used to update the PK value automatically to the Windows OEM PK when the AMI Test key is detected. To avoid BitLocker recovery being triggered after the PK modification, the script will suspend BitLocker temporarily until the next boot. Once the PK is updated, the script will force rebooting the running device for the PK change to take effect and BitLocker protection to resume after the next boot.

## Limitation of the Platform Key (PK) Update Script
The script doesn't change the default PK value. It must be run every time Secure Boot is reset to maintain device protection. For full device security, a firmware update is required to address this vulnerability.

## Update Guidance Prerequisites
- Windows OS is installed on the target device.
- PowerShell is installed on the target device.
- No firmware update of any kind is applied or pending during the current boot session on the target device.

## Running PK Update script
1. Reboot the system twice to clear any pending Windows update actions. Failure to do so may result in the loss of some functionality that relies on Virtualization Based Security.
2. Confirm that no firmware update has applied or pending during the current boot session on the target device. Firmware updates can be applied after AMI PK Update script is successfully completed and the system has been rebooted.
3. On the target device, copy the following files under the same directory:
   - Updateamipk.ps1
   - Ami-windowspk_content.bin
   - AmiTestPk00.p7
   - AmiTestPk01.p7
   - AmiTestPk02.p7
   - AmiTestPk03.p7
4. Open an admin PowerShell window and `cd` to the directory above.
5. Run `Updateamipk.ps1 -confirm` to verify AMI Test key is in PK and update is required.
6. Run `Updateamipk.ps1 > 2>&1 | Out-File -Filepath Updateamipklog.txt'
7. If the update is successful, the script should reboot device automatically.
8. Once the device comes back, open an admin PowerShell window and `cd` to the directory again.
9. Run `Updateamipk.ps1 -confirm` to verify Windows OEM PK is set now.

## Troubleshooting
`Updateamipklog.txt` can be referenced for troubleshooting PK update failure.

### The script failed with “Required files not found under the current path” message.
Please make sure the following files with exact names are present under the same directory as `Updateamipk.ps1` script.
- Ami-windowspk_content.bin
- AmiTestPk00.p7
- AmiTestPk01.p7
- AmiTestPk02.p7
- AmiTestPk03.p7

### The script exited with “AMI Test key not found in PK. No need for update.”
This means that Secure Boot UEFI PK doesn’t contain AMI Test key, so this guidance doesn’t apply to the device.
