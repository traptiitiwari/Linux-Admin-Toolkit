Linux Admin Toolkit
=================
A Complete System Health, User Management & Log Analysis Bash Automation Script
---------------------
The Linux Admin Toolkit is an interactive Bash-based automation tool designed for Linux system administrators.
It provides system health monitoring, user management, and security log analysis, all packaged into one menu-driven script.

Usage
=============
To run the script:

<img width="411" height="55" alt="image" src="https://github.com/user-attachments/assets/04fd87d8-a055-476e-a6b4-c0c9bb73a9e5" />

Once executed, the script presents an interactive menu:

<img width="319" height="167" alt="image" src="https://github.com/user-attachments/assets/beb61ac3-c7d0-4f21-939f-beb290579808" />

Each module runs according to the option selected by the user.

----------------------

# Features Overview 

### The script consists of three major functionalities:

-----------------------------------------------------------------

## 1. System Health Monitoring

#### This module generates a detailed report of system resource usage and automatically logs it under:

###### /var/log/sys_health.log

#### Every time the script runs, a new entry is appended to the existing log file.
###### (You can clear the log anytime using: truncate -s 0 /var/log/sys_health.log)

### What this module displays:

##### CPU usage summary (from top)
##### Memory usage (free -h)
##### Disk usage with filesystem types (df -hT)
##### Top 5 CPU-consuming processes

### Sample Console Output

##### When the user selects option 1, the script prints:

<img width="494" height="121" alt="image" src="https://github.com/user-attachments/assets/01854cf1-d599-4fc1-ae92-b649073deba3" />

### Sample Logged Output (from sys_health.log)

<img width="600" height="517" alt="image" src="https://github.com/user-attachments/assets/f3bebef2-b799-4e54-83e6-460ca525e95f" />

###### Each run appends a new block, allowing you to maintain a historical performance audit.

## 2. User Management Module

#### This menu provides an interactive user administration system with safe sudo execution.

##### When selecting option 2, the user sees:

<img width="365" height="146" alt="image" src="https://github.com/user-attachments/assets/3e215906-9008-4db7-a942-c4a86a0f10b6" />

#### Sample Working

###### Adding a user

<img width="347" height="57" alt="image" src="https://github.com/user-attachments/assets/4e0f01a3-3231-4543-b4d4-47536a38c74d" />

###### Deleting a user

<img width="335" height="58" alt="image" src="https://github.com/user-attachments/assets/d13f1c0e-76c8-40ea-9b41-87862b3fd028" />

###### Listing all system users

<img width="427" height="423" alt="image" src="https://github.com/user-attachments/assets/de1cce96-85b5-415a-a2e0-197ae202b49d" />

###### Resetting a password

<img width="402" height="88" alt="image" src="https://github.com/user-attachments/assets/7eff7c72-6d54-4de7-8d78-16068569fe62" />

###### This module works in a loop, allowing multiple actions without restarting the script.


## 3. Log Analyzer

#### This module automatically detects the system's authentication log file:

###### /var/log/auth.log (Debian/Ubuntu)

###### /var/log/auth.log (Debian/Ubuntu)

It extracts security-related information such as login activity and brute-force attempts.

### What the Log Analyzer Reports

##### Failed login attempts count

##### Successful login attempts count

##### Top 10 IP addresses causing failed logins

##### Most targeted usernames

##### Last 10 security events

#### Sample Output (Option 3)

<img width="851" height="369" alt="image" src="https://github.com/user-attachments/assets/fd16edba-1a7a-400f-8120-e35642e0019f" />

###### This module is useful for auditing user activity and identifying potential unauthorized login attempts.

## Exit Option

#### Selecting option 4 cleanly exits the script:

<img width="429" height="156" alt="image" src="https://github.com/user-attachments/assets/eae93b2c-05a8-4f15-acde-e412e8f5b34f" />

##### If the user enters an invalid option, the script responds with:

<img width="418" height="152" alt="image" src="https://github.com/user-attachments/assets/9a4ad95f-54c3-405e-b18c-11ece2782d1c" />

###### This toolkit is designed to make Linux administration simpler, faster, and more efficient.
