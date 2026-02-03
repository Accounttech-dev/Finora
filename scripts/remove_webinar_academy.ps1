# PowerShell script to remove "Join a Webinar" and "Digits Academy" menu items from all HTML files
# These items appear in the Accountants dropdown menu (desktop and mobile nav)

$projectRoot = "c:\projects\ai"
$totalUpdated = 0

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $projectRoot -Filter "*.html" -Recurse

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Pattern for "Join a Webinar" - matches the entire li element with multiline content
    # Match from <li class="dropdown-item"> ... Join a Webinar ... </a> </li>
    $pattern1 = '(?s)<li class="dropdown-item">\s*<a href="https://events\.zoom\.us/e/view/GuqSTdOdS3uuUQ_jfWk8NA"[^>]*>.*?Join a Webinar.*?</a>\s*</li>'
    $content = $content -replace $pattern1, ''
    
    # Pattern for "Digits Academy" - matches the entire li element with multiline content
    # URL with trailing slash
    $pattern2 = '(?s)<li class="dropdown-item">\s*<a href="https://academy\.digits\.com/"[^>]*>.*?Digits Academy.*?</a>\s*</li>'
    $content = $content -replace $pattern2, ''
    
    # Pattern for "Digits Academy" - URL without trailing slash
    $pattern3 = '(?s)<li class="dropdown-item">\s*<a href="https://academy\.digits\.com"[^>]*>.*?Digits Academy.*?</a>\s*</li>'
    $content = $content -replace $pattern3, ''

    if ($content -ne $originalContent) {
        # Write the updated content back to the file
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
        Write-Host "Updated: $($file.FullName)"
        $totalUpdated++
    }
}

Write-Host ""
Write-Host "====================================="
Write-Host "Total files updated: $totalUpdated"
Write-Host "====================================="
