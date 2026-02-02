# Script to update navigation menu:
# 1. Replace "Why Finora?" with "About Us"
# 2. Replace "Why Digits?" with "About Us"

$files = Get-ChildItem -Path "c:\projects\ai" -Filter "*.html" -Recurse -File

foreach ($file in $files) {
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        $modified = $false
        
        # Replace "Why Finora?" with "About Us"
        if ($content -match 'Why Finora\?') {
            $content = $content -replace 'Why Finora\?', 'About Us'
            $modified = $true
            Write-Host "Updated 'Why Finora?' to 'About Us' in: $($file.FullName)"
        }
        
        # Replace "Why Digits?" with "About Us"
        if ($content -match 'Why Digits\?') {
            $content = $content -replace 'Why Digits\?', 'About Us'
            $modified = $true
            Write-Host "Updated 'Why Digits?' to 'About Us' in: $($file.FullName)"
        }
        
        if ($modified) {
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
            Write-Host "Saved changes to: $($file.FullName)" -ForegroundColor Green
        }
    }
    catch {
        Write-Host "Error processing $($file.FullName): $_" -ForegroundColor Red
    }
}

Write-Host "`nNavigation update complete!" -ForegroundColor Cyan
