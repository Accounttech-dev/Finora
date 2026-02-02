# Script to replace "About Us" dropdown with simple "About Us" link
# This script finds the "About Us" dropdown section and replaces it with a simple link

$htmlFiles = Get-ChildItem -Path "C:\projects\ai" -Filter "*.html" -Recurse | Where-Object {
    $_.FullName -notlike "*\node_modules\*" -and
    $_.FullName -notlike "*\.git\*"
}

Write-Host "Found $($htmlFiles.Count) HTML files to process."

foreach ($file in $htmlFiles) {
    Write-Host "`nProcessing: $($file.FullName)"
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Desktop navigation - Replace "About Us" dropdown with simple link
    $desktopPattern = @"
<li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep>\s*<span class="top-nav-link" data-astro-cid-e4bd7mep>\s*About Us.*?</span>\s*<ul class="dropdown-menu">.*?</ul>\s*</li>
"@
    
    $desktopReplacement = @"
<li class="top-nav-item" data-astro-cid-e4bd7mep>
 <a href="about-us/" class="top-nav-link" data-astro-cid-e4bd7mep> About Us </a>
 </li>
"@
    
    $content = $content -replace $desktopPattern, $desktopReplacement
    
    # Mobile navigation - Replace "About Us" dropdown with simple link
    $mobilePattern = @"
<li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv>\s*<a class="top-nav-mobile-link-dropdown".*?>.*?About Us.*?</a>\s*<ul class="dropdown-menu">.*?</ul>\s*</li>
"@
    
    $mobileReplacement = @"
<li class="top-nav-mobile-item" data-astro-cid-u5h4fmsv>
 <a href="about-us/" class="top-nav-mobile-link" data-astro-cid-u5h4fmsv> About Us </a>
 </li>
"@
    
    $content = $content -replace $mobilePattern, $mobileReplacement
    
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        Write-Host "  - Updated successfully" -ForegroundColor Green
    } else {
        Write-Host "  - No changes needed" -ForegroundColor Yellow
    }
}

Write-Host "`nScript execution completed!" -ForegroundColor Cyan
