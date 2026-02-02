$cssRule = "@media(max-width:767px){.login-link,#login-link,#login-link-mobile{display:none!important}}"
$cssDirectory = "c:\projects\ai\ram.digitscpu.com\_astro-assets"

Get-ChildItem -Path $cssDirectory -Filter "*.css" | ForEach-Object {
    $filePath = $_.FullName
    $content = Get-Content -Path $filePath -Raw
    
    # Check if the rule already exists
    if ($content -notlike "*login-link*") {
        # Append the CSS rule to the file
        Add-Content -Path $filePath -Value $cssRule -NoNewline
        Write-Host "Added CSS rule to: $($_.Name)" -ForegroundColor Green
    } else {
        Write-Host "Rule already exists in: $($_.Name)" -ForegroundColor Yellow
    }
}

Write-Host "`nDone! Mobile Sign in links hidden in all CSS files." -ForegroundColor Cyan
