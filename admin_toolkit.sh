#!/bin/bash
# This tells Linux to execute the Script using the Bash Shell . 
#  Without this, the system might run it with another shell ( like sh, ksh) , which can cause errors.

# ===========================================
#	Linux Admin Toolkit 
#   System Health + User Management + Log Analyzer 
#   With Logging to /var/log/sys_health.log
# ============================================


LOGFILE="/var/log/sys_health.log"
# This creates a variable called LOGFILE.
# It stores the path where logs will be saved.
# The script will write all system maintenance logs into : /var/log/sys_health.log
# If the File doesn't exist, Linux will create it automatically when you write into it ( as long as /var/log/ directory exists). 

DATE=$(date +"%Y-%m-%d %H:%M:%S")
# Stores Current TimeStamp in readable Format
# Gives output like : 2025-11-22 18:01:10
# The date is stored in the Variable DATE.



# Make sure Log file exits ( No error if log file is already exits)

sudo touch "$LOGFILE"
sudo chmod 644 "$LOGFILE"


echo "========= Script Started at $DATE =========" | sudo tee -a $LOGFILE > /dev/null
# ----------------------------------------
# if you don't want so much of data you can empty the logs also using this comamnd 
# -------------------------------------
#  truncate -s 0 /var/log/sys_health.log
# --------------------------------------


# --------------------------------------------------
# Function 1 : System Health Monitor ( With logfile output )
# -------------------------------------------------

system_health() {

	echo ""
	echo "------- System Health Report -------"
	echo "TimeStamp: $DATE"
	echo "Log File generated at /var/log/sys_health.log location"
	echo "*******************************"
	echo ""

	{
		 echo ""
		 echo "------- System Health Report -------"
		 echo "TimeStamp: $DATE"
		 echo ""

		 echo "### CPU Usage ###"
	         top -bn1 | grep "Cpu(s)"

# *********
# top -bn1 = batch mode ( Non - Interactive ), 1 iteration
# grep extracts only the CPU Summary Line
# *********

		echo ""
		echo "### Memory Usage ###"
		free -h
 
		echo ""
		echo "### Disk Usage ###"
		df -hT

		echo ""
		echo "### Top 5 CPU-Consuming Processes ###"
		ps -eo pid,ppid,cmd,%mem,%cpu --sort=%cpu | head -n 6

		echo ""
		echo "----------------------------------------"
		echo ""
	} | sudo tee -a "$LOGFILE" > /dev/null

}

# -----------------------------------------------------
# Function 2 : User Management Menu 
# -----------------------------------------------------


user_management() {
	
	while true; do

		echo ""
		echo "=========== User Management ============"
		echo "1) Add User "
		echo "2) Delete User "
		echo "3) List all Users"
		echo "4) Reset User Password"
		echo "5) Back to Main Menu"
		echo ""

		read -p "Please enter your option (User-Menu):" um_choice

		case $um_choice in
			1)
				read -p "Enter username to add: " usr
				sudo useradd "$usr" && echo "User '$usr' created."
				;;
			2)
				read -p "Enter username to delete: " usr
				sudo userdel "$usr" && echo "User '$usr' deleted."
				;;
			3)
				echo "### Listing all users ###"
				cut -d: -f1 /etc/passwd
				;;
			4)
				read -p "Enter username to reset password: " usr
				sudo passwd "$usr"
				;;
			5)
				return
				;;
			*)
				echo "Invalid Choice!!"
				;;
		esac
	done
}

# ------------------------------------------------
#  Delete Correct auth log file for Log Analyzer
# -------------------------------------------------

AUTH_LOG=""
if [ -f /var/log/auth.log ];
then
	AUTH_LOG="/var/log/auth.log"
elif [-f /var/log/secure ];
then
	AUTH_LOG="/var/log/secure"
else
	echo "No authentication log found!"
fi



# ----------------------------------------------
#  Function 3 : Log Analyzer
# ----------------------------------------------

log_analyzer() {
	echo ""
	echo "===== LOG Analyzer ===== "
	echo "Analyzing: $AUTH_LOG"
	
	echo ""
	echo "### Failed Login Attempts ###"
	grep "Failed password" "$AUTH_LOG" | wc -l

	echo ""
	echo "###Successful Logins ###"
	grep "Accepted Password" "$AUTH_LOG" | wc -l

	echo ""
	echo "### Top 10 Failed login IPs ###"
	grep "Failed password" "$AUTH_LOG" \
		| awk '{print $(NF-3)}' \
		| sort | uniq -c | sort -nr | head

	echo ""
	echo "### Top Attacked Username ###"
	grep "Failed password" "$AUTH_LOG" \
		| awk -F 'for' '{print $2}' \
		| awk '{print $1}' \
		| sort | uniq -c | sort -nr | head

	echo ""
	echo "### Last 10 Security logs ###"
	tail -n 10 "$AUTH_LOG"

	echo ""
}


# --------------------------------------------
# MAIN MENU
# --------------------------------------------


while true; do
	echo ""
	echo "=============================="
	echo "	  Linux Admin Toolkit 	    "
	echo "=============================="
	echo "1) System Health Monitoring "
	echo "2) User Management "
	echo "3) Log Analyzer "
	echo "4) Exit "
	echo ""

	read -p "Enter your choice: " choice

	case $choice in
		1) system_health ;;
		2) user_management ;;
		3) log_analyzer ;;
		4) echo "Goodbye!"; exit 0 ;;
		*) echo "Invalid option. Try again." ;;
	esac
done
