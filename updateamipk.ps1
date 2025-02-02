param (
  [Parameter()]
  [switch]$confirm
)

[byte[]] $windowsoempk =
    0xbb,0x90,0x87,0xd5,0x3e,0x70,0x27,0x57,0xe6,0xf5,0xbc,0xce,0x7e,0xd9,0xca,0x76,
    0xac,0x47,0xab,0xd5,0xe6,0x0e,0x03,0x96,0xbd,0x38,0x01,0x63,0x39,0x84,0x96,0x23,
    0x8f,0xb0,0x93,0x5f,0x7b,0x11,0x53,0x65,0xe2,0xb2,0x68,0x07,0x17,0xb1,0x07,0x28,
    0x1c,0x0a,0xa9,0x5d,0x43,0x16,0x60,0x5f,0x46,0xbf,0xe0,0x9c,0x39,0x46,0xcd,0xe1,
    0xde,0x7a,0x69,0xb5,0xa9,0x6d,0xd1,0x58,0x81,0x8d,0x80,0x43,0x20,0x25,0x6b,0xa4,
    0x73,0x6e,0x07,0xcc,0x1f,0x5c,0x0d,0x21,0xd0,0xbe,0x49,0xb9,0x3b,0xd7,0x9d,0xc4,
    0x3b,0x77,0x6f,0xd7,0x80,0xfe,0xbf,0xce,0x75,0xf0,0xe6,0x27,0x7c,0x01,0x5a,0xef,
    0xf9,0x75,0x20,0xbe,0x36,0x4b,0xca,0xd9,0x27,0x69,0x81,0x0e,0x05,0xec,0x69,0xa4,
    0x6f,0x39,0xf9,0x75,0x1f,0x0e,0x8b,0xf4,0xf1,0x94,0x41,0x28,0xfa,0x68,0xbe,0x8b,
    0x32,0xe2,0x85,0xb7,0xe5,0xb7,0xc4,0xc5,0xf3,0xdb,0x47,0xa4,0xa4,0xb4,0xf9,0x78,
    0x24,0xf9,0xfe,0xed,0x74,0x9c,0x15,0xd8,0x61,0xeb,0xec,0xff,0xdc,0x74,0xb4,0x93,
    0x9f,0xb5,0x0a,0xbf,0x3e,0x74,0xed,0x13,0x1b,0x39,0x8d,0xdb,0x38,0x7d,0x27,0x9f,
    0xfd,0x51,0xfb,0x24,0xda,0x92,0x4c,0x3b,0x66,0x1f,0xa3,0x7f,0xa0,0xc6,0xee,0xba,
    0x0c,0x17,0xf1,0x90,0x8f,0x39,0x4a,0x94,0x4c,0x26,0x03,0x6a,0xd3,0x8a,0x27,0xe6,
    0x3b,0x42,0x3f,0x27,0x08,0xe8,0xbf,0xbb,0x9c,0xf2,0xff,0xec,0x06,0x09,0xd8,0xd2,
    0x59,0x49,0x98,0xe7,0x50,0x45,0x39,0x90,0xb1,0x34,0x7b,0xcb,0x66,0x6c,0x5a,0xc1

