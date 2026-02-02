# Script to update site title and favicon from Digits to Finora

# Find all HTML files
$htmlFiles = Get-ChildItem -Path "c:\projects\ai" -Filter "*.html" -Recurse -File

$titleUpdates = 0
$faviconUpdates = 0

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    $updated = $false
    
    # Update title tags - Replace "Digits" with "Finora" in title tags
    if ($content -match '<title>.*Digits.*</title>') {
        $content = $content -replace '(<title>)Digits(.*?</title>)', '$1Finora$2'
        $updated = $true
        $titleUpdates++
        Write-Host "Updated title in: $($file.FullName)" -ForegroundColor Green
    }
    
    # Update meta og:title - Replace "Digits" with "Finora"
    if ($content -match '<meta property="og:title" content=".*Digits.*"') {
        $content = $content -replace '(<meta property="og:title" content=")Digits(.*?")', '$1Finora$2'
        $updated = $true
        Write-Host "Updated og:title in: $($file.FullName)" -ForegroundColor Green
    }
    
    # Update twitter:title - Replace "Digits" with "Finora"
    if ($content -match '<meta property="twitter:title" content=".*Digits.*"') {
        $content = $content -replace '(<meta property="twitter:title" content=")Digits(.*?")', '$1Finora$2'
        $updated = $true
        Write-Host "Updated twitter:title in: $($file.FullName)" -ForegroundColor Green
    }
    
    # Save if updated
    if ($updated) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
    }
}

Write-Host "`n=== Update Summary ===" -ForegroundColor Cyan
Write-Host "Files with title updates: $titleUpdates" -ForegroundColor Yellow
Write-Host "`nNext steps:" -ForegroundColor Cyan
Write-Host "1. Replace favicon files in the /favicon directory with Finora branded icons" -ForegroundColor White
Write-Host "2. The HTML files already reference the favicon directory correctly" -ForegroundColor White
