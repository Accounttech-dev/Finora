#Script to replace "Digits" with "Finora" and add "Get started" buttons across all pages
Write-Host "Starting Digits to Finora replacement and Get Started button addition..." -ForegroundColor Cyan
Write-Host ""

# Get all HTML files
$htmlFiles = Get-ChildItem -Path "C:\projects\ai" -Filter "*.html" -Recurse | 
    Where-Object { 
        $_.FullName -notmatch "\\node_modules\\" -and 
        $_.FullName -notmatch "\\.git\\" -and
        $_.FullName -notmatch "\\hts-cache\\"
    }

$totalFiles = $htmlFiles.Count
$filesModified = 0

Write-Host "Found $totalFiles HTML files to process" -ForegroundColor Green
Write-Host ""

foreach ($file in $htmlFiles) {
    $relativePath = $file.FullName.Replace("C:\projects\ai\", "")
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    $fileModified = $false
    
    # Task 1: Replace visible "Digits" text with "Finora"
    # Be careful to preserve URLs and structure
    $replacements = @(
        @{Pattern = "Switch to Digits today"; Replacement = "Switch to Finora today"}
        @{Pattern = "powered by Digits"; Replacement = "powered by Finora"}
        @{Pattern = "Use Digits with ease"; Replacement = "Use Finora with ease"}
        @{Pattern = "Real results, powered by Digits"; Replacement = "Real results, powered by Finora"}
    )
    
    foreach ($replacement in $replacements) {
        if ($content -match [regex]::Escape($replacement.Pattern)) {
            $content = $content -replace [regex]::Escape($replacement.Pattern), $replacement.Replacement
            $fileModified = $true
        }
    }
    
    # Task 2: Add "Get started" button by removing "no-sign-up-button" class
    if ($content -match 'header-cta no-sign-up-button') {
        # Remove the "no-sign-up-button" class
        $content = $content -replace 'class="header-cta no-sign-up-button"', 'class="header-cta"'
        
        # Look for the empty menu item pattern and replace with Get started button
        $emptyItemPattern = '(<li class="cta-menu-item" data-astro-cid-u4eztjub>)\s*?(</li>)'
        $getStartedButton = '$1 <a href="/contact-us/" id="get-started-button" class="cta cta--small" data-astro-cid-u4eztjub="true" data-astro-cid-i4xokolx style="--bg: var(--negative-color);--textColor: var(--positive-color);--border: transparent;--hoverBg: var(--color-green);--hoverText: var(--color-black);--hoverBorder: transparent;--focusColor: var(--color-green);--width: auto;">Get started</a> $2'
        
        if ($content -match $emptyItemPattern) {
            $content = $content -replace $emptyItemPattern, $getStartedButton
            Write-Host "  ✓ Added Get Started button: $relativePath" -ForegroundColor Green
        }
        
        $fileModified = $true
    }
    
    # Save the file if modified
    if ($fileModified) {  
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        $filesModified++
        Write-Host "  ✓ Updated: $relativePath" -ForegroundColor Cyan
    }
}

Write-Host ""
Write-Host "========================================"  -ForegroundColor Cyan
Write-Host "Update Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Total files modified: $filesModified" -ForegroundColor Green
Write-Host ""
