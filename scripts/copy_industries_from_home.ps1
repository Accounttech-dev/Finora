# Script to copy Industries menu from home page to all other pages
# This version reads the exact HTML from index.html and copies it to other pages

$rootPath = "c:\projects\Finora"
$sourceFile = Join-Path $rootPath "index.html"

# Read the source file
$sourceContent = Get-Content $sourceFile -Raw -Encoding UTF8

# Extract desktop Industries menu (from line 592 to 733 approximately)
# Pattern: Start from "Industries" dropdown to the closing </style>
$desktopPattern = '(?s)(<li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep>\s+<span class="top-nav-link" data-astro-cid-e4bd7mep>Industries.*?</style>)'
if ($sourceContent -match $desktopPattern) {
    $desktopMenu = $matches[1]
    Write-Host "✓ Extracted desktop Industries menu" -ForegroundColor Green
} else {
    Write-Host "✗ Could not extract desktop menu" -ForegroundColor Red
    exit
}

# Extract mobile Industries menu (from line 941 to 1147 approximately)
$mobilePattern = '(?s)(<li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv>\s+<a\s+class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv>Industries.*?</li>\s+<li class="top-nav-mobile-item top-nav-mobile-dropdown")'
if ($sourceContent -match $mobilePattern) {
    # Remove the last part that matches the next menu item
    $mobileMenu = $matches[1] -replace '<li class="top-nav-mobile-item top-nav-mobile-dropdown"[^>]*>$', ''
    $mobileMenu = $mobileMenu.TrimEnd()
    Write-Host "✓ Extracted mobile Industries menu" -ForegroundColor Green
} else {
    Write-Host "✗ Could not extract mobile menu" -ForegroundColor Red
    exit
}

# Define target pages
$pages = @(
    @{Path="about-us\index.html"; Depth=1},
    @{Path="contact-us\index.html"; Depth=1},
    @{Path="services\ask-finora\index.html"; Depth=2},
    @{Path="services\bookkeeping\index.html"; Depth=2},
    @{Path="services\month-end-close\index.html"; Depth=2},
    @{Path="services\dashboards\index.html"; Depth=2},
    @{Path="services\financials\index.html"; Depth=2},
    @{Path="services\bill-pay\index.html"; Depth=2},
    @{Path="services\invoicing\index.html"; Depth=2},
    @{Path="services\business-setup\index.html"; Depth=2},
    @{Path="accountants\index.html"; Depth=1},
    @{Path="accountants\month-end-close\index.html"; Depth=2}
)

foreach ($page in $pages) {
    $filePath = Join-Path $rootPath $page.Path
    
    if (-not (Test-Path $filePath)) {
        Write-Host "`nFile not found: $filePath" -ForegroundColor Red
        continue
    }
    
    Write-Host "`nProcessing: $($page.Path)" -ForegroundColor Cyan
    
    $content = Get-Content $filePath -Raw -Encoding UTF8
    
    # Check if already has Industries menu
    if ($content -match 'Industries <span class="top-nav-dropdown-icon"') {
        Write-Host "  Already has Industries menu, skipping..." -ForegroundColor Yellow
        continue
    }
    
    # Adjust paths based on depth
    $adjustedDesktopMenu = $desktopMenu
    $adjustedMobileMenu = $mobileMenu
    
    if ($page.Depth -eq 1) {
        # Replace /services/ with services/ for depth 1 pages
        $adjustedDesktopMenu = $adjustedDesktopMenu -replace 'href="services/', 'href="../services/'
        $adjustedMobileMenu = $adjustedMobileMenu -replace 'href="/services/', 'href="../services/'
    } elseif ($page.Depth -eq 2) {
        # Replace /services/ with ../../services/ for depth 2 pages
        $adjustedDesktopMenu = $adjustedDesktopMenu -replace 'href="services/', 'href="../../services/'
        $adjustedMobileMenu = $adjustedMobileMenu -replace 'href="/services/', 'href="../../services/'
    }
    
    # Insert desktop menu after Accountants menu
    $accountantsPattern = '(</ul>\s+</li>\s+<li class="top-nav-item top-nav-dropdown" data-astro-cid-e4bd7mep> </span>)'
    if ($content -match $accountantsPattern) {
        $content = $content -replace $accountantsPattern, "</ul>`r`n            </li>`r`n`r`n            $adjustedDesktopMenu`r`n            <li class=`"top-nav-item top-nav-dropdown`" data-astro-cid-e4bd7mep> </span>"
        Write-Host "  ✓ Added desktop Industries menu" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Could not find desktop insertion point" -ForegroundColor Red
    }
    
    # Insert mobile menu after mobile Accountants menu  
    $mobileAccountantsPattern = '(</ul>\s+</li>\s+<li class="top-nav-mobile-item top-nav-mobile-dropdown" data-astro-cid-u5h4fmsv> <a\s+class="top-nav-mobile-link-dropdown" role="button" data-astro-cid-u5h4fmsv> Resources)'
    if ($content -match $mobileAccountantsPattern) {
        $content = $content -replace $mobileAccountantsPattern, "</ul>`r`n            </li>`r`n`r`n            $adjustedMobileMenu`r`n`r`n            <li class=`"top-nav-mobile-item top-nav-mobile-dropdown`" data-astro-cid-u5h4fmsv> <a class=`"top-nav-mobile-link-dropdown`" role=`"button`" data-astro-cid-u5h4fmsv> Resources"
        Write-Host "  ✓ Added mobile Industries menu" -ForegroundColor Green
    } else {
        Write-Host "  ✗ Could not find mobile insertion point" -ForegroundColor Red
    }
    
    # Save file
    Set-Content -Path $filePath -Value $content -Encoding UTF8 -NoNewline
    Write-Host "  ✓ File saved" -ForegroundColor Green
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Complete!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
