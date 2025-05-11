#!/bin/bash 

THRESHOLD=70

CURRENT_TIME=$(date "+%Y-%m-%d %H:%M:%S")

echo "System Monitoring Alert - $CURRENT_TIME"
echo ""     

echo "System Monitoring Report - $CURRENT_TIME"
echo "========================================="
echo ""     
echo "Disk Usage:"

df -h | grep -v 'snap' | awk '{print $0}'
echo        
echo "=================="

df -h | grep -v 'snap' | awk -v threshold=$THRESHOLD 'NR>1 {gsub("%","",$5); if ($5 > threshold) {printf "\033[31mWarning: %s is above 70%%\033[0m\n", $1}}'
echo        
echo "========================================="
echo        

echo "CPU Usage:"

cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo "Current CPU Usage: $cpu_usage%"

if [ "$(echo "$cpu_usage > $THRESHOLD" | bc)" -eq 1 ]; then
    echo -e "\033[31mWarning: The CPU usage percentage is greater than 70%\033[0m"
fi


echo        
echo "========================================="
echo        
echo "Memory Usage:"
echo         
             
total_memory=$(free -m | awk 'NR==2 {print ($2 / 1024)}')
used_memory=$(free -m | awk 'NR==2 {print ($3 / 1024)}')
free_memory=$(free -m | awk 'NR==2 {print ($4 / 1024)}')
cached_memory=$(free -m | awk 'NR==2 {print ($5 / 1024)}')
             
echo "Total Memory       : $total_memory GB"
echo "Used Memory        : $used_memory GB"
echo "Buff/Cached Memory : $cached_memory GB"
echo "Free Memory        : $free_memory GB"
             
used_memory_percentage=$(free -m | awk 'NR==2 {print ($3/$2)*100}')

if [ "$(echo "$used_memory_percentage > $THRESHOLD" | bc)" -eq 1 ]; then
    echo -e "\033[31mWarning: The Used memory percentage is greater than 70%\033[0m"
fi           
             
echo         
echo "========================================="
echo         
             
echo "$(ps -eo pid,comm,%mem --sort=-%mem | head -n 5)"
`