[byte[]] $amitestpk00 =
    0xE7,0x36,0x7B,0x20,0x92,0xBA,0x7F,0xAA,0xA3,0xF6,0x0E,0x49,0x08,0x87,0xF5,0x1C,
    0x11,0x33,0xBA,0x5D,0xF8,0x9B,0x5C,0xED,0xC7,0x90,0xE4,0xF3,0x41,0x02,0x06,0x41,
    0xF9,0x17,0x1E,0x52,0xAA,0x99,0x1A,0xB4,0x8A,0x5A,0x56,0xEE,0x5B,0xEF,0x77,0x59,
    0x07,0x10,0x6E,0x91,0x6F,0xF7,0x91,0x61,0x4D,0xFA,0x30,0xF5,0x67,0x49,0xF5,0x80,
    0xAD,0x75,0x54,0x0D,0xA4,0xDC,0x68,0xAD,0xE1,0x63,0x8A,0x1F,0x59,0x23,0xB0,0x9E,
    0xF9,0x19,0xF6,0xA0,0xE8,0x7D,0x3B,0xC1,0xD9,0xB1,0x1F,0xD6,0x95,0x96,0x12,0xBA,
    0x08,0xFD,0x20,0x75,0xBE,0x7D,0xAA,0x84,0x2E,0xA3,0xD1,0x13,0x4B,0xC6,0xBA,0xE0,
    0xCE,0xB8,0xCD,0xE1,0xF0,0x27,0x21,0x46,0x56,0x41,0x35,0x61,0xF7,0x81,0xE5,0xDB,
    0x9C,0xF7,0x44,0xEB,0x69,0x7A,0x19,0xA5,0x6A,0x19,0xD9,0x75,0x7F,0x3F,0xCA,0xC6,
    0x8E,0x7E,0xB7,0x05,0xAC,0x01,0xE1,0x6F,0x46,0xCF,0x94,0xF8,0xE1,0xDF,0x66,0x8D,
    0x1F,0x98,0x41,0x40,0xCF,0x07,0xC0,0x6E,0x53,0x6E,0x63,0xEF,0xAA,0xD1,0x41,0xED,
    0xBB,0x87,0x90,0x1F,0x60,0x84,0xA6,0xD0,0xA6,0xA4,0xAE,0x95,0x51,0x99,0x88,0x64,
    0x21,0x49,0x62,0xC8,0xE9,0xFC,0x89,0x28,0x12,0xF4,0x73,0x0B,0x3D,0x19,0x6C,0x52,
    0xFC,0x34,0xFD,0xF2,0xFC,0xB4,0x4F,0xCA,0x73,0x49,0x1A,0x6E,0xF9,0x37,0xF2,0xC7,
    0x51,0x6D,0xFF,0xBD,0x75,0x87,0x46,0xFB,0x6D,0xB5,0xF8,0x0E,0xD0,0x38,0x37,0xE7,
    0x91,0x21,0x72,0xEF,0xE2,0x33,0x04,0x3E,0xA1,0xC6,0x7F,0x96,0x0D,0xEB,0x63,0x59

[byte[]] $amitestpk01 =
    0xcc,0x0f,0xa8,0xb0,0x5b,0x0c,0xb0,0xb3,0x14,0xb2,0x6b,0x74,0x3c,0x92,0x94,0xe4,
    0x13,0x3e,0x83,0x72,0x0c,0xc8,0xd2,0xda,0x70,0x4f,0xd0,0x37,0xa5,0x82,0x9c,0x73,
    0xdc,0x64,0xe3,0xf7,0x1a,0x98,0x6b,0xef,0x63,0x4b,0xcb,0x6d,0xa1,0xfc,0xd4,0x6c,
    0x15,0x7e,0x72,0x5c,0x96,0x3f,0x32,0x75,0xb2,0x8b,0x9a,0x26,0xd1,0xf6,0xc2,0x56,
    0xbf,0x4d,0xef,0x30,0x68,0xfd,0x8c,0x8c,0x09,0x36,0x81,0x72,0x91,0x4c,0x79,0xfc,
    0xf9,0xa0,0x70,0xef,0xba,0xc2,0x53,0x6c,0x8f,0x0d,0x53,0x8f,0x7b,0x05,0xd8,0xb5,
    0x92,0xa3,0x77,0x7a,0x36,0x72,0xfa,0xd0,0x75,0x81,0xe2,0xa7,0xf4,0x67,0xb0,0x38,
    0x8e,0x22,0xcd,0x0e,0x15,0x51,0x96,0x3c,0x3f,0x83,0xf6,0x40,0x72,0x4a,0xb7,0x5f,
    0x23,0xc5,0xb6,0x49,0x82,0x3e,0xcb,0xf3,0x35,0x84,0xf2,0xbf,0xb7,0x8c,0x29,0x46,
    0x9a,0x40,0x51,0x37,0x49,0x6b,0x1e,0x13,0x16,0x0c,0x68,0x33,0xa0,0xa5,0x47,0xae,
    0xa0,0x6b,0xa4,0x33,0x80,0xb0,0x6c,0xb6,0x82,0xfd,0x3b,0x49,0xd8,0x32,0x5b,0x1f,
    0x68,0x55,0x4f,0x0e,0xc0,0xb9,0xf8,0xc0,0x99,0xea,0x48,0xf6,0xeb,0x8e,0xe0,0xe8,
    0x4f,0x8f,0xde,0xf7,0xf5,0x12,0x51,0xbb,0x96,0xe5,0xd8,0xdc,0x2d,0x8d,0x2e,0x38,
    0x67,0x23,0x7b,0xdc,0xfe,0x01,0x65,0x62,0x28,0x9d,0x8b,0x18,0x83,0x91,0xd3,0xd5,
    0x4b,0xa0,0xe3,0x86,0xa5,0x61,0xd0,0x3a,0x7d,0xa4,0x09,0x9f,0x68,0x46,0xe8,0xda,
    0xa5,0xef,0xb5,0x25,0x24,0x05,0x45,0xd0,0x18,0xb4,0xc5,0x7f,0xa9,0x49,0x28,0x63

