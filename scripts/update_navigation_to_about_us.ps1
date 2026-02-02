# Script to update navigation menu - remove Why Finora dropdown, replace with About Us link

Write-Host "Starting navigation menu update..." -ForegroundColor Green

# Get all HTML files
$htmlFiles = Get-ChildItem -Path "c:\projects\ai\" -Filter "*.html" -Recurse

$updatedCount = 0

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.FullName)" -ForegroundColor Cyan
    
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Pattern 1: Desktop navigation - Replace entire Why Finora dropdown with simple About Us link
    $pattern1 = '(?s)<li class="top-nav-item top-nav-dropdown"[^>]*>\s*<span class="top-nav-link"[^>]*>\s*Why Finora \?.*?</li>'
    $replacement1 = @'
<li class="top-nav-item" data-astro-cid-e4bd7mep>
 <a href="about-us/" class="top-nav-link" data-astro-cid-e4bd7mep> About Us </a>
 </li>
'@
    
    $content = $content -replace $pattern1, $replacement1
    
    # Pattern 2: Mobile navigation - Replace About Us mobile dropdown
    $pattern2 = '(?s)<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>\s*<a class="top-nav-mobile-link-dropdown"[^>]*>\s*About Us.*?</ul>\s*</li>'
    $replacement2 = @'
<li class="top-nav-mobile-item" data-astro-cid-u5h4fmsv>
 <a href="about-us/" class="top-nav-mobile-link" data-astro-cid-u5h4fmsv> About Us </a>
 </li>
'@
    
    $content = $content -replace $pattern2, $replacement2
    
    # If content changed, save the file
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8 -NoNewline
        $updatedCount++
        Write-Host "  Updated" -ForegroundColor Green
    } else {
        Write-Host "  - No changes needed" -ForegroundColor Gray
    }
}

Write-Host "`nUpdate complete!" -ForegroundColor Green
Write-Host "Total files updated: $updatedCount" -ForegroundColor Green
