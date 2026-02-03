# PowerShell script to update "Get Started" button to link to Contact Us page
# This script will replace the button element with an anchor link in all HTML files

$projectRoot = "c:\projects\ai"

# Get all HTML files recursively, excluding the contact-us page itself
$htmlFiles = Get-ChildItem -Path $projectRoot -Filter "*.html" -Recurse | Where-Object {
    $_.FullName -notlike "*contact-us*" -and
    $_.FullName -notlike "*\hts-cache\*"
}

Write-Host "Found $($htmlFiles.Count) HTML files to process..." -ForegroundColor Cyan

$updatedCount = 0

foreach ($file in $htmlFiles) {
    try {
        $content = Get-Content -Path $file.FullName -Raw -ErrorAction SilentlyContinue
        
        if ($null -eq $content) {
            continue
        }
        
        $originalContent = $content
        
        # Pattern 1: Desktop header button - replace button with anchor
        # Match: <button type="button" id="get-started-button" class="cta cta--small" data-modal="get-started" ... >Get started</button>
        # Replace with: <a href="/contact-us/" class="cta cta--small" ... >Get started</a>
        
        $pattern1 = '<button type="button" id="get-started-button"([^>]*?)data-modal="get-started"([^>]*?)>Get(\s*)started</button>'
        $replacement1 = '<a href="/contact-us/" id="get-started-button"$1$2 style="text-decoration: none;">Get$3started</a>'
        $content = $content -replace $pattern1, $replacement1
        
        # Pattern 2: Mobile header button
        # Match: <button type="button" id="get-started-button-mobile" class="cta cta--small get-started-button-mobile" data-modal="get-started" ... >Get started</button>
        $pattern2 = '<button type="button" id="get-started-button-mobile"([^>]*?)data-modal="get-started"([^>]*?)>Get(\s*)started</button>'
        $replacement2 = '<a href="/contact-us/" id="get-started-button-mobile"$1$2 style="text-decoration: none; display: block; text-align: center;">Get$3started</a>'
        $content = $content -replace $pattern2, $replacement2
        
        # Pattern 3: Generic Get started buttons with data-modal
        $pattern3 = '<button type="button"([^>]*?)class="cta([^"]*?)"([^>]*?)data-modal="get-started"([^>]*?)>Get(\s*)started</button>'
        $replacement3 = '<a href="/contact-us/"$1class="cta$2"$3$4 style="text-decoration: none;">Get$5started</a>'
        $content = $content -replace $pattern3, $replacement3
        
        # Check if content was modified
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -NoNewline
            Write-Host "Updated: $($file.FullName)" -ForegroundColor Green
            $updatedCount++
        }
    }
    catch {
        Write-Host "Error processing $($file.FullName): $_" -ForegroundColor Red
    }
}

Write-Host "`nCompleted! Updated $updatedCount files." -ForegroundColor Cyan
