# Active Directory User Creation Script

## Overview

Welcome to the Active Directory User Creation Script! This PowerShell script simplifies the process of creating user accounts in Active Directory from a CSV file. Whether you need to add multiple users with specific attributes or automate user provisioning, this tool can help streamline the process.

Read on to learn how to effectively use the script and understand its benefits.

## Table of Contents

- [Why Use This Script](#why-use-this-script)
- [Languages and Utilities Used](#languages-and-utilities-used)
- [Environments Used](#environments-used)
- [Prerequisites](#prerequisites)
- [Instructions](#instructions)
- [Script Structure](#script-structure)
- [License](#license)
- [Contributions](#contributions)

## Why Use This Script

- **Efficient User Creation**: This script allows you to create user accounts in Active Directory quickly and accurately, especially when adding multiple users at once.

- **Customization**: You can customize the CSV file to include user attributes like department, display name, and more, making it adaptable to your specific needs.

- **Password Complexity Check**: The script includes a password complexity check to ensure that user passwords meet security requirements.

- **Enable/Disable Users**: You can choose whether to enable or disable user accounts during creation, providing flexibility in user account management.

## Languages and Utilities Used

- **PowerShell**

[<img alt="PowerShell Icon" width="50px" src="https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg?sanitize=true" />][powershell]

[powershell]: https://learn.microsoft.com/en-us/powershell/

## Environments Used

- **Windows**

[<img align="left" alt="Microsoft Icon" width="35px" src="https://upload.wikimedia.org/wikipedia/commons/3/34/Windows_logo_-_2012_derivative.svg" />][windows]

[windows]: https://www.microsoft.com/

<br /><br />

## Prerequisites

Before using this script, ensure you have the following:

- Active Directory module installed on your computer.
- Sufficient permissions to create user accounts in Active Directory.

## Instructions

Follow these steps to use the script:

1. **Clone or Download**: Clone or download this repository to your local machine.

2. **Prepare CSV File**: Example: Create a CSV file with the following columns for user attributes:

   - SamAccountName
   - Name
   - GivenName
   - Surname
   - DisplayName
   - Department

   You can add additional attributes as needed.

3. **Run the Script**: Open PowerShell, navigate to the script directory, and run the script using the following command:

   ```powershell
   .\Create-ADUsers.ps1

   ```

4. **Follow Prompts:**: The script will prompt you for the CSV file path, a secure password for user accounts, and whether to enable or disable user accounts.

5. **User Account Creation:** Navigate to Active Directory Users and Computers to view your new users.
