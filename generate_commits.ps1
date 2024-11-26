# Configuration
$commitCount1 = 300  # First set of commits (Dec 2023 - May 2024)
$commitCount2 = 200  # Second set of commits (Jul 31, 2024 - Aug 31, 2024)

# Date Ranges
$startDate1 = Get-Date -Year 2023 -Month 12 -Day 1
$endDate1 = Get-Date -Year 2024 -Month 5 -Day 31

$startDate2 = Get-Date -Year 2024 -Month 7 -Day 31
$endDate2 = Get-Date -Year 2024 -Month 8 -Day 31

# Commit messages (examples to avoid repetitive commit messages)
$messages = @(
    "Updated documentation for clarity",
    "Fixed minor bugs in calculation module",
    "Improved performance of result rendering",
    "Added validation checks to input forms",
    "Refactored code for better readability",
    "Enhanced security features",
    "Optimized database queries",
    "Resolved issue with date formatting",
    "Adjusted UI layout for better user experience",
    "Updated dependencies to latest versions",
    "Improved error handling",
    "Added new API endpoint",
    "Updated README with setup instructions",
    "Code cleanup and formatting",
    "Removed deprecated functions",
    "Refactored backend service structure",
    "Enhanced responsiveness of UI",
    "Fixed typos in comments and logs"
)

# Realistic file names (examples)
$fileNames = @(
    "app.js",
    "index.html",
    "style.css",
    "main.py",
    "README.md",
    "config.json",
    "routes.js",
    "database.sql",
    "login.html",
    "register.html",
    "utils.py",
    "dashboard.css",
    "profile.html",
    "api.js",
    "validators.py",
    "server.js",
    "data.csv",
    "footer.html",
    "header.html",
    "tests.py",
    "error.log",
    "package.json"
)

# Function to generate commits within a date range
function Generate-Commits {
    param (
        [int]$commitCount,
        [datetime]$startDate,
        [datetime]$endDate
    )

    for ($i = 1; $i -le $commitCount; $i++) {
        # Generate a random date between the start and end dates
        $randomDate = Get-Random -Minimum $startDate.Ticks -Maximum $endDate.Ticks | ForEach-Object { New-Object DateTime $_ }

        # Format date for Git (ISO 8601 format)
        $commitDate = $randomDate.ToString("yyyy-MM-ddTHH:mm:ss")

        # Pick a random message
        $commitMessage = $messages | Get-Random

        # Pick a random file name
        $fileName = $fileNames | Get-Random

        # Simulate a small change in the file (or create the file if it doesn't exist)
        Add-Content -Path $fileName -Value "Temporary update at $randomDate for commit $i"

        # Add and commit the file with a backdated timestamp
        git add $fileName
        git commit -m "$commitMessage" --date="$commitDate"
    }
}

# Generate the first set of commits (Dec 2023 - May 2024)
Write-Host "Generating 300 commits between Dec 2023 and May 2024..."
Generate-Commits -commitCount $commitCount1 -startDate $startDate1 -endDate $endDate1

# Generate the second set of commits (Jul 31, 2024 - Aug 31, 2024)
Write-Host "Generating 200 commits between Jul 31, 2024 and Aug 31, 2024..."
Generate-Commits -commitCount $commitCount2 -startDate $startDate2 -endDate $endDate2

Write-Host "Generated all commits successfully!"
