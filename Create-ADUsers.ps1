# Define a function to prompt the user to specify whether the user(s) should be enabled or disabled.
function Get-UserEnabledStatus {
    while ($true) {
        Write-Host ""
        $response = Read-Host "Do you want the user(s) enabled (Y/N)?"
        if ($response -eq "Y" -or $response -eq "y") {
            return $true
        } elseif ($response -eq "N" -or $response -eq "n") {
            return $false
        } else {
            Write-Host ""
            Write-Host "Invalid response. Please enter 'Y' for enabled or 'N' for disabled."
        }
    }
}

# Define a function to check if a file exists at the specified path.
function Find-File {
    param (
        [string]$FilePath
    )

    if (Test-Path -Path $FilePath -PathType Leaf) {
        # File exists, continue
    } else {
        Write-Host ""
        Write-Host "File '$FilePath' not found." -BackgroundColor Black -ForegroundColor Red
        Write-Host ""
        Write-Host "Exiting..."
        exit
    }
}

# Define a function to test the complexity of an Active Directory password.
function Test-ADPasswordComplexity {
    param (
        [string]$Password
    )

    # Define complexity requirements
    $minLength = 8
    $requireUppercase = $true
    $requireLowercase = $true
    $requireDigit = $true
    $requireSpecialCharacter = $true

    # Check password length
    if ($Password.Length -lt $minLength) {
        return $false
    }

    # Check for uppercase character
    if ($requireUppercase -and $Password -notmatch "[A-Z]") {
        return $false
    }

    # Check for lowercase character
    if ($requireLowercase -and $Password -notmatch "[a-z]") {
        return $false
    }

    # Check for digit
    if ($requireDigit -and $Password -notmatch "[0-9]") {
        return $false
    }

    # Check for special character (you can customize the character class as needed)
    if ($requireSpecialCharacter -and $Password -notmatch "[@#$%^&+=!]") {
        return $false
    }

    # Password meets complexity requirements
    return $true
}

# Main script starts here

# Display introductory messages
Write-Host ""
Write-Host "This script will add users from a CSV File"
sleep 2
Write-Host ""

# Get file path
$FilePath = Read-Host "Type the relative or absolute path of your CSV file"

# Check if file path exists
Find-File -FilePath $FilePath

# Prompt the user for a secure password, confirm password, and ensure it meets complexity requirements
Write-Host ""
Write-Host "First, select a password for your new users..."
sleep 2

while ($true) {
    try {
        Write-Host ""
        $pw1 = Read-Host "Select a secure password for these users" -AsSecureString
        $pw2 = Read-Host "Confirm the password" -AsSecureString

        # Convert secure strings to plain text
        $pw1PlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pw1))
        $pw2PlainText = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pw2))

        if ($pw1PlainText -ne $pw2PlainText) {
            Write-Host ""
            Write-Host "Passwords do not match. Please try again." -BackgroundColor Black -ForegroundColor Red
            continue
        } else {
            if (Test-ADPasswordComplexity -Password $pw1PlainText) {
                Write-Host ""
                Write-Host "Password meets complexity requirements." -BackgroundColor Black -ForegroundColor Green
                break
            } else {
                Write-Host "Password does not meet complexity requirements." -BackgroundColor Black -ForegroundColor Red
                continue
            }
        }
    } catch {
        Write-Host ""
        Write-Host "An error occurred: $_" -BackgroundColor Black -ForegroundColor Red
        Write-Host "Exiting..."
        exit
    }
}

# Determine whether the user(s) should be enabled or disabled
$isEnabled = Get-UserEnabledStatus

# Import user data from a CSV file and create new AD users
try {
    Import-Csv ".\users.csv" | New-ADUser -AccountPassword $pw1 -ChangePasswordAtLogon $true -Enabled $isEnabled
} catch {
    Write-Host ""
    Write-Host "An error occurred while creating user accounts: $_" -BackgroundColor Black -ForegroundColor Red
    Write-Host ""
    exit
}
