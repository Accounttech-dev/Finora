# Script to replace "Why Finora?" dropdown with simple "About Us" link
Write-Host "Replacing Why Finora dropdown with About Us link..." -ForegroundColor Cyan

$htmlFiles = Get-ChildItem -Path "c:\projects\ai" -Filter "*.html" -Recurse
$updateCount = 0

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Pattern 1: Replace the desktop dropdown menu item with simple link
    # Find: <li class="top-nav-item top-nav-dropdown"...>Why Finora?...</li>
    # Replace with: <li class="top-nav-item"><a href="/about-us/" class="top-nav-link">About Us</a></li>
    
    $pattern1 = '(?s)<li class="top-nav-item top-nav-dropdown"[^>]*>\s*<span class="top-nav-link"[^>]*>\s*Why Finora\?\s*<span class="top-nav-dropdown-icon"[^>]*></span>\s*</span>\s*<ul class="dropdown-menu">.*?</ul>\s*</li>'
    $replacement1 = '<li class="top-nav-item" data-astro-cid-e4bd7mep> <a href="../about-us/" class="top-nav-link" data-astro-cid-e4bd7mep> About Us </a> </li>'
    
    $content = $content -replace $pattern1, $replacement1
    
    # Pattern 2: Replace mobile dropdown menu
    $pattern2 = '(?s)<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>\s*<a class="top-nav-mobile-link-dropdown"[^>]*>\s*Why Digits\?.*?</ul>\s*</li>'
    $replacement2 = '<li class="top-nav-mobile-item" data-astro-cid-u5h4fmsv> <a href="../about-us/" class="top-nav-mobile-link" data-astro-cid-u5h4fmsv> About Us </a> </li>'
    
    $content = $content -replace $pattern2, $replacement2
    
    # Also replace "Why Finora?" text with "About Us" if found standalone
    $content = $content -replace 'Why Finora\?', 'About Us'
    
    # If content changed, save the file
    if ($content -ne $originalContent) {
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.UTF8Encoding]::new($false))
        $updateCount++
        Write-Host "  Updated: $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host "`nReplacement complete!" -ForegroundColor Green
Write-Host "Updated $updateCount HTML files" -ForegroundColor Cyan
Write-Host "Why Finora dropdown has been replaced with About Us link" -ForegroundColor White
