# Script to replace "Digits" with "Finora" and add "Get started" buttons across all pages
# Author: Branding Update Script
# Date: 2026-02-03

Write-Host "Starting Digits to Finora replacement and Get Started button addition..." -ForegroundColor Cyan
Write-Host ""

# Get all HTML files in the project (excluding node_modules and .git)
$htmlFiles = Get-ChildItem -Path "C:\projects\ai" -Filter "*.html" -Recurse | 
    Where-Object { 
        $_.FullName -notmatch "\\node_modules\\" -and 
        $_.FullName -notmatch "\\.git\\" -and
        $_.FullName -notmatch "\\hts-cache\\"
    }

$totalFiles = $htmlFiles.Count
$filesModified = 0
$filesWithDigits = 0
$filesWithNoSignUpButton = 0

Write-Host "Found $totalFiles HTML files to process" -ForegroundColor Green
Write-Host ""

foreach ($file in $htmlFiles) {
    $relativePath = $file.FullName.Replace("C:\projects\ai\", "")
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    $fileModified = $false
    
    # Replace "Digits" with "Finora" (but preserve certain cases like "Digits " in URLs, etc.)
    # We'll replace visible text occurrences
    
    # Common text replacements
    $replacements = @{
        "Switch to Digits today" = "Switch to Finora today"
        "powered by Digits" = "powered by Finora"
        "Real results, powered by Digits" = "Real results, powered by Finora"
        "Use Digits with ease" = "Use Finora with ease"
        "Digits is" = "Finora is"
        "with Digits" = "with Finora"
        ">Digits<" = ">Finora<"
        " Digits " = " Finora "
        "the Digits" = "the Finora"
        "to Digits" = "to Finora"
        "on Digits" = "on Finora"
        "Join Digits" = "Join Finora"
        "about Digits" = "about Finora"
    }
    
    foreach ($key in $replacements.Keys) {
        if ($content -match [regex]::Escape($key)) {
            $content = $content -replace [regex]::Escape($key), $replacements[$key]
            $fileModified = $true
            $filesWithDigits++
        }
    }
    
    # Check if file has no-sign-up-button class and replace it with get started button
    if ($content -match 'class="header-cta no-sign-up-button"') {
        Write-Host "  Found no-sign-up-button in: $relativePath" -ForegroundColor Yellow
        
        # Replace the no-sign-up-button section with the get started button
        $oldPattern = '<div class="header-cta no-sign-up-button" data-astro-cid-u4eztjub> <menu class="cta-menu" aria-label="cta menu" data-astro-cid-u4eztjub> <li class="cta-menu-item" data-astro-cid-u4eztjub>  </li>  </menu> </div>'
        
        $newContent = '<div class="header-cta" data-astro-cid-u4eztjub> <menu class="cta-menu" aria-label="cta menu" data-astro-cid-u4eztjub> <li class="cta-menu-item" data-astro-cid-u4eztjub> <a href="/contact-us/" id="get-started-button" class="cta cta--small" data-astro-cid-u4eztjub="true" data-astro-cid-i4xokolx style="--bg: var(--negative-color);--textColor: var(--positive-color);--border: transparent;--hoverBg: var(--color-green);--hoverText: var(--color-black);--hoverBorder: transparent;--focusColor: var(--color-green);--width: auto;">Get started</a> </li>  </menu> </div>'
        
        $content = $content -replace [regex]::Escape($oldPattern), $newContent
        $fileModified = $true
        $filesWithNoSignUpButton++
        Write-Host "    ✓ Added Get Started button" -ForegroundColor Green
    }
    
    # Save the file if it was modified
    if ($fileModified) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        $filesModified++
        Write-Host "  ✓ Updated: $relativePath" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Update Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Total HTML files processed: $totalFiles" -ForegroundColor White
Write-Host "Files with 'Digits' text replaced: $filesWithDigits" -ForegroundColor White
Write-Host "Files with Get Started button added: $filesWithNoSignUpButton" -ForegroundColor White
Write-Host "Total files modified: $filesModified" -ForegroundColor Green
Write-Host ""
