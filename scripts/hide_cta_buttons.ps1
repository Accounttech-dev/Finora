# CSS rules to hide both Sign in links and Start free trial buttons
$cssRules = @"
button[data-modal='get-started']{display:none!important}
"@

$cssDirectory = "c:\projects\ai\ram.digitscpu.com\_astro-assets"

Write-Host "Adding CSS rules to hide Start free trial buttons..." -ForegroundColor Cyan

Get-ChildItem -Path $cssDirectory -Filter "*.css" | ForEach-Object {
    $filePath = $_.FullName
    $content = Get-Content -Path $filePath -Raw
    
    # Check if the rules already exist
    if ($content -notlike "*data-modal*get-started*") {
        # Append the CSS rules to the file
        Add-Content -Path $filePath -Value $cssRules -NoNewline
        Write-Host "Added CSS rules to: $($_.Name)" -ForegroundColor Green
    } else {
        Write-Host "Rules already exist in: $($_.Name)" -ForegroundColor Yellow
    }
}

Write-Host "`nDone! Start free trial buttons are now hidden." -ForegroundColor Cyan
