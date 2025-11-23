Linux Admin Toolkit
=================
A Complete System Health, User Management & Log Analysis Bash Automation Script
---------------------
The Linux Admin Toolkit is an interactive Bash-based automation tool designed for Linux system administrators.
It provides system health monitoring, user management, and security log analysis, all packaged into one menu-driven script.

Usage
---------------------
Execution: ./admin_toolkit.sh

📌 Features Overview
============================

✅ 1. System Health Monitoring
------------------------------------

Provides real-time system resource usage:

CPU usage summary

Memory usage (free -h)

Disk usage with filesystem types (df -hT)

Top CPU-consuming processes

Auto-logging into: /var/log/sys_health.log

✅ 2. User Management Module
---------------------------------

Interactive menu-driven user administration:

Add new user

Delete user

List all system users

Reset passwords

Uses safe sudo wrappers for system modifications

✅ 3. Log Analyzer
-------------------------

Analyzes authentication logs (/var/log/auth.log or /var/log/secure):

Count failed login attempts

Count successful login attempts

Identify top attacking IPs

Determine most-targeted usernames

Display last 10 security-related log entries