[byte[]] $amitestpk02 =
    0xb8,0x30,0x6d,0x86,0xad,0xd9,0x50,0xab,0xb5,0xce,0xb1,0xf2,0xb8,0xe5,0x25,0x1f,
    0x90,0x18,0x6a,0xd2,0x4a,0x1d,0x9e,0x91,0x0f,0xa9,0xb9,0x59,0x4b,0xb9,0x68,0x9c,
    0x11,0x9f,0xcd,0xe8,0xb2,0xbd,0x5e,0x08,0x60,0x75,0x67,0x45,0x14,0xd3,0x15,0x05,
    0x99,0x4c,0xdb,0x6f,0x82,0xc9,0xa7,0x6f,0x7a,0xa0,0x3a,0x01,0xf5,0x33,0xb6,0x25,
    0xc3,0x9a,0x89,0xd0,0x70,0x01,0xc7,0x21,0x47,0xd0,0x1d,0xb9,0x4d,0x7a,0x80,0x28,
    0xf4,0x2d,0x45,0x0b,0xc2,0x3d,0xc4,0xe5,0x41,0x54,0x22,0x22,0x8d,0x56,0xc2,0x7b,
    0x88,0x47,0x8e,0x10,0xdc,0xee,0xf0,0xb2,0x98,0x3f,0x55,0x79,0x96,0x4d,0x9a,0x0d,
    0x13,0xc3,0xef,0x6f,0x0d,0xcb,0x30,0xa1,0x05,0xe8,0xb2,0xec,0x60,0x44,0x00,0x51,
    0xd1,0xcd,0xae,0x7c,0xcf,0xf2,0x39,0x95,0x0e,0xfe,0x04,0x94,0xa2,0x59,0x3c,0xa3,
    0xac,0x6c,0xa4,0x6b,0x69,0x3e,0xdd,0xb5,0xf1,0xa3,0x5f,0x77,0x26,0x9b,0xe9,0xf3,
    0x0e,0x14,0x7e,0x01,0xcb,0xed,0x8f,0x3f,0x5e,0x9b,0x0f,0x27,0xb1,0x4b,0xbe,0x39,
    0x20,0x7e,0xe4,0x3a,0xf5,0x18,0xb4,0xe2,0x4c,0xf7,0x00,0x85,0x61,0x32,0x11,0xde,
    0xad,0x92,0xab,0xc1,0x7d,0xe5,0x79,0x60,0x8a,0xbc,0xf2,0xa5,0x1c,0xbb,0x8c,0x5e,
    0x5c,0x00,0x7e,0xc0,0x2a,0x04,0x9c,0x62,0x31,0x1c,0xb5,0xaa,0xc2,0xa0,0xbb,0x82,
    0x5e,0xaa,0x2c,0x31,0x62,0xe7,0xa4,0x4d,0x5f,0x1e,0x3a,0x71,0xba,0x63,0x7b,0x76,
    0x9a,0x2f,0x04,0xfd,0xbc,0x8a,0x2d,0xff,0xfc,0x50,0x27,0x7c,0x32,0x43,0x38,0xfb

