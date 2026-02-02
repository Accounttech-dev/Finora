# Fix About Us links to use absolute paths instead of relative paths

$htmlFiles = Get-ChildItem -Path "C:\projects\ai" -Filter "*.html" -Recurse | Where-Object {
    $_.FullName -notlike "*\node_modules\*" -and
    $_.FullName -notlike "*\.git\*"
}

Write-Host "Found $($htmlFiles.Count) HTML files to process." -ForegroundColor Cyan

$updatedCount = 0

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Fix desktop navigation - change relative path to absolute path
    $content = $content -replace 'href="about-us/"', 'href="/about-us/"'
    
    # Also fix paths that might have ../ prefix
    $content = $content -replace 'href="../about-us/"', 'href="/about-us/"'
    
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "Updated: $($file.FullName)" -ForegroundColor Green
        $updatedCount++
    }
}

Write-Host "`nTotal files updated: $updatedCount" -ForegroundColor Cyan
Write-Host "Script execution completed!" -ForegroundColor Green
