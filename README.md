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
- [CSV Customization](#csv-customization)


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

2. **Prepare CSV File**: Create a CSV file or use the sample provided (`users.csv`) which includes the following attributes:

   - SamAccountName
   - Name
   - GivenName
   - Surname
   - DisplayName
   - Department

   You can add additional attributes as needed.
   
      <div align="center">
<img src="https://github.com/infinity-set/ActiveDirectory_UserCreation_Script/assets/142350896/dc638550-76e2-44df-93e0-e3df27a5b309" height="60%" width="60%" alt="CSV FIle Example"/>
<br />   
   </div>
   <br /> 

4. **Run the Script**: Open PowerShell, navigate to the script directory, and run the script using the following command:

   ```powershell
   .\Create-ADUsers.ps1

   ```

<br /> 

5. **Follow Prompts:**: The script will prompt you for the CSV file path, a secure password for user accounts, and whether to enable or disable user accounts.

   <div align="center">
<img src="https://github.com/infinity-set/ActiveDirectory_UserCreation_Script/assets/142350896/f07cd4f6-6eb4-4763-9446-9a30c8b6e6e1" height="60%" width="60%" alt="Running Script Command Prompt View"/>
<br />   
   </div>
   <br /> 

6. **User Account Creation:** Navigate to `Active Directory Users and Computers` to view your new users.

      <div align="center">
<img src="https://github.com/infinity-set/ActiveDirectory_UserCreation_Script/assets/142350896/a2a49ef4-ec80-4f81-96db-bd35a7c7b844" height="60%" width="60%" alt="View of New Users"/>
<br /> 

## CSV Customization

To tailor user attributes according to your requirements, you'll need to edit your CSV file. Here's how to get started:

1. Open your CSV file using a text editor or spreadsheet software.
2. Refer to the available attributes that can be configured for user accounts in Active Directory. You can find detailed information about these attributes in the [Active Directory Schema Attributes documentation](https://learn.microsoft.com/en-us/windows/win32/adschema/attributes-all).

   - **Example Attributes:**
     - `GivenName`: The first name of the user.
     - `Surname`: The last name of the user.
     - `DisplayName`: The display name for the user.
       
3. Customize your CSV file by adding, modifying, or removing attributes as needed. Ensure that the CSV columns match the attribute names exactly to avoid issues during user creation.

4. Save your CSV file with the changes you made.

Now, your CSV file is ready to be used with the script for creating user accounts in Active Directory, tailored to your specific attribute requirements.

 <div align="center">
<br/>
<img src="https://github.com/infinity-set/ActiveDirectory_UserCreation_Script/assets/142350896/09878d6e-aea2-4b8f-af8b-06e610f885ee" height="100%" width="100%" alt="Attributes View and User View"/>
<br />   
 </div>


#
<br>

⬅️ **[Home](https://github.com/infinity-set)**