[byte[]] $amitestpk03 =
    0x9c,0x18,0x19,0x79,0xcd,0x2e,0x05,0xc9,0xf5,0x29,0x24,0x5b,0xf8,0x8e,0x7f,0x40,
    0x9a,0x91,0x70,0xbe,0x14,0xd9,0xfe,0xa2,0xd8,0xfd,0x33,0x60,0xe0,0x6f,0x57,0x78,
    0xf4,0x0a,0x44,0x2a,0xd8,0xf5,0xcb,0x23,0x04,0x67,0x7f,0x25,0x0f,0xcc,0x27,0x77,
    0x6b,0x2f,0x8e,0xe3,0x1c,0xf8,0xad,0x9a,0x33,0xb8,0x0c,0x26,0xa4,0xd4,0x41,0xa2,
    0x38,0x56,0xdc,0xeb,0x74,0x33,0xe0,0x61,0x09,0xbf,0x79,0xa9,0xbb,0x7c,0x72,0xf8,
    0x0d,0x22,0xfa,0x4e,0xb8,0x2e,0xed,0xa7,0xda,0xe3,0x2f,0x13,0x9b,0x14,0x96,0xe8,
    0x4a,0x8a,0x80,0xcd,0x85,0x63,0x88,0x4f,0xd8,0xc8,0xcc,0x1d,0x9a,0x32,0x4f,0xdb,
    0xa9,0x56,0x30,0xfe,0x79,0x89,0xe7,0xfd,0x66,0xb0,0x3f,0x89,0x8f,0x4d,0xd7,0x23,
    0x8c,0xaf,0x3b,0x83,0x23,0x8c,0xb3,0x0b,0x2c,0xfc,0xa7,0xcb,0x9b,0xc2,0x2f,0xaa,
    0x12,0x1e,0xbe,0x83,0x8c,0xb3,0x2f,0x77,0xb9,0x0d,0x37,0xc3,0x59,0x12,0x2c,0x9f,
    0x4d,0x0d,0x37,0x47,0xad,0xa9,0x92,0x7a,0x14,0xe5,0x62,0xd1,0x22,0x7d,0xaf,0x03,
    0x25,0x6d,0xb0,0x64,0xe6,0xcf,0xf6,0x5e,0x88,0xf6,0xae,0xf5,0x07,0x84,0x82,0x9f,
    0x4c,0x0d,0x57,0x2f,0x55,0xf7,0x79,0x30,0x54,0x61,0x69,0xef,0x8c,0x93,0x8f,0xee,
    0xe4,0x74,0xe6,0x29,0xc2,0x2c,0x1a,0xef,0x19,0x78,0x42,0xd7,0xf0,0xdd,0x13,0x35,
    0x3a,0xf1,0x65,0xbb,0xfc,0x11,0xa4,0x7e,0x74,0x3f,0x12,0xff,0xdc,0xbf,0xbd,0xe8,
    0x1f,0x1a,0xb4,0xa3,0x90,0x74,0xcf,0x20,0x92,0xeb,0x39,0x63,0xb5,0xb0,0xa3,0xe9


$amitestpk00path = ".\AmiTestPk00.p7"
$amitestpk01path = ".\AmiTestPk01.p7"
$amitestpk02path = ".\AmiTestPk02.p7"
$amitestpk03path = ".\AmiTestPk03.p7"

$KnownAmiTestPK = @(
    @($amitestpk00, $amitestpk00path),
    @($amitestpk01, $amitestpk01path),
    @($amitestpk02, $amitestpk02path),
    @($amitestpk03, $amitestpk03path)
)

$global:AmiTestPkPath = $null

function Verify-WindowsOemPk
{
    $pkinbyte = (Get-SecureBootUEFI -Name pk).Bytes
    $pkinhexstring = ($pkinbyte | ForEach-Object ToString X2) -join ''
    $windowsoempkstring = ($windowsoempk | ForEach-Object ToString X2) -join ''
    if ($pkinhexstring -Match $windowsoempkstring)
    {
        return $true
    }

    return $false
}

function Verify-AmiTestPk
{
    $pkinbyte = (Get-SecureBootUEFI -Name pk).Bytes
    $pkinhexstring = ($pkinbyte | ForEach-Object ToString X2) -join ''
    foreach($key in $KnownAmiTestPK)
    {
        $amitestpkstring = ($key[0] | ForEach-Object ToString X2) -join ''
        if ($pkinhexstring -Match $amitestpkstring)
        {
            $global:AmiTestPkPath = $key[1]
            return $true
        }
    }

    return $false
}

