# Display options
Write-Host "Select duration to keep system awake:"
Write-Host "1. 2 hours"
Write-Host "2. 4 hours"
Write-Host "3. 8 hours"
Write-Host "4. 24 hours"
# Get user input
$choice = Read-Host "Enter your choice (1-4)"
# Set duration based on choice
switch ($choice) {
"1" { $duration = 2 }
"2" { $duration = 4 }
"3" { $duration = 8 }
"4" { $duration = 24 }
default {
Write-Host "Invalid choice. Exiting..."
exit
}
}
# Convert hours to seconds
$totalSeconds = $duration * 3600
$elapsed = 0
# Load required assembly
Add-Type -AssemblyName System.Windows.Forms
Write-Host "Keeping system awake for $duration hour (s)..."
# Loop until time is up
while ($elapsed -lt $totalSeconds) {
[System.Windows.Forms.SendKeys]::SendWait("{SCROLLLOCK}") 
Start-Sleep -Seconds 60
$elapsed += 60
}
Write-Host "Done. System can now sleep normally."
