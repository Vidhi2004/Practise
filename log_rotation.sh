#!/bin/bash

# Step 1: Accepting user input for log directory and time threshold
echo "Enter the directory where log files are located:"
read log_dir

echo "Enter the time threshold (in days) for log rotation:"
read threshold

# Step 2: Check if the directory exists
if [ ! -d "$log_dir" ]; then
    echo "Directory does not exist!"
    exit 1
fi

# Step 3: Finding and compressing old log files
find "$log_dir" -type f -name "*.log" -mtime +"$threshold" -exec gzip {} \;

# Step 4: Archiving rotated logs
archive_dir="$log_dir/archive"
mkdir -p "$archive_dir"
find "$log_dir" -type f -name "*.gz" -exec mv {} "$archive_dir" \;

# Step 5: Handling errors and ensuring proper operation
if [ $? -eq 0 ]; then
    echo "Log rotation and compression successful!"
else
    echo "An error occurred during log rotation."
fi