if ($confirm)
{
    if (Verify-AmiTestPk)
    {
        Write-Output "[INFO] AMI Test key found in PK. AMI PK update is needed."
    }
    if (Verify-WindowsOemPk)
    {
        Write-Output "[INFO] Windows OEM PK already exists in PK."
    }
    else
    {
        Write-Output "[INFO] Windows OEM PK not found in PK."
    }
        
    Write-Output "[INFO] Exiting: 0"
    exit 0
}

Write-Output "[INFO] Verifying if AMI Test cert is in PK..."
if (!(Verify-AmiTestPk) -or ($global:AmiTestPkPath -eq $null))
{
    Write-Output "[INFO] AMI Test key not found in PK. No need for update."
    Write-Output "[INFO] Exiting: 0"
    exit 0
}
Write-Output "[INFO] Verified AMI Test cert in PK."

$content = ".\Ami-windowspk_content.bin"
$signature = $global:AmiTestPkPath

Write-Output "[INFO] Verifying required files present under the directory..."
if (!(Test-Path -Path $content) -or !(Test-Path -Path $signature))
{
    Write-Output "[ERROR] Required files not found under the current path."
    Write-Output "[ERROR] Exiting: 1"
    exit 1
}
Write-Output "[INFO] Verified."

Write-Output "[INFO] Checking Bitlocker status..."

$operatingsystemvolume = Get-BitlockerVolume | where {$_.VolumeType -eq "OperatingSystem" -and $_.ProtectionStatus -eq "On"}
$bitlockersuspended = $null

if ($operatingsystemvolume)
{
    Write-Output "[INFO] Bitlocker is enabled on OS volume. Temporarily suspending until next boot."
    $mountpoint = $operatingsystemvolume.MountPoint
    Suspend-Bitlocker -MountPoint $mountpoint -RebootCount 1

    if(Get-BitlockerVolume | where {$_.VolumeType -eq "OperatingSystem" -and $_.ProtectionStatus -eq "On"})
    {
        Write-Output "[INFO] Second attempt..."
        $DebugPreference = "Continue"
        Suspend-Bitlocker -MountPoint $mountpoint -RebootCount 1
        $DebugPreference = "SilentlyContinue"
        if(Get-BitlockerVolume | where {$_.VolumeType -eq "OperatingSystem" -and $_.ProtectionStatus -eq "On"})
        {
            Write-Output "[ERROR] Failed suspending Bitlocker."
            Write-Output "[ERROR] Exiting: 1"   
            exit 1
        }
    }

    Write-Output "[INFO] Bitlocker is suspended on Operating System volume."
    $bitlockersuspended = $mountpoint
}
else
{
    Write-Output "[INFO] Bitlocker is not enabled on Operating System volume."
}

Write-Output "[INFO] Attempting set PK..."
$uefivar = Set-SecureBootUefi -Name PK -ContentFilePath $content -SignedFilePath $signature -Time 2024-12-31T23:56:59Z
if ($uefivar)
{
    Write-Output "[INFO] Set PK command completed. Reboot is required for PK update to take effect."
    Write-Output "[INFO] Now force restarting computer..."
    Restart-Computer -force
}
else{
    Write-Output "[ERROR] Failed setting PK variable."
    if ($bitlockersuspended -ne $null)
    {
        Write-Output "[INFO] Bitlocker was previously suspended. Resuming Bitlocker protection..."
        Resume-Bitlocker -Mountpoint $bitlockersuspended
        if(Get-BitlockerVolume | where {$_.VolumeType -eq "OperatingSystem" -and $_.ProtectionStatus -eq "On"})
        {
            Write-Output "[INFO] Success."
            Write-Output "[INFO] Exiting: 0"
            exit 0
        }
        Write-Output "[ERROR] Failed resuming Bitlocker. Please resume Bitlocker manually from Bitlocker Drive Encryption setting page."
    }
    Write-Output "[ERROR] Exiting: 1"
    exit 1
}
